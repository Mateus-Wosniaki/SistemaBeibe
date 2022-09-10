package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Produto;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.dao.ProdutoDAO;
import br.ufpr.tads.exception.DAOException;
import br.ufpr.tads.exception.ProdutoException;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class ProdutoFacade {

    public static void criarProduto(Produto produto) throws ProdutoException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            ProdutoDAO produtoDao = new ProdutoDAO(con.getConnection());
            
            produtoDao.inserir(produto);
        }catch(DAOException ex){
            throw new ProdutoException("Erro criando produto", ex);
        }
    }

    public static void atualizarProduto(Produto produto) throws ProdutoException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            ProdutoDAO produtoDao = new ProdutoDAO(con.getConnection());
        
            produtoDao.atualizar(produto);
        }catch(DAOException ex){
            throw new ProdutoException("Erro atualizando produto", ex);
        }
    }
    
    public static void deletarProduto(int produtoId) throws ProdutoException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            ProdutoDAO produtoDao = new ProdutoDAO(con.getConnection());
        
            produtoDao.remover(produtoId);
        }catch(DAOException ex){
            throw new ProdutoException("Erro deletando produto", ex);
        }
    }

    public static List<Produto> buscarTodosProdutos() throws ProdutoException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            ProdutoDAO produtoDao = new ProdutoDAO(con.getConnection());
        
            List<Produto> produtos = produtoDao.buscarTodos();
            return produtos;
        }catch(DAOException ex){
            throw new ProdutoException("Erro buscando todos os produtos", ex);
        }
    }

    public static Produto buscarProdutoPorId(int produtoId) throws ProdutoException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            ProdutoDAO produtoDao = new ProdutoDAO(con.getConnection());
        
            Produto produto = produtoDao.buscar(produtoId);
            return produto;
        }catch(DAOException ex){
            throw new ProdutoException("Erro buscando produto por id", ex);
        }
    }
}
