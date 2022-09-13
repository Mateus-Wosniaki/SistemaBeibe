/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.beans.Login;
import br.ufpr.tads.exception.CategoriaException;
import br.ufpr.tads.facade.CategoriaFacade;
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
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
@WebServlet(name = "CategoriaServlet", urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        // Verifica se o usuário está logado
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/AutenticacaoServlet?action=index");
            request.setAttribute("mensagem", "Usuário deve se autenticar para acessar o sistema");
            rd.forward(request, response);
        }
        
        Login login = (Login) session.getAttribute("login");
        
        // Se o login for de uma pessoa não-autorizada, redireciona para erro.jsp
        if (login.getFuncao().getFuncaoId() != 2) {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/Erro/erro.jsp");
            request.setAttribute("mensagem", "Você não possui permissão para acessar o conteúdo");
            rd.forward(request, response);
        }

        try {
            if ("index".equals(action) || action == null) {
                
                List<Categoria> categorias = buscarTodasCategorias();
                request.setAttribute("categorias", categorias);
                redirectTo("/Funcionario/categoriasProduto.jsp", request, response);
                
            } else if("formIncluir".equals(action)) {
                
                redirectTo("/Funcionario/novaCategoria.jsp", request, response);
                
            }
            else if ("formEditar".equals(action)) {
                
                Categoria categoria = buscarCategoriaParaEdicao(request);
                
                if (categoria == null) {
                    request.setAttribute("mensagem", "Erro ao recuperar a categoria para edição");
                    redirectTo("/Erro/erro.jsp", request, response);
                }
                
                request.setAttribute("categoria", categoria);
                redirectTo("/Funcionario/novaCategoria.jsp", request, response);
                
            } else if ("cadastrarCategoria".equals(action)) {
                
                inserirNovaCategoria(request);
                redirectTo("/CategoriaServlet?action=index", request, response);
                
            } else if ("atualizarCategoria".equals(action)) {
                
                alterarCategoria(request);
                redirectTo("/CategoriaServlet?action=index", request, response);
                
            } else if ("deletar".equals(action)) {
                
                excluirCategoria(request);
                redirectTo("/CategoriaServlet?action=index", request, response);
                
            } else {
                request.setAttribute("mensagem", "404 - A página que você procura não existe (Action incorreta informada para a Controller)");
                redirectTo("/Erro/erro.jsp", request, response);
            }
        } catch (CategoriaException ex) {
            request.setAttribute("mensagem", ex.toString());
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
    
    private Categoria buscarCategoriaParaEdicao(HttpServletRequest request) throws CategoriaException {
        try {
            String id = request.getParameter("id");
            if (!isNullOrEmpty(id)) {
                int idCategoria = Integer.parseInt(id);
                Categoria categoria = CategoriaFacade.buscarCategoriaPorId(idCategoria);
                return categoria;
            }
            return null;
        } catch (NumberFormatException ex) {
            throw new CategoriaException("Parâmetro ID inválido");
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
