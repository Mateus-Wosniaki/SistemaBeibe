/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Funcao;
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
public class FuncaoDAO implements IReadonlyDAO<Funcao> {
    private static final String BUSCARPORID = "select idFuncao, descFuncao from public.Funcao where idFuncao = ?";
    private static final String BUSCARTODOS = "select idFuncao, descFuncao from public.Funcao";
    
    private Connection con = null;
    
    public FuncaoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar FuncaoDAO.");
        }
        this.con = con;
    }

    @Override
    public Funcao buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Funcao funcao = new Funcao();
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                funcao.setFuncaoId(rs.getInt("idFuncao"));
                funcao.setDescricao(rs.getString("descFuncao"));
            }
            
            return funcao;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar a função Id: " + id, e);
        }
    }

    @Override
    public List<Funcao> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Funcao> funcoes = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Funcao funcao = new Funcao();
                
                funcao.setFuncaoId(rs.getInt("idFuncao"));
                funcao.setDescricao(rs.getString("descFuncao"));
                
                funcoes.add(funcao);
            }
            
            return funcoes;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todas as funções", e);
        }
    }
    
}
