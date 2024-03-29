/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Cidade;
import br.ufpr.tads.beans.Endereco;
import br.ufpr.tads.beans.Funcao;
import br.ufpr.tads.beans.Login;
import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.exception.ParametroFormularioException;
import br.ufpr.tads.exception.UsuarioException;
import br.ufpr.tads.facade.UsuarioFacade;
import jakarta.security.auth.message.AuthException;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.regex.Pattern;

/**
 *
 * @author Gabriel Jesus Peres
 */
@WebServlet(name = "AutenticacaoServlet", urlPatterns = {"/AutenticacaoServlet"})
public class AutenticacaoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        RequestDispatcher rdIndexJSP = getServletContext().getRequestDispatcher("/Autenticacao/login.jsp");
        RequestDispatcher erroJSP = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
        
        if ("index".equals(action) || action == null) {
            rdIndexJSP.forward(request, response);
        } else if ("create".equals(action)) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Autenticacao/createUser.jsp");
            rd.forward(request, response);
        } else if ("save".equals(action)) {
            try {
                Usuario usuario = new Usuario();
                Funcao funcao = new Funcao(1, "Cliente");
                usuario.setFuncao(funcao);

                String nomeCompleto = validarInput(request.getParameter("nome"));
                String email = validarEmail(request.getParameter("email"));
                String CPF = validarCPFouTelefone(request.getParameter("CPF"), "CPF");
                String telefone = validarCPFouTelefone(request.getParameter("telefone"), "telefone");
                String senha = validarInput(request.getParameter("senha"));

                // Set de atributos básicos do bean de Usuário
                usuario.setNomeCompleto(nomeCompleto);
                usuario.setEmail(email);
                usuario.setCpf(CPF);
                usuario.setTelefone(telefone);
                usuario.setSenha(senha);

                // Bean de endereço
                Endereco endereco = new Endereco();

                String CEP = validarInput(request.getParameter("CEP")).replaceAll("[^0-9]", "");
                String logradouro = validarInput(request.getParameter("logradouro"));
                String bairro = validarInput(request.getParameter("bairro"));
                String complemento = validarInput(request.getParameter("complemento"));
                int idCidade = Integer.parseInt(request.getParameter("cidade"));
                int numero = Integer.parseInt(request.getParameter("numero"));

                Cidade cidade = new Cidade();
                cidade.setCidadeId(idCidade);

                // Define o bean de Endereço do Usuário
                endereco.setCidade(cidade);
                endereco.setCep(CEP);
                endereco.setRua(logradouro);
                endereco.setNumero(numero);
                endereco.setBairro(bairro);
                endereco.setComplemento(complemento);
                // Set esse bean no obj. usuário
                usuario.setEndereco(endereco);

                UsuarioFacade.cadastrarUsuario(usuario);
                
                response.sendRedirect("AutenticacaoServlet?action=index");
            } catch (NumberFormatException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao converter o parâmetro do formulário em número: " + e.getMessage());
                erroJSP.forward(request, response);
            } catch (ParametroFormularioException e) {
                request.setAttribute("mensagem", "Ocorreu um erro durante a validação de parâmetros do formulário: " + e.getMessage());
                erroJSP.forward(request, response);
            } catch (UsuarioException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao cadastrar o Usuário: " + e.getMessage());
                erroJSP.forward(request, response);
            }
        } else if ("login".equals(action)) {
            try {
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");

                if (email.isEmpty() || senha.isEmpty()) {
                    throw new AuthException();
                }

                Login login = UsuarioFacade.efetuarLogin(email, senha);

                if (login != null) {
                    session.setAttribute("login", login);

                    // Com base na função/role -> redireciona o usuário logado para
                    // a página correspondente
                    switch (login.getFuncao().getFuncaoId()) {
                        case 1:
                            response.sendRedirect("ClienteServlet?action=index");
                            break;
                        case 2:
                            response.sendRedirect("FuncionarioServlet?action=index");
                            break;
                        case 3:
                            response.sendRedirect("GerenteServlet?action=index");
                            break;
                    }
                } else {
                    request.setAttribute("mensagem", "Email/Senha inválidos");
                    rdIndexJSP.forward(request, response);
                }
            } catch (UsuarioException e) {
                request.setAttribute("mensagem", e.getMessage());
                rdIndexJSP.forward(request, response);
            } catch (AuthException e) {
                request.setAttribute("mensagem", "Email/Senha inválidos");
                rdIndexJSP.forward(request, response);
            }
        } else if ("logout".equals(action)) {
            if (session != null) {
                session.invalidate();
            }
            request.setAttribute("mensagem", "Usuário desconectado com sucesso");
            rdIndexJSP.forward(request, response);
        }
    }
        
    private static String validarInput(String input) throws ParametroFormularioException {
        if (input == null || input.isBlank()) {
            throw new ParametroFormularioException("Parâmetro não pode ser vazio");
        }
        if (input.trim().length() < 3) {
            throw new ParametroFormularioException("Parâmetro precisa ter mais do que 3 letras");
        }
        return input.trim();
    }

    private static String validarEmail(String email) throws ParametroFormularioException {
        if (email == null || email.isBlank()) {
            throw new ParametroFormularioException("O email não pode ser vazio");
        }

        boolean isEmailValido = Pattern.compile("^(.+)@(.+)$").matcher(email.trim()).matches();
        if (!isEmailValido) {
            throw new ParametroFormularioException("Email inválido");
        }

        return email.trim();
    }

    private static String validarCPFouTelefone(String str, String tipo) throws ParametroFormularioException {

        if (str == null || str.isBlank()) {
            throw new ParametroFormularioException("O " + tipo + " não pode ser vazio");
        }
        if (str.trim().replaceAll("[^0-9]", "").length() != 11) {
            throw new ParametroFormularioException("O " + tipo + " precisa ter 11 dígitos");
        }

        return str.trim().replaceAll("[^0-9]", "");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
