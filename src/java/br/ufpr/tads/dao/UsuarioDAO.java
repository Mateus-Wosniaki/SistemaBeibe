/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Endereco;
import br.ufpr.tads.beans.Funcao;
import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.exception.DAOException;
import java.sql.Connection;
import java.util.List;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gabriel Jesus Peres
 */
public class UsuarioDAO implements InterfaceDAO<Usuario> {

    private static final String INSERIR = 
            "insert into public.Usuario (nomeCompleto,email,CPF,telefone,senha,idEndereco,idFuncao) values (?, ?, ?, ?, ?, ?, ?)";
    private static final String BUSCARTODOS = 
            "select idUsuario,nomeCompleto,email,CPF,telefone,senha,idEndereco,idFuncao from public.Usuario";
    private static final String BUSCARPORID = 
            "select idUsuario,nomeCompleto,email,CPF,telefone,senha,idEndereco,idFuncao from public.Usuario where idUsuario = ?";
    private static final String DELETAR = 
            "delete from public.Usuario where idUsuario = ?";
    private static final String ATUALIZAR = 
            "update public.Usuario set nomeCompleto = ?, email = ?, CPF = ?, telefone = ?, senha = ?, idEndereco = ?, idFuncao = ? where idUsuario = ?";

    private Connection con = null;

    public UsuarioDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar ClienteDAO.");
        }
        this.con = con;
    }

    @Override
    public Usuario buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Usuario usuario = new Usuario();
            
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                usuario.setUsuarioId(rs.getInt("idUsuario"));
                usuario.setNomeCompleto(rs.getString("nomeCompleto"));
                usuario.setCpf(rs.getString("CPF"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTelefone(rs.getString("telefone"));
                
                Funcao funcao = new Funcao();
                funcao.setFuncaoId(rs.getInt("idFuncao"));
                usuario.setFuncao(funcao);
                
                Endereco endereco = new Endereco();
                endereco.setEnderecoId(rs.getInt("idEndereco"));
                usuario.setEndereco(endereco);
            }
            
            return usuario;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o usuário ID: " + id, e);
        }
    }

    @Override
    public List<Usuario> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Usuario> usuarios = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Usuario usuario = new Usuario();
                
                usuario.setUsuarioId(rs.getInt("id"));
                usuario.setNomeCompleto(rs.getString("nomeCompleto"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTelefone(rs.getString("telefone"));
                
                Funcao funcao = new Funcao();
                funcao.setFuncaoId(rs.getInt("idFuncao"));
                usuario.setFuncao(funcao);
                
                Endereco endereco = new Endereco();
                endereco.setEnderecoId(rs.getInt("idEndereco"));
                usuario.setEndereco(endereco);
                
                usuarios.add(usuario);
            }
            
            return usuarios;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos usuários", e);
        }
    }

    @Override
    public void inserir(Usuario usuario) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERIR, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, usuario.getNomeCompleto());
            st.setString(2, usuario.getEmail());
            st.setString(3, usuario.getCpf());
            st.setString(4, usuario.getTelefone());
            st.setString(5, usuario.getSenha());
            st.setInt(6, usuario.getEndereco().getEnderecoId());
            st.setInt(7, usuario.getFuncao().getFuncaoId());
            
            st.executeUpdate();
            
            // Recebe o id criado no banco de dados, atualiza o objeto com esse id
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                usuario.setUsuarioId(rs.getInt(1));
            }
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o usuário: " + usuario.getNomeCompleto(), e);
        }
    }

    @Override
    public void atualizar(Usuario usuario) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            // Condicional WHERE para atualizar os dados
            st.setInt(8, usuario.getUsuarioId());
            
            // Dados a serem atualizados
            st.setString(1, usuario.getNomeCompleto());
            st.setString(2, usuario.getEmail());
            st.setString(3, usuario.getCpf());
            st.setString(4, usuario.getTelefone());
            st.setString(5, usuario.getSenha());
            st.setInt(6, usuario.getEndereco().getEnderecoId());
            st.setInt(7, usuario.getFuncao().getFuncaoId());
            
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o usuário: " + usuario.getNomeCompleto(), e);
        }
    }

    @Override
    public void remover(Usuario usuario) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            st.setInt(1, usuario.getUsuarioId());
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o usuário: " + usuario.getNomeCompleto(), e);
        }
    }

}
