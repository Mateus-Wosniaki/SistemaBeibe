/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import java.sql.Connection;
import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabril
 */
public class CategoriaDAO implements InterfaceDAO<Categoria> {
    private static final String INSERIR = "insert into public.Categoria (nomeCategoria) values (?)";
    private static final String BUSCARTODOS = "select idCategoria, nomeCategoria from public.Categoria WHERE deleted = false";
    private static final String BUSCARPORID = "select idCategoria, nomeCategoria from public.Categoria where idCategoria = ? and deleted = false";
    private static final String DELETAR = "UPDATE Categoria SET deleted = true where idCategoria = ?";
    private static final String ATUALIZAR = "update public.Categoria set nomeCategoria = ? where idCategoria = ?";

    private Connection con = null;
    
    public CategoriaDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar CategoriaDAO.");
        }
        this.con = con;
    }

    @Override
    public Categoria buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Categoria categoria = new Categoria();
            
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                categoria.setCategoriaId(rs.getInt("idcategoria"));
                categoria.setDescricao(rs.getString("nomecategoria"));
            }
            
            return categoria;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar a categoria ID: " + id, e);
        }
    }

    @Override
    public List<Categoria> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Categoria> categorias = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Categoria categoria = new Categoria();
                
                categoria.setCategoriaId(rs.getInt("idcategoria"));
                categoria.setDescricao(rs.getString("nomecategoria"));
                
                categorias.add(categoria);
            }
            
            return categorias;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todas categorias", e);
        }
    }

    @Override
    public void inserir(Categoria categoria) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERIR, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, categoria.getDescricao());
            st.executeUpdate();
            
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                categoria.setCategoriaId(rs.getInt(1));
            }
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir a categoria: " + categoria.getDescricao(), e);
        }
    }

    @Override
    public void atualizar(Categoria categoria) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            st.setString(1, categoria.getDescricao());
            st.setInt(2, categoria.getCategoriaId());
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar a categoria: " + categoria.getDescricao(), e);
        }
    }

    @Override
    public void remover(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover a categoria: " + id, e);
        }
    }
}
