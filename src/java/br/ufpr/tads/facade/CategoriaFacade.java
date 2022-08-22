package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.exception.CategoriaException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki
 */
public class CategoriaFacade {

    public static void criarCategoria(Categoria categoria) throws CategoriaException {
        /*
        try{
            CategoriaDao categoriaDao = new CategoriaDAO();
            categoriaDao.criarCategoria(categoria);
        }catch(DAOException ex){
            throw new CategoriaException("Erro criando categoria", ex);
        }
         */
    }

    public static void atualizarCategoria(Categoria categoria) throws CategoriaException {
        /*
        try{
            CategoriaDAO categoriaDao = new CategoriaDAO();
            categoriaDao.atualizarCategoria(categoria);
        }catch(DAOException ex){
            throw new CategoriaException("Erro atualizando categoria", ex);
        }
         */
    }

    public static void deletarCategoria(int categoriaId) throws CategoriaException {
        /*
        try{
            CategoriaDAO categoriaDao = new CategoriaDAO();
            categoriaDao.deletarCategoria(categoriaId);
        }catch(DAOException ex){
            throw new CategoriaException("Erro deletando categoria", ex);
        }
         */
    }

    public static List<Categoria> buscarTodosCategorias() throws CategoriaException {
        /*
        try{
            CategoriaDAO categoriaDao = new CategoriaDAO();
            List<Categoria> categorias = categoriaDao.buscarTodasCategorias();
            return categorias;
        }catch(DAOException ex){
            throw new CategoriaException("Erro buscando todos os categorias", ex);
        }
         */
        return new ArrayList<>();
    }

    public static Categoria buscarCategoriaPorId(int categoriaId) throws CategoriaException {
        /*
        try{
            CategoriaDAO categoriaDao = new CategoriaDAO();
            Categoria categoria = CategoriaDao.buscarCategoria(categoriaId);
            return categoria;
        }catch(DAOException ex){
            throw new CategoriaException("Erro buscando categoria por id", ex);
        }
         */
        return new Categoria();
    }
}
