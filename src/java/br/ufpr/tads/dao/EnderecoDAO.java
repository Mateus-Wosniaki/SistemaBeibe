/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Cidade;
import java.sql.Connection;
import br.ufpr.tads.beans.Endereco;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gabriel Jesus Peres
 */
public class EnderecoDAO implements InterfaceDAO<Endereco> {
    private static final String INSERIR = "insert into public.Endereco (CEP, logradouro, numero, complemento, idMunicipio) values (?, ?, ?, ?, ?)";
    private static final String BUSCARTODOS = "select idEndereco, CEP, logradouro, numero, complemento, idMunicipio from public.Endereco";
    private static final String BUSCARPORID = "select idEndereco, CEP, logradouro, numero, complemento, idMunicipio from public.Endereco where idEndereco = ?";
    private static final String DELETAR = "delete from public.Endereco where idEndereco = ?";
    private static final String ATUALIZAR = "update public.Endereco set CEP = ?, logradouro = ?, numero = ?, complemento = ?, idMunicipio = ? where idEndereco = ?";

    private Connection con = null;

    @Override
    public Endereco buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Endereco endereco = new Endereco();
            
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                endereco.setCep(rs.getString("CEP"));
                endereco.setRua(rs.getString("logradouro"));
                endereco.setNumero(rs.getInt("numero"));
                endereco.setComplemento(rs.getString("complemento"));
                
                Cidade cidade = new Cidade();
                cidade.setCidadeId(rs.getInt("idMunicipio"));
                endereco.setCidade(cidade);
            }
            
            return endereco;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o endereço ID: " + id, e);
        }
    }

    @Override
    public List<Endereco> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Endereco> enderecos = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Endereco endereco = new Endereco();
                
                endereco.setCep(rs.getString("CEP"));
                endereco.setRua(rs.getString("logradouro"));
                endereco.setNumero(rs.getInt("numero"));
                endereco.setComplemento(rs.getString("complemento"));
                
                Cidade cidade = new Cidade();
                cidade.setCidadeId(rs.getInt("idMunicipio"));
                endereco.setCidade(cidade);
                
                enderecos.add(endereco);
            }
            
            return enderecos;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos endereços", e);
        }
    }

    @Override
    public void inserir(Endereco endereco) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERIR, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, endereco.getCep());
            st.setString(2, endereco.getRua());
            st.setInt(3, endereco.getNumero());
            st.setString(4, endereco.getComplemento());
            st.setInt(5, endereco.getCidade().getCidadeId());
            
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                endereco.setEnderecoId(rs.getInt(1));
            }
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o endereço: " + endereco.getRua(), e);
        }
    }

    @Override
    public void atualizar(Endereco endereco) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            st.setString(1, endereco.getCep());
            st.setString(2, endereco.getRua());
            st.setInt(3, endereco.getNumero());
            st.setString(4, endereco.getComplemento());
            st.setInt(5, endereco.getCidade().getCidadeId());
            st.setInt(6, endereco.getEnderecoId());
            
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o endereço: " + endereco.getRua(), e);
        }
    }

    @Override
    public void remover(Endereco endereco) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            st.setInt(1, endereco.getEnderecoId());
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o endereço: " + endereco.getRua(), e);
        }
    }
}
