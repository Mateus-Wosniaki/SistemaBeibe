package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Atendimento;
import br.ufpr.tads.beans.Login;
import br.ufpr.tads.beans.Produto;
import br.ufpr.tads.beans.Situacao;
import br.ufpr.tads.beans.TipoAtendimento;
import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.exception.AtendimentoException;
import br.ufpr.tads.exception.ParametroFormularioException;
import br.ufpr.tads.exception.ProdutoException;
import br.ufpr.tads.exception.UsuarioException;
import br.ufpr.tads.facade.AtendimentoFacade;
import br.ufpr.tads.facade.ProdutoFacade;
import br.ufpr.tads.facade.UsuarioFacade;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Gabriel Jesus Peres
 */
@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {

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

        request.setCharacterEncoding("UTF-8");

        // Verifica se o usuário está logado
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/AutenticacaoServlet?action=index");
            request.setAttribute("mensagem", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }

        String action = request.getParameter("action");
        RequestDispatcher erroJSP = getServletContext().getRequestDispatcher("/Erro/erro.jsp");

        Login login = (Login) session.getAttribute("login");
        
        // Se o login não for de uma pessoa autorizada, redireciona para erro.jsp
        if (login.getFuncao().getFuncaoId() != 1) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
            request.setAttribute("mensagem", "Você não possui permissão para acessar o conteúdo");
            rd.forward(request, response);
        }

        if ("index".equals(action) || action == null) {
            try {
                List<Atendimento> atendimentos = AtendimentoFacade.buscarAtendimentosPorCliente(login.getUsuarioId());
                request.setAttribute("atendimentos", atendimentos);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Cliente/index.jsp");
                rd.forward(request, response);
            } catch (AtendimentoException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar a lista de atendimentos: " + e);
                erroJSP.forward(request, response);
            }
        } else if ("atendimento".equals(action)) {
            try {
                int idAtendimento = Integer.parseInt(request.getParameter("atendimento"));

                Atendimento atendimento = AtendimentoFacade.buscarAtendimentoPorId(idAtendimento);
                request.setAttribute("atendimento", atendimento);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Cliente/serviceResume.jsp");
                rd.forward(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar o ID do Atendimento selecionado: " + e);
                erroJSP.forward(request, response);
            } catch (AtendimentoException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar as informações do atendimento selecionado: " + e);
                erroJSP.forward(request, response);
            }
        } else if ("perfil".equals(action)) {
            try {
                Usuario usuario = UsuarioFacade.buscarUsuarioPorId(login.getUsuarioId());
                request.setAttribute("usuario", usuario);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Cliente/updateUser.jsp");
                rd.forward(request, response);
            } catch (UsuarioException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar as informações do usuário: " + e);
                erroJSP.forward(request, response);
            }
        } else if ("update".equals(action)) {
            try {
                Usuario usuario = UsuarioFacade.buscarUsuarioPorId(login.getUsuarioId());
                
                String nomeCompleto = validarInput(request.getParameter("nome"));
                usuario.setNomeCompleto(nomeCompleto);
                
                String telefone = validarCPFouTelefone(request.getParameter("telefone"), "telefone");
                usuario.setTelefone(telefone);
                
                String CEP = validarInput(request.getParameter("cep")).replaceAll("[^0-9]", "");
                usuario.getEndereco().setCep(CEP);
                
                String logradouro = validarInput(request.getParameter("logradouro"));
                usuario.getEndereco().setRua(logradouro);
                
                int numero = Integer.parseInt(request.getParameter("numero"));
                usuario.getEndereco().setNumero(numero);
                
                String complemento = validarInput(request.getParameter("complemento"));
                usuario.getEndereco().setComplemento(complemento);
                
                String bairro = validarInput(request.getParameter("bairro"));
                usuario.getEndereco().setBairro(bairro);
                
                UsuarioFacade.atualizarUsuario(usuario);
            } catch (UsuarioException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao atualizar ou buscar as informações do usuário: " + e);
                erroJSP.forward(request, response);
            } catch (ParametroFormularioException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar as informações do formulário: " + e);
                erroJSP.forward(request, response);
            }
        } else if ("formAtendimento".equals(action)) {
            try {
                List<Produto> produtos = ProdutoFacade.buscarTodosProdutos();
                request.setAttribute("produtos", produtos);

                List<TipoAtendimento> tiposAtendimento = AtendimentoFacade.buscarTodosTiposAtendimento();
                request.setAttribute("tiposAtendimento", tiposAtendimento);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/Cliente/createService.jsp");
                rd.forward(request, response);
            } catch (ProdutoException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar a lista de produtos: " + e);
                erroJSP.forward(request, response);
            } catch (AtendimentoException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar a lista de tipos de atendimento: " + e);
                erroJSP.forward(request, response);
            }
        } else if ("novoAtendimento".equals(action)) {
            Atendimento atendimento = new Atendimento();
            try {
                Usuario usuario = UsuarioFacade.buscarUsuarioPorId(login.getUsuarioId());
                atendimento.setCliente(usuario);

                atendimento.setDataCriacao(new Date());

                String descricao = validarInput(request.getParameter("descricao"));
                atendimento.setDescricao(descricao);

                int idProduto = Integer.parseInt(request.getParameter("produto"));
                Produto produto = ProdutoFacade.buscarProdutoPorId(idProduto);
                atendimento.setProduto(produto);

                int idTipoAtendimento = Integer.parseInt(request.getParameter("tipo"));
                TipoAtendimento tipoAtendimento = AtendimentoFacade.buscarTipoAtendimento(idTipoAtendimento);
                atendimento.setTipoAtendimento(tipoAtendimento);

                Situacao situacao = new Situacao();
                situacao.setSituacaoId(1); // Situação Em Aberto por padrão
                atendimento.setSituacao(situacao);

                AtendimentoFacade.criarAtendimento(atendimento);
                response.sendRedirect("/ClienteServlet?action=index");
            } catch (UsuarioException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar as informações do usuário: " + e);
                erroJSP.forward(request, response);
            } catch (AtendimentoException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao criar o atendimento: " + e);
                erroJSP.forward(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao converter o ID do produto/tipo de atendimento: " + e);
                erroJSP.forward(request, response);
            } catch (ProdutoException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar o produto: " + e);
                erroJSP.forward(request, response);
            } catch (ParametroFormularioException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao recuperar a descrição, do formulário: " + e);
                erroJSP.forward(request, response);
            }
        } else if ("excluirAtendimento".equals(action)) {
            try {
                int idAtendimento = Integer.parseInt(request.getParameter("idAtendimento"));
                AtendimentoFacade.deletarAtendimento(idAtendimento);

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ClienteServlet?action=index");
                rd.forward(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao converter o ID do atendimento: " + e);
                erroJSP.forward(request, response);
            } catch (AtendimentoException e) {
                request.setAttribute("mensagem", "Ocorreu um erro ao excluir o atendimento: " + e);
                erroJSP.forward(request, response);
            }
        } else {
            request.setAttribute("mensagem", "404 - A página que você procura não existe (Action incorreta informada para a Controller)");
            erroJSP.forward(request, response);
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
