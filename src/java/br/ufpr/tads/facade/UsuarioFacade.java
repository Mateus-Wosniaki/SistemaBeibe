package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.dao.CidadeDAO;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.dao.EnderecoDAO;
import br.ufpr.tads.dao.UsuarioDAO;
import br.ufpr.tads.exception.DAOException;
import br.ufpr.tads.exception.UsuarioException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class UsuarioFacade {

    public static Usuario efetuarLogin(String email, String senha) throws UsuarioException {
        try (ConnectionFactory conFac = new ConnectionFactory()) {
            UsuarioDAO usuarioDao = new UsuarioDAO(conFac.getConnection());
            String senhaHash = gerarHash(senha);
            Usuario usuario = usuarioDao.recuperarUsuarioLogin(email, senhaHash);
            return usuario;
        } catch (DAOException ex) {
            throw new UsuarioException("Falha ao efetuar login com email: " + email + " e senha: " + senha);
        }
    }

    public static void cadastrarUsuario(Usuario usuario) throws UsuarioException {
        try (ConnectionFactory conFac = new ConnectionFactory()) {
            usuario.setSenha(gerarHash(usuario.getSenha())); 
            
            EnderecoDAO enderecoDAO = new EnderecoDAO(conFac.getConnection());
            enderecoDAO.inserir(usuario.getEndereco());
            
            UsuarioDAO usuarioDao = new UsuarioDAO(conFac.getConnection());
            usuarioDao.inserir(usuario);
        }catch(DAOException ex){
            throw new UsuarioException("Erro criando usuário", ex);
        }
    }

    public static void atualizarUsuario(Usuario usuario) throws UsuarioException {
        try(ConnectionFactory conFac = new ConnectionFactory()){
            usuario.setSenha(gerarHash(usuario.getSenha())); 
            EnderecoDAO enderecoDao = new EnderecoDAO(conFac.getConnection());
            enderecoDao.atualizar(usuario.getEndereco());
            UsuarioDAO usuarioDao = new UsuarioDAO(conFac.getConnection());
            usuarioDao.atualizar(usuario);
        }catch(DAOException ex){
            throw new UsuarioException("Erro atualizando usuário", ex);
        }
    }

    public static void deletarUsuario(int usuarioId) throws UsuarioException {
        try(ConnectionFactory conFac = new ConnectionFactory()){
            UsuarioDAO usuarioDao = new UsuarioDAO(conFac.getConnection());
            usuarioDao.remover(usuarioId);
        }catch(DAOException ex){
            throw new UsuarioException("Erro deletando usuário", ex);
        }
    }

    public static Usuario buscarUsuarioPorId(int usuarioId) throws UsuarioException {
        try(ConnectionFactory conFac = new ConnectionFactory()){
            UsuarioDAO usuarioDao = new UsuarioDAO(conFac.getConnection());
            Usuario usuario = usuarioDao.buscar(usuarioId);
            usuario.setSenha("");
            return usuario;
        }catch(DAOException ex){
            throw new UsuarioException("Erro buscando usuario", ex);
        }
    }

    public static List<Usuario> buscarColaboradores() throws UsuarioException {
        try(ConnectionFactory conFac = new ConnectionFactory()){
            UsuarioDAO usuarioDao = new UsuarioDAO(conFac.getConnection());
            List<Usuario> colaboradores = usuarioDao.buscarTodosColaboradores();
            return colaboradores;
        }catch(DAOException ex){
            throw new UsuarioException("Erro buscando colaboradores", ex);
        }
    }

    private static String gerarHash(String senha) throws UsuarioException {
        try {
            MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
            byte senhaBytes[] = algorithm.digest(senha.getBytes("UTF-8"));

            StringBuilder senhaCriptografada = new StringBuilder();
            for (byte b : senhaBytes) {
                senhaCriptografada.append(String.format("%02X", 0xFF & b));
            }
            return senhaCriptografada.toString();
        } catch (NoSuchAlgorithmException ex) {
            throw new UsuarioException("Algoritmo de HASH não encontrado");
        } catch (UnsupportedEncodingException ex) {
            throw new UsuarioException("Encoding não suportado");
        } catch (Exception ex) {
            throw new UsuarioException("Falha ao gerar HASH");
        }
    }

}
