/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Cidade;
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
public class CidadeDAO implements IReadonlyDAO<Cidade> {
    private static final String BUSCARPORID = "select idmunicipio, nomemunicipio, idestado from public.Municipio where idmunicipio = ?";
    private static final String BUSCARTODOS = "select idmunicipio, nomemunicipio, idestado from public.Municipio";
    private static final String BUSCAR_CIDADES_ESTADO = "select idmunicipio, nomemunicipio, idestado from public.Municipio where idestado = ?";
    
    private Connection con = null;
    
    public CidadeDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar CidadeDAO.");
        }
        this.con = con;
    }

    @Override
    public Cidade buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Cidade cidade = new Cidade();
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                cidade.setCidadeId(rs.getInt("idmunicipio"));
                cidade.setDescricao(rs.getString("nomemunicipio"));
                
                Estado estado = new Estado();
                estado.setEstadoId(rs.getInt("idestado"));
                cidade.setEstado(estado);
            }
            
            return cidade;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar a cidade Id: " + id, e);
        }
    }

    @Override
    public List<Cidade> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Cidade> cidades = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cidade cidade = new Cidade();
                
                cidade.setCidadeId(rs.getInt("idmunicipio"));
                cidade.setDescricao(rs.getString("nomemunicipio"));
                
                Estado estado = new Estado();
                estado.setEstadoId(rs.getInt("idestado"));
                cidade.setEstado(estado);
                
                cidades.add(cidade);
            }
            
            return cidades;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todas cidades", e);
        }
    }

    public List<Cidade> buscarPorEstado(int idEstado) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCAR_CIDADES_ESTADO)) {
            st.setInt(1, idEstado);
            List<Cidade> cidades = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Cidade cidade = new Cidade();
                
                cidade.setCidadeId(rs.getInt("idmunicipio"));
                cidade.setDescricao(rs.getString("nomemunicipio"));
                
                Estado estado = new Estado();
                estado.setEstadoId(rs.getInt("idestado"));
                cidade.setEstado(estado);
                
                cidades.add(cidade);
            }
            return cidades;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todas cidades do estado Id: " + idEstado, e);
        }
    }
    
}
