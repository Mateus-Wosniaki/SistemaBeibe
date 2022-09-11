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
import java.util.List;

/**
 *
 * @author Gabril
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

        String action = request.getParameter("action");

        try {
            if ("atendimentosAbertos".equals(action)) {
                List<Atendimento> atendimentosAbertos = buscarAtendimentosAbertos(request);
                request.setAttribute("atendimentosAbertos", atendimentosAbertos);
                redirectTo("/Funcionario/atendimentoAberto.jsp", request, response);
            } else if ("todosAtendimentos".equals(action)) {
                List<Atendimento> atendimentos = buscarTodosAtendimentos(request);
                request.setAttribute("atendimentos", atendimentos);
                redirectTo("/Funcionario/todosAtendimentos.jsp", request, response);
            } else if ("resolverAtendimento".equals(action)) {
                resolverAtendimento(request);
                redirectTo("/FuncionarioServlet?action=atendimentosAbertos", request, response);
            } else if ("acessarAtendimento".equals(action)) {
                Atendimento atendimento = acessarAtendimento(request);
                if (atendimento != null) {
                    request.setAttribute("atendimento", atendimento);
                    redirectTo("/Funcionario/resumoAtendimento.jsp", request, response);
                }
            } else {
                request.setAttribute("mensagem", "Nenhuma ação inserida");
                redirectTo("/Erro/erro.jsp", request, response);
            }
        } catch (FuncionarioException ex) {
            request.setAttribute("mensagem", ex.toString());
            redirectTo("/Erro/erro.jsp", request, response);
        }
    }

    private List<Atendimento> buscarAtendimentosAbertos(HttpServletRequest request) throws FuncionarioException {
        try {
            List<Atendimento> atendimentosAbertos = AtendimentoFacade.buscarTodosAtendimentosAbertos();
            return atendimentosAbertos; //DEVE ESTAR -> ORDER BY DESC
        } catch (AtendimentoException ex) {
            throw new FuncionarioException("[FUNCIONÁRIO] Falha ao buscar atendimentos abertos");
        }
    }

    private List<Atendimento> buscarTodosAtendimentos(HttpServletRequest request) throws FuncionarioException {
        try {
            List<Atendimento> todosAtendimentos = AtendimentoFacade.buscarTodosAtendimentos();
            return todosAtendimentos; //DEVE ESTAR -> ORDER BY DESC
        } catch (AtendimentoException ex) {
            throw new FuncionarioException("[FUNCIONÁRIO] Falha ao buscar todos atendimentos");
        }
    }

    private Atendimento acessarAtendimento(HttpServletRequest request) throws FuncionarioException {
        try {
            String id = request.getParameter("id");
            if (!isNullOrEmpty(id)) {
                int atendimentoId = Integer.parseInt(id);
                Atendimento atendimento = AtendimentoFacade.buscarAtendimentoPorId(atendimentoId);
                return atendimento; //DEVE ESTAR -> ORDER BY DESC
            }
            return null;
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

                FuncionarioFacade.resolverAtendimento(atendimentoResolvido);
            }
        } catch (NumberFormatException ex) {
            throw new FuncionarioException("Parâmetros inválidos");
        }catch (Exception ex){
            throw new FuncionarioException("Erro ao resolver atendimento");
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
