/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Atendimento;
import br.ufpr.tads.beans.Login;
import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.exception.AtendimentoException;
import br.ufpr.tads.exception.FuncionarioException;
import br.ufpr.tads.facade.AtendimentoFacade;
import br.ufpr.tads.facade.FuncionarioFacade;
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
import org.joda.time.DateTime;

/**
 *
 * @author Gabriel Jesus Peres, Mateus Wosniaki
 */
@WebServlet(name = "FuncionarioServlet", urlPatterns = {"/FuncionarioServlet"})
public class FuncionarioServlet extends HttpServlet {

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
        
        Login login = (Login) session.getAttribute("login");
        String action = request.getParameter("action");
        
        // Se o login não for de uma pessoa autorizada, redireciona para erro.jsp
        if (login.getFuncao().getFuncaoId() != 2) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
            request.setAttribute("mensagem", "Você não possui permissão para acessar o conteúdo");
            rd.forward(request, response);
        }
        
        try {
            if ("index".equals(action) || action == null) {
                
                DateTime dt = new DateTime().minusDays(7);
                Date dataCritica = dt.toDate();
                request.setAttribute("dataCritica", dataCritica);
                
                List<Atendimento> atendimentosEmAberto = buscarAtendimentosAbertos();
                request.setAttribute("atendimentos", atendimentosEmAberto);
                
                redirectTo("/Funcionario/atendimentos.jsp", request, response);
                
            } else if ("list".equals(action)) {
                
                DateTime dt = new DateTime().minusDays(7);
                Date dataCritica = dt.toDate();
                request.setAttribute("dataCritica", dataCritica);
                request.setAttribute("mostrarAbertoEmAmarelo", true);
                
                List<Atendimento> atendimentos = buscarTodosAtendimentos();
                
                request.setAttribute("atendimentos", atendimentos);
                redirectTo("/Funcionario/atendimentos.jsp", request, response);
                
            } else if ("resolverAtendimento".equals(action)) {
                
                resolverAtendimento(request);
                redirectTo("/FuncionarioServlet?action=index", request, response);
                
            } else if ("viewAtendimento".equals(action)) {
                
                int idCliente = Integer.parseInt(request.getParameter("id"));
                Atendimento atendimento = acessarAtendimento(idCliente);

                request.setAttribute("atendimento", atendimento);
                redirectTo("/Funcionario/resumoAtendimento.jsp", request, response);
                
            } else {
                
                request.setAttribute("mensagem", "404 - A página que você procura não existe (Action incorreta informada para a Controller)");
                redirectTo("/Erro/erro.jsp", request, response);
                
            }
        } catch (FuncionarioException ex) {
            request.setAttribute("mensagem", ex.toString());
            redirectTo("/Erro/erro.jsp", request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("mensagem", "Erro ao converter o parâmetro em inteiro: " + e.getMessage());
            redirectTo("/Erro/erro.jsp", request, response);
        }
    }

    private List<Atendimento> buscarAtendimentosAbertos() throws FuncionarioException {
        try {
            List<Atendimento> atendimentosAbertos = AtendimentoFacade.buscarTodosAtendimentosAbertos();
            return atendimentosAbertos; //DEVE ESTAR -> ORDER BY DESC
        } catch (AtendimentoException ex) {
            throw new FuncionarioException("[FUNCIONÁRIO] Falha ao buscar atendimentos abertos");
        }
    }

    private List<Atendimento> buscarTodosAtendimentos() throws FuncionarioException {
        try {
            List<Atendimento> todosAtendimentos = AtendimentoFacade.buscarTodosAtendimentos();
            return todosAtendimentos; //DEVE ESTAR -> ORDER BY DESC
        } catch (AtendimentoException ex) {
            throw new FuncionarioException("[FUNCIONÁRIO] Falha ao buscar todos atendimentos");
        }
    }

    private Atendimento acessarAtendimento(int atendimentoId) throws FuncionarioException {
        try {
            Atendimento atendimento = AtendimentoFacade.buscarAtendimentoPorId(atendimentoId);
            return atendimento;
        } catch (AtendimentoException ex) {
            throw new FuncionarioException("[FUNCIONÁRIO] Falha ao buscar atendimento específico");
        }
    }

    private void resolverAtendimento(HttpServletRequest request) throws FuncionarioException {
        try {
            String atendimentoId = request.getParameter("id");
            String justificativa = request.getParameter("justificativa");

            if (!isNullOrEmpty(atendimentoId)
                    && !isNullOrEmpty(justificativa)) {

                HttpSession session = request.getSession();
                Login login = (Login) session.getAttribute("login");
                Usuario atendente = new Usuario();
                atendente.setUsuarioId(login.getUsuarioId());

                Atendimento atendimentoResolvido = new Atendimento();
                atendimentoResolvido.setAtendimentoId(Integer.parseInt(atendimentoId));
                atendimentoResolvido.setJustificativa(justificativa);
                atendimentoResolvido.setAtendente(atendente);
                atendimentoResolvido.setDataFinalizado(new Date());

                FuncionarioFacade.resolverAtendimento(atendimentoResolvido);
            }
        } catch (NumberFormatException ex) {
            throw new FuncionarioException("Parâmetros inválidos: " + ex.getMessage());
        }catch (Exception ex){
            throw new FuncionarioException("Erro ao resolver atendimento: " + ex.getMessage());
        }
    }

    private <T> boolean isNullOrEmpty(T input) {
        if (input == null || input.toString().isBlank()) {
            return true;
        }
        return false;
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
