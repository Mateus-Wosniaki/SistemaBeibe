package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Cidade;
import br.ufpr.tads.beans.Endereco;
import br.ufpr.tads.beans.Estado;
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

    private static final String INSERIR
            = "insert into public.Usuario (nomecompleto,email,CPF,telefone,senha,idEndereco,idFuncao) values (?, ?, ?, ?, ?, ?, ?)";
    private static final String BUSCARTODOS
            = "select idusuario,nomecompleto,email,CPF,telefone,senha,idEndereco,idFuncao from public.Usuario WHERE deleted = false";
    private static final String BUSCAR_TODOS_COLABORADORES
            = "select idusuario,nomecompleto,email,CPF,telefone,senha,idEndereco,f.idFuncao,f.descfuncao from public.Usuario u INNER JOIN Funcao f on f.idfuncao = u.idfuncao WHERE f.idFuncao != 1 AND deleted = false";
    private static final String BUSCARPORID
            = "select * from public.Usuario u INNER JOIN Endereco e on e.idEndereco = u.idEndereco INNER JOIN Municipio m on m.idMunicipio = e.idMunicipio INNER JOIN Estado es on es.idEstado = m.idEstado INNER JOIN Funcao f on f.idFuncao = u.idFuncao where idusuario = ? AND deleted = false";
    private static final String DELETAR
            = "UPDATE Usuario SET deleted = true where idusuario = ?";
    private static final String ATUALIZAR
            = "update public.Usuario set nomecompleto = ?, email = ?, CPF = ?, telefone = ?, senha = ?, idEndereco = ?, idFuncao = ? where idusuario = ?";
    private static final String VERIFICAR_USUARIO
            = "select idusuario,nomecompleto,email,CPF,telefone,senha,idEndereco,idFuncao from public.Usuario WHERE senha = ? AND email = ? AND deleted = false";

    private Connection con = null;

    public UsuarioDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar ClienteDAO.");
        }
        this.con = con;
    }

    @Override
    public Usuario buscar(int id) throws DAOException {
        try ( PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Usuario usuario = new Usuario();

            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                usuario.setUsuarioId(rs.getInt("idusuario"));
                usuario.setNomeCompleto(rs.getString("nomecompleto"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTelefone(rs.getString("telefone"));

                Funcao funcao = new Funcao();
                funcao.setFuncaoId(rs.getInt("idfuncao"));
                funcao.setDescricao(rs.getString("descfuncao"));
                usuario.setFuncao(funcao);

                Estado estado = new Estado();
                estado.setDescricao(rs.getString("nomeestado"));
                estado.setEstadoId(rs.getInt("idestado"));
                
                Cidade cidade = new Cidade();
                cidade.setDescricao(rs.getString("nomemunicipio"));
                cidade.setCidadeId(rs.getInt("idmunicipio"));
                cidade.setEstado(estado);

                Endereco endereco = new Endereco();
                endereco.setEnderecoId(rs.getInt("idendereco"));
                endereco.setRua(rs.getString("logradouro"));
                endereco.setComplemento(rs.getString("complemento"));
                endereco.setCep(rs.getString("cep"));
                endereco.setBairro(rs.getString("bairro"));
                endereco.setNumero(rs.getInt("numero"));
                endereco.setCidade(cidade);
                usuario.setEndereco(endereco);
            }

            return usuario;
        } catch (SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o usuário ID: " + id, e);
        }
    }

    @Override
    public List<Usuario> buscarTodos() throws DAOException {
        try ( PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Usuario> usuarios = new ArrayList<>();

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();

                usuario.setUsuarioId(rs.getInt("idusuario"));
                usuario.setNomeCompleto(rs.getString("nomecompleto"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTelefone(rs.getString("telefone"));

                Funcao funcao = new Funcao();
                funcao.setFuncaoId(rs.getInt("idfuncao"));
                usuario.setFuncao(funcao);

                Endereco endereco = new Endereco();
                endereco.setEnderecoId(rs.getInt("idendereco"));
                usuario.setEndereco(endereco);

                usuarios.add(usuario);
            }

            return usuarios;
        } catch (SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos usuários", e);
        }
    }

    public List<Usuario> buscarTodosColaboradores() throws DAOException {
        try ( PreparedStatement st = con.prepareStatement(BUSCAR_TODOS_COLABORADORES)) {
            List<Usuario> usuarios = new ArrayList<>();

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();

                usuario.setUsuarioId(rs.getInt("idusuario"));
                usuario.setNomeCompleto(rs.getString("nomecompleto"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTelefone(rs.getString("telefone"));

                Funcao funcao = new Funcao();
                funcao.setFuncaoId(rs.getInt("idfuncao"));
                funcao.setDescricao(rs.getString("descfuncao"));
                usuario.setFuncao(funcao);

                Endereco endereco = new Endereco();
                endereco.setEnderecoId(rs.getInt("idendereco"));
                usuario.setEndereco(endereco);

                usuarios.add(usuario);
            }

            return usuarios;
        } catch (SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos usuários", e);
        }
    }

    @Override
    public void inserir(Usuario usuario) throws DAOException {
        try ( PreparedStatement st = con.prepareStatement(INSERIR, PreparedStatement.RETURN_GENERATED_KEYS)) {
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
        } catch (SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o usuário: " + usuario.getNomeCompleto(), e);
        }
    }

    @Override
    public void atualizar(Usuario usuario) throws DAOException {
        try ( PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
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
        } catch (SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o usuário: " + usuario.getNomeCompleto(), e);
        }
    }

    @Override
    public void remover(int id) throws DAOException {
        try ( PreparedStatement st = con.prepareStatement(DELETAR)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o usuário: " + id, e);
        }
    }

    public Usuario recuperarUsuarioLogin(String email, String senhaHash) throws DAOException {
        try ( PreparedStatement st = con.prepareStatement(VERIFICAR_USUARIO)) {
            Usuario usuario = null;

            st.setString(1, senhaHash);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setUsuarioId(rs.getInt("idusuario"));
                usuario.setNomeCompleto(rs.getString("nomecompleto"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTelefone(rs.getString("telefone"));

                Funcao funcao = new Funcao();
                funcao.setFuncaoId(rs.getInt("idfuncao"));
                usuario.setFuncao(funcao);

                Endereco endereco = new Endereco();
                endereco.setEnderecoId(rs.getInt("idendereco"));
                usuario.setEndereco(endereco);
            }
            return usuario;
        } catch (SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o usuário por email e senha", e);
        }
    }

}