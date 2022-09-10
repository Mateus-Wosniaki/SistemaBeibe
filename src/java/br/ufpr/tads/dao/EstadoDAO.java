/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Estado;
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
public class EstadoDAO implements IReadonlyDAO<Estado> {
    private static final String BUSCARPORID = "select idestado, nomeestado, siglauf from public.Estado where idestado = ?";
    private static final String BUSCARTODOS = "select idestado, nomeestado, siglauf from public.Estado";
    
    private Connection con = null;
    
    public EstadoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar EstadoDAO.");
        }
        this.con = con;
    }

    @Override
    public Estado buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Estado estado = new Estado();
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                estado.setEstadoId(rs.getInt("idestado"));
                estado.setDescricao(rs.getString("nomeestado"));
                estado.setSiglaUF(rs.getString("siglauf"));
            }
            
            return estado;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o estado Id: " + id, e);
        }
    }

    @Override
    public List<Estado> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Estado> estados = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Estado estado = new Estado();
                
                estado.setEstadoId(rs.getInt("idestado"));
                estado.setDescricao(rs.getString("nomeestado"));
                estado.setSiglaUF(rs.getString("siglauf"));
                
                estados.add(estado);
            }
            
            return estados;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos estados", e);
        }
    }
    
}
