package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.dao.CategoriaDAO;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.exception.CategoriaException;
import br.ufpr.tads.exception.DAOException;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class CategoriaFacade {

    public static void criarCategoria(Categoria categoria) throws CategoriaException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            CategoriaDAO categoriaDao = new CategoriaDAO(con.getConnection());
            
            categoriaDao.inserir(categoria);
        }catch(DAOException ex){
            throw new CategoriaException("Erro criando categoria", ex);
        }
    }

    public static void atualizarCategoria(Categoria categoria) throws CategoriaException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            CategoriaDAO categoriaDao = new CategoriaDAO(con.getConnection());
            
            categoriaDao.atualizar(categoria);
        }catch(DAOException ex){
            throw new CategoriaException("Erro atualizando categoria", ex);
        }
    }

    public static void deletarCategoria(int categoriaId) throws CategoriaException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            CategoriaDAO categoriaDao = new CategoriaDAO(con.getConnection());
        
            categoriaDao.remover(categoriaId);
        }catch(DAOException ex){
            throw new CategoriaException("Erro deletando categoria", ex);
        }
    }

    public static List<Categoria> buscarTodosCategorias() throws CategoriaException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            CategoriaDAO categoriaDao = new CategoriaDAO(con.getConnection());
            
            List<Categoria> categorias = categoriaDao.buscarTodos();
            return categorias;
        }catch(DAOException ex){
            throw new CategoriaException("Erro buscando todos os categorias", ex);
        }
    }

    public static Categoria buscarCategoriaPorId(int categoriaId) throws CategoriaException {
        try{
            ConnectionFactory con = new ConnectionFactory();
            CategoriaDAO categoriaDao = new CategoriaDAO(con.getConnection());
            
            Categoria categoria = categoriaDao.buscar(categoriaId);
            return categoria;
        }catch(DAOException ex){
            throw new CategoriaException("Erro buscando categoria por id", ex);
        }
    }
}
