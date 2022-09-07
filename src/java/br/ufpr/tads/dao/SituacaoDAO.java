/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Situacao;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabril
 */
public class SituacaoDAO implements IReadonlyDAO<Situacao> {
    private static final String BUSCARPORID = "select idSituacao, descSituacao from public.Situacao where idSituacao = ?";
    private static final String BUSCARTODOS = "select idSituacao, descSituacao from public.Situacao";
    
    private Connection con = null;
    
    public SituacaoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar SituacaoDAO.");
        }
        this.con = con;
    }

    @Override
    public Situacao buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Situacao situacao = new Situacao();
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                situacao.setSituacaoId(rs.getInt("idSituacao"));
                situacao.setDescricao(rs.getString("descSituacao"));
            }
            
            return situacao;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar a situação Id: " + id, e);
        }
    }

    @Override
    public List<Situacao> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Situacao> situacoes = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Situacao situacao = new Situacao();
                
                situacao.setSituacaoId(rs.getInt("idSituacao"));
                situacao.setDescricao(rs.getString("descSituacao"));
                
                situacoes.add(situacao);
            }
            
            return situacoes;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todas as situações", e);
        }
    }
    
}
