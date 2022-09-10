/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.ufpr.tads.controllers;

import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.beans.Produto;
import br.ufpr.tads.exception.ProdutoException;
import br.ufpr.tads.facade.ProdutoFacade;
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
@WebServlet(name = "ProdutoServlet", urlPatterns = {"/ProdutoServlet"})
public class ProdutoServlet extends HttpServlet {

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
            if ("formIncluir".equals(action)) {
                redirectTo("/Funcionario/novoProduto.jsp", request, response);
            }
            else if ("formEditar".equals(action)) {
                Produto produto = buscarProduto(request);
                if(produto != null){
                    request.setAttribute("produto", produto);
                    redirectTo("/Funcionario/novoProduto.jsp", request, response);
                }
            }
            else if ("incluir".equals(action)) {
                inserirNovoProduto(request);
                redirectTo("/ProdutoServlet", request, response);
            } else if ("atualizar".equals(action)) {
                alterarProduto(request);
                redirectTo("/ProdutoServlet", request, response);
            } else if ("exibir".equals(action)) {
                Produto produto = buscarProduto(request);
                if(produto != null){
                    request.setAttribute("produto", produto);
                    //redirectTo("/Funcionario/novoProduto.jsp", request, response); REDIRECIONAR PARA A TELA CERTA
                }
            } else if ("deletar".equals(action)) {
                excluirProduto(request);
                redirectTo("/ProdutoServlet", request, response);
            } else {
                List<Produto> produtos = buscarTodosProdutos();
                request.setAttribute("produtos", produtos);
                redirectTo("/Funcionario/exibirProdutos.jsp", request, response);
            }
        } catch (ProdutoException ex) {
            request.setAttribute("mensagem", ex.toString());
            redirectTo("/Erro/erro.jsp", request, response);
        }

    }

    private void inserirNovoProduto(HttpServletRequest request) throws ProdutoException {
        try {
            String descricao = request.getParameter("descricao");
            String nome = request.getParameter("nome");
            String peso = request.getParameter("peso");
            String categoriaId = request.getParameter("categoria");

            if (!isNullOrEmpty(descricao)
                    && !isNullOrEmpty(nome)
                    && !isNullOrEmpty(peso)
                    && !isNullOrEmpty(categoriaId)) {
                Produto produto = new Produto();
                produto.setDescricao(descricao);
                produto.setNome(nome);
                produto.setPeso(Double.parseDouble(peso));

                Categoria categoria = new Categoria();
                categoria.setCategoriaId(Integer.parseInt(categoriaId));

                produto.setCategoria(categoria);

                ProdutoFacade.criarProduto(produto);
            }
        } catch (NumberFormatException ex) {
            throw new ProdutoException("Parâmetros inválidos");
        }
    }

    private List<Produto> buscarTodosProdutos() throws ProdutoException {
        List<Produto> produtos = ProdutoFacade.buscarTodosProdutos();
        return produtos;
    }

    private void alterarProduto(HttpServletRequest request) throws ProdutoException {
        try {
            String produtoId = request.getParameter("id");
            String descricao = request.getParameter("descricao");
            String nome = request.getParameter("nome");
            String peso = request.getParameter("peso");
            String categoriaId = request.getParameter("categoria");

            if (!isNullOrEmpty(descricao)
                    && !isNullOrEmpty(nome)
                    && !isNullOrEmpty(peso)
                    && !isNullOrEmpty(categoriaId)
                    && !isNullOrEmpty(produtoId)) {
                Produto produto = new Produto();
                produto.setProdutoId(Integer.parseInt(produtoId));
                produto.setDescricao(descricao);
                produto.setNome(nome);
                produto.setPeso(Double.parseDouble(peso));

                Categoria categoria = new Categoria();
                categoria.setCategoriaId(Integer.parseInt(categoriaId));

                produto.setCategoria(categoria);

                ProdutoFacade.atualizarProduto(produto);
            }
        } catch (NumberFormatException ex) {
            throw new ProdutoException("Parâmetros inválidos");
        }
    }

    private Produto buscarProduto(HttpServletRequest request) throws ProdutoException {
        try {
            String id = request.getParameter("id");
            if (!isNullOrEmpty(id)) {
                int produtoId = Integer.parseInt(id);
                Produto produto = ProdutoFacade.buscarProdutoPorId(produtoId);
                return produto;
            }
            return null;
        } catch (NumberFormatException ex) {
            throw new ProdutoException("Parâmetro ID inválido");
        }
    }

    private void excluirProduto(HttpServletRequest request) throws ProdutoException {
        try {
            String id = request.getParameter("id");
            if (!isNullOrEmpty(id)) {
                int produtoId = Integer.parseInt(id);
                ProdutoFacade.deletarProduto(produtoId);
            }
        } catch (NumberFormatException ex) {
            throw new ProdutoException("Parâmetro ID inválido");
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
