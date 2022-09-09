/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Login;
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
        RequestDispatcher rdIndexJSP = getServletContext().getRequestDispatcher("/index.jsp");

        // AutenticacaoServlet?action=login ou AutenticacaoServlet
        if ("login".equals(action) || action.equals("")) {
            try {
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");

                if (email.isEmpty() || senha.isEmpty()) {
                    throw new AuthException();
                }

                Login login = UsuarioFacade.efetuarLogin(email, senha);
                if (login == null) {
                    throw new AuthException();
                }
                
                session.setAttribute("login", login);
                // TODO: Redirecionar para uma página diferente com base na role do Usuário
                response.sendRedirect("IMPLEMENTAR.jsp");
            } catch (UsuarioException e) {
                request.setAttribute("mensagem", e.getMessage());
                rdIndexJSP.forward(request, response);
            } catch (AuthException e) {
                request.setAttribute("mensagem", "Email/Senha inválidos");
                rdIndexJSP.forward(request, response);
            }
        }

        // AutenticacaoServlet?action=logout
        if ("logout".equals(action)) {
            if (session != null) {
                session.invalidate();
            }
            request.setAttribute("mensagem", "Usuário desconectado com sucesso");
            rdIndexJSP.forward(request, response);
        }
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
