/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import java.sql.Connection;
import br.ufpr.tads.beans.Endereco;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Gabril
 */
public class EnderecoDAO implements DAO<Endereco> {
    private static final String INSERIR = "insert into MUDAR (*, *, *) values (?, ?, ?)";
    private static final String BUSCARTODOS = "select * from MUDAR";
    private static final String BUSCARPORID = "select * from MUDAR where MUDAR = ?";
    private static final String DELETAR = "delete from MUDAR where MUDAR = ?";
    private static final String ATUALIZAR = "update MUDAR set MUDAR = ?, MUDAR = ?, MUDAR = ? where MUDAR = ?";

    private Connection con = null;

    @Override
    public Endereco buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            // TODO: implementar
            return null;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o endereço ID: " + id, e);
        }
    }

    @Override
    public List<Endereco> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            // TODO: implementar
            return null;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos endereços", e);
        }
    }

    @Override
    public void inserir(Endereco endereco) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERIR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o endereço: " + endereco.getRua(), e);
        }
    }

    @Override
    public void atualizar(Endereco endereco) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o endereço: " + endereco.getRua(), e);
        }
    }

    @Override
    public void remover(Endereco endereco) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o endereço: " + endereco.getRua(), e);
        }
    }
}