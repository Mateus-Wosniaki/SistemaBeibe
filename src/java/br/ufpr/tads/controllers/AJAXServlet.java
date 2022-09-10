/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Cidade;
import br.ufpr.tads.beans.Estado;
import br.ufpr.tads.dao.CidadeDAO;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.dao.EstadoDAO;
import br.ufpr.tads.exception.DAOException;
import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Gabril
 */
@WebServlet(name = "AJAXServlet", urlPatterns = {"/AJAXServlet"})
public class AJAXServlet extends HttpServlet {

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
        RequestDispatcher paginaErro = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
        
        if ("estados".equals(action)) {
            try ( ConnectionFactory con = new ConnectionFactory() ) {
                // Traz do banco de dados a lista de cidades do estado
                List<Estado> listaEstados = new EstadoDAO(con.getConnection()).buscarTodos();
                // Transforma a lista de cidades em JSON
                String json = new Gson().toJson(listaEstados);

                // Retorna o JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
            } catch (DAOException e) {
                request.setAttribute("mensagem", "Erro AJAXServlet: Houve algum problema ao recuperar a lista de estados" + e.getMessage());
                paginaErro.forward(request, response);
            }
        }

        if ("cidades".equals(action)) {
            String estadoId = request.getParameter("estadoId");

            try ( ConnectionFactory con = new ConnectionFactory() ) {
                // Tenta converter o parametro em um int válido
                int idEstado = Integer.parseInt(estadoId);

                // Traz do banco de dados a lista de cidades do estado
                List<Cidade> listaCidades = new CidadeDAO(con.getConnection()).buscarPorEstado(idEstado);

                // Transforma a lista de cidades em JSON
                String json = new Gson().toJson(listaCidades);

                // Retorna o JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                
            } catch (NumberFormatException e) {
                request.setAttribute("mensagem", "Erro AJAXServlet: Há algum erro no parâmetro do Estado ID" + e.getMessage());
                paginaErro.forward(request, response);
            } catch (DAOException e) {
                request.setAttribute("mensagem", "Erro AJAXServlet: Houve algum problema ao recuperar a lista de cidades" + e.getMessage());
                paginaErro.forward(request, response);
            }
        }

        if ("categoria".equals(action)) {
            // TODO: Implementar import do comboBox para produto
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
