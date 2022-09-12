/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Atendimento;
import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.beans.Cidade;
import br.ufpr.tads.beans.Endereco;
import br.ufpr.tads.beans.Funcao;
import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.exception.AtendimentoException;
import br.ufpr.tads.exception.GerenteException;
import br.ufpr.tads.exception.ParametroFormularioException;
import br.ufpr.tads.exception.UsuarioException;
import br.ufpr.tads.facade.AtendimentoFacade;
import br.ufpr.tads.facade.GerenteFacade;
import br.ufpr.tads.facade.UsuarioFacade;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/**
 *
 * @author Gabril
 */
@WebServlet(name = "GerenteServlet", urlPatterns = {"/GerenteServlet"})
public class GerenteServlet extends HttpServlet {

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

        String action = request.getParameter("action");

        try {
            if ("atendimentosAbertos".equals(action)) {
                List<Atendimento> atendimentosAbertos = buscarAtendimentosAbertos(request);
                request.setAttribute("listaAtendimentosAbertos", atendimentosAbertos);
                Date dataSeteDias = calcularDataSeteDiasAtras();
                request.setAttribute("dataSeteDiasAtras", dataSeteDias);
                redirectTo("/Gerente/atendimentoAberto.jsp", request, response);
            } else if ("todosAtendimentos".equals(action)) {
                List<Atendimento> atendimentos = buscarTodosAtendimentos(request);
                request.setAttribute("listaAtendimentos", atendimentos);
                Date dataSeteDias = calcularDataSeteDiasAtras();
                request.setAttribute("dataSeteDiasAtras", dataSeteDias);
                redirectTo("/Gerente/todosAtendimentos.jsp", request, response);
            } else if ("cadastrar".equals(action)) {
                cadastrarColaborador(request, response);
                redirectTo("/GerenteServlet?action=listarColaboradores", request, response);
            } else if ("editar".equals(action)) {
                editarColaborador(request, response);
                redirectTo("/GerenteServlet?listarColaboradores", request, response);
            } else if ("formCadastrar".equals(action)) {
                redirectTo("/Gerente/cadastroColaborador.jsp", request, response);
            } else if ("formEditar".equals(action)) {
                Usuario usuario = buscarUsuario(request);
                if (usuario != null) {
                    request.setAttribute("usuario", usuario);
                    request.setAttribute("form", "alterar");
                    redirectTo("/Gerente/cadastroColaborador.jsp", request, response);
                }
            } else if ("formExibir".equals(action)) {
                Usuario usuario = buscarUsuario(request);
                if (usuario != null) {
                    request.setAttribute("usuario", usuario);
                    redirectTo("/Gerente/exibirColaborador.jsp", request, response);
                }
            } else if ("listarColaboradores".equals(action)) {
                List<Usuario> usuarios = buscarColaboradores();
                request.setAttribute("colaboradores", usuarios);
                redirectTo("/Gerente/listaColaborador.jsp", request, response);
            } else {
                montarInformacoesAdministrativas(request);
                redirectTo("/Gerente/index.jsp", request, response);
            }
        } catch (GerenteException ex) {
            request.setAttribute("mensagem", ex.toString());
            redirectTo("/Erro/erro.jsp", request, response);
        }
    }

    private List<Atendimento> buscarAtendimentosAbertos(HttpServletRequest request) throws GerenteException {
        try {
            List<Atendimento> atendimentosAbertos = AtendimentoFacade.buscarTodosAtendimentosAbertos();
            return atendimentosAbertos; //DEVE ESTAR -> ORDER BY DESC
        } catch (AtendimentoException ex) {
            throw new GerenteException("[GERENTE] Falha ao buscar atendimentos abertos");
        }
    }

    private List<Atendimento> buscarTodosAtendimentos(HttpServletRequest request) throws GerenteException {
        try {
            List<Atendimento> todosAtendimentos = AtendimentoFacade.buscarTodosAtendimentos();
            return todosAtendimentos; //DEVE ESTAR -> ORDER BY DESC
        } catch (AtendimentoException ex) {
            throw new GerenteException("[GERENTE] Falha ao buscar todos atendimentos");
        }
    }

    private Date calcularDataSeteDiasAtras() {
        LocalDateTime lt = LocalDateTime.now();
        lt = lt.minusDays(7);
        Date data = Date.from(lt.toInstant(ZoneOffset.UTC));
        return data;
    }

    private void montarInformacoesAdministrativas(HttpServletRequest request) throws GerenteException {
        int totalAtendimentosResolvidos = buscarTotalAtendimentosResolvidos();
        Map.Entry<Integer, Double> totalAtendimentoAbertosPeloTotal = buscarTotalAtendimentosAbertosPeloTotal();
        Map<Categoria, String> totalAbertoPorCategoria = buscarAtendimentosPorCategoria();
        request.setAttribute("totalResolvidos", totalAtendimentosResolvidos);
        request.setAttribute("atendimentosAbertosPorTotal", totalAtendimentoAbertosPeloTotal);
        request.setAttribute("totalPorCategoria", totalAbertoPorCategoria.entrySet());
    }

    private int buscarTotalAtendimentosResolvidos() throws GerenteException {
        return GerenteFacade.buscarAtendimentosResolvidos();
    }

    private Map.Entry<Integer, Double> buscarTotalAtendimentosAbertosPeloTotal() throws GerenteException {
        Map<Integer, Double> totalAtendimentoAbertosPeloTotal = GerenteFacade.buscarRelacaoAtendimentosAbertosPorTotal();
        Map.Entry<Integer, Double> mapTotalAtendimento = totalAtendimentoAbertosPeloTotal.entrySet().iterator().next();
        return mapTotalAtendimento;
    }

    private Map<Categoria, String> buscarAtendimentosPorCategoria() throws GerenteException {
        return GerenteFacade.buscarRelacaoAtendimentoPorCategoria();
    }

    private void cadastrarColaborador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Usuario usuario = tratarUsuarioPreenchido(request);
            UsuarioFacade.cadastrarUsuario(usuario);
        } catch (ParametroFormularioException e) {
            request.setAttribute("mensagem", "Ocorreu um erro durante a validação de parâmetros do formulário: " + e.getMessage());
            redirectTo("/Erro/erro.jsp", request, response);
        } catch (UsuarioException e) {
            request.setAttribute("mensagem", "Ocorreu um erro ao cadastrar o Usuário: " + e.getMessage());
            redirectTo("/Erro/erro.jsp", request, response);
        }
    }

    private void editarColaborador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Usuario usuario = tratarUsuarioPreenchido(request);
            usuario.setUsuarioId(Integer.parseInt(request.getParameter("id")));
            usuario.getEndereco().setEnderecoId(Integer.parseInt(request.getParameter("estadoId")));
            UsuarioFacade.atualizarUsuario(usuario);
        } catch (NumberFormatException ex) {
            request.setAttribute("mensagem", "Id do colaborador inválido: " + ex.getMessage());
            redirectTo("/Erro/erro.jsp", request, response);
        } catch (ParametroFormularioException e) {
            request.setAttribute("mensagem", "Ocorreu um erro durante a validação de parâmetros do formulário: " + e.getMessage());
            redirectTo("/Erro/erro.jsp", request, response);
        } catch (UsuarioException e) {
            request.setAttribute("mensagem", "Ocorreu um erro ao cadastrar o Usuário: " + e.getMessage());
            redirectTo("/Erro/erro.jsp", request, response);
        }
    }

    private Usuario tratarUsuarioPreenchido(HttpServletRequest request) throws ParametroFormularioException {
        try {
            Usuario usuario = new Usuario();

            String funcaoId = request.getParameter("funcao");
            Funcao funcao = new Funcao();
            funcao.setFuncaoId(Integer.parseInt(funcaoId));
            usuario.setFuncao(funcao);

            String nomeCompleto = validarInput(request.getParameter("nome"));
            String email = validarEmail(request.getParameter("email"));
            String CPF = validarCPFouTelefone(request.getParameter("cpf"), "CPF");
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

            String CEP = validarInput(request.getParameter("cep")).replaceAll("[^0-9]", "");
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
            return usuario;
        } catch (NumberFormatException ex) {
            throw new ParametroFormularioException("Erro tratando dados do usuário");
        }
    }

    private Usuario buscarUsuario(HttpServletRequest request) throws GerenteException {
        try {
            String id = request.getParameter("id");
            if (!isNullOrEmpty(id)) {
                int usuarioId = Integer.parseInt(id);
                Usuario usuario = UsuarioFacade.buscarUsuarioPorId(usuarioId);
                return usuario;
            }
            return null;
        } catch (NumberFormatException ex) {
            throw new GerenteException("Parâmetro ID inválido");
        } catch (UsuarioException ex) {
            throw new GerenteException("Problema ao buscar o usuário");
        }
    }

    private List<Usuario> buscarColaboradores() throws GerenteException {
        try {
            List<Usuario> usuarios = UsuarioFacade.buscarColaboradores();
            return usuarios;
        } catch (UsuarioException ex) {
            throw new GerenteException("Problema ao buscar todos os usuários");
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

    private <T> boolean isNullOrEmpty(T input) {
        return input == null || input.toString().isBlank();
    }

    private void redirectTo(String destino, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(destino);
        rd.forward(request, response);
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
