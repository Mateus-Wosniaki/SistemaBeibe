/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.exception.CategoriaException;
import br.ufpr.tads.facade.CategoriaFacade;
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
 * @author Mateus Wosniaki
 */
@WebServlet(name = "CategoriaServlet", urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        try {
            if ("incluir".equals(action)) {
                inserirNovaCategoria(request);
            } else if ("atualizar".equals(action)) {
                alterarCategoria(request);
            } else if ("deletar".equals(action)) {
                excluirCategoria(request);
            } else {
                List<Categoria> categorias = buscarTodasCategorias();
                request.setAttribute("categorias", categorias);
                redirectTo("/Funcionario/categoriasProduto.jsp", request, response);
            }
        } catch (CategoriaException ex) {
            redirectTo("/Erro/erro.jsp", request, response);
        }

    }

    private void inserirNovaCategoria(HttpServletRequest request) throws CategoriaException {
        String descricao = request.getParameter("descricao");

        if (!isNullOrEmpty(descricao)) {
            Categoria categoria = new Categoria();
            categoria.setDescricao(descricao);
            CategoriaFacade.criarCategoria(categoria);
        }
    }

    private List<Categoria> buscarTodasCategorias() throws CategoriaException {
        List<Categoria> categorias = CategoriaFacade.buscarTodosCategorias();
        return categorias;
    }

    private void alterarCategoria(HttpServletRequest request) throws CategoriaException {
        try {
            String descricao = request.getParameter("descricao");
            String id = request.getParameter("id");

            if (!isNullOrEmpty(descricao) && !isNullOrEmpty(id)) {
                Categoria categoria = new Categoria();
                categoria.setDescricao(descricao);
                categoria.setCategoriaId(Integer.parseInt(id));
                CategoriaFacade.atualizarCategoria(categoria);
            }
        } catch (NumberFormatException ex) {
            throw new CategoriaException("Parâmetro ID inválido");
        }
    }

    private void excluirCategoria(HttpServletRequest request) throws CategoriaException {
        try {
            String id = request.getParameter("id");
            if (!isNullOrEmpty(id)) {
                int idCategoria = Integer.parseInt(id);
                CategoriaFacade.deletarCategoria(idCategoria);
            }
        } catch (NumberFormatException ex) {
            throw new CategoriaException("Parâmetro ID inválido");
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
