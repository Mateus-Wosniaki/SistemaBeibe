/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.TipoAtendimento;
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
public class TipoAtendimentoDAO implements IReadonlyDAO<TipoAtendimento> {
    private static final String BUSCARPORID = "select idTipoAtendimento, descTipoAtendimento from public.TipoAtendimento where idTipoAtendimento = ?";
    private static final String BUSCARTODOS = "select idTipoAtendimento, descTipoAtendimento from public.TipoAtendimento";
    
    private Connection con = null;
    
    public TipoAtendimentoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar TipoAtendimentoDAO.");
        }
        this.con = con;
    }

    @Override
    public TipoAtendimento buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            TipoAtendimento tipoAtendimento = new TipoAtendimento();
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idtipoatendimento"));
                tipoAtendimento.setDescricao(rs.getString("desctipoatendimento"));
            }
            
            return tipoAtendimento;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o tipo de atendimento Id: " + id, e);
        }
    }

    @Override
    public List<TipoAtendimento> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<TipoAtendimento> tiposAtendimento = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idtipoatendimento"));
                tipoAtendimento.setDescricao(rs.getString("desctipoatendimento"));
                
                tiposAtendimento.add(tipoAtendimento);
            }
            
            return tiposAtendimento;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos tipos de atendimento", e);
        }
    }
    
}
