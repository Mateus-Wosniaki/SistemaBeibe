/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import java.sql.Connection;
import br.ufpr.tads.beans.Produto;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Gabril
 */
public class ProdutoDAO implements DAO<Produto> {
    private static final String INSERIR = "insert into MUDAR (*, *, *) values (?, ?, ?)";
    private static final String BUSCARTODOS = "select * from MUDAR";
    private static final String BUSCARPORID = "select * from MUDAR where MUDAR = ?";
    private static final String DELETAR = "delete from MUDAR where MUDAR = ?";
    private static final String ATUALIZAR = "update MUDAR set MUDAR = ?, MUDAR = ?, MUDAR = ? where MUDAR = ?";

    private Connection con = null;

    @Override
    public Produto buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            // TODO: implementar
            return null;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o produto ID: " + id, e);
        }
    }

    @Override
    public List<Produto> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            // TODO: implementar
            return null;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos produtos", e);
        }
    }

    @Override
    public void inserir(Produto produto) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERIR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o produto: " + produto.getDescricao(), e);
        }
    }

    @Override
    public void atualizar(Produto produto) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o produto: " + produto.getDescricao(), e);
        }
    }

    @Override
    public void remover(Produto produto) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o produto: " + produto.getDescricao(), e);
        }
    }
}
