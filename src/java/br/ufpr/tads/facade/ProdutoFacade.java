package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Produto;
import br.ufpr.tads.exception.ProdutoException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki
 */
public class ProdutoFacade {

    public static void criarProduto(Produto produto) throws ProdutoException {
        /*
        try{
            ProdutoDAO produtoDao = new ProdutoDAO();
            produtoDao.criarProduto(produto);
        }catch(DAOException ex){
            throw new ProdutoException("Erro criando produto", ex);
        }
         */
    }

    public static void atualizarProduto(Produto produto) throws ProdutoException {
        /*
        try{
            ProdutoDAO produtoDao = new ProdutoDAO();
            produtoDao.atualizarProduto(produto);
        }catch(DAOException ex){
            throw new ProdutoException("Erro atualizando produto", ex);
        }
         */
    }
    
    public static void deletarProduto(int produtoId) throws ProdutoException {
        /*
        try{
            ProdutoDAO produtoDao = new ProdutoDAO();
            produtoDao.deletarProduto(produtoId);
        }catch(DAOException ex){
            throw new ProdutoException("Erro deletando produto", ex);
        }
         */
    }

    public static List<Produto> buscarTodosProdutos() throws ProdutoException {
        /*
        try{
            ProdutoDAO produtoDao = new ProdutoDAO();
            List<Produto> produtos = produtoDao.buscarTodosProdutos();
            return produtos;
        }catch(DAOException ex){
            throw new ProdutoException("Erro buscando todos os produtos", ex);
        }
         */
        return new ArrayList<>();
    }

    public static Produto buscarProdutoPorId(int produtoId) throws ProdutoException {
        /*
        try{
            ProdutoDAO produtoDao = new ProdutoDAO();
            Produto produto = produtoDao.buscarProduto(produtoId);
            return produto;
        }catch(DAOException ex){
            throw new ProdutoException("Erro buscando produto por id", ex);
        }
         */
        return new Produto();
    }
}
