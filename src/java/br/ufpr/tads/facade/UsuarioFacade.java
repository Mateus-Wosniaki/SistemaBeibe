package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.exception.FuncionarioException;
import br.ufpr.tads.exception.UsuarioException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki
 */
public class UsuarioFacade {

    public static Usuario efetuarLogin(String login, String senha) {
        /*
        try{
            String senhaHash = gerarHash(senha);
            UsuarioDAO usuarioDao = new UsuarioDAO();
            Usuario usuario = usuarioDao.recuperarUsuarioLogin(login, senhaHash);
            return usuario;
        }catch(DAOException ex){
            throw new LoginException("Erro buscando usuario para login", ex);
        }
         */
        return new Usuario(); //Colocar usuarioId e role na session dps
    }

    public static void cadastrarUsuario(Usuario usuario) throws UsuarioException {
        /*
        try{
            usuario.setSenha(gerarHash(usuario.getSenha())); 
            UsuarioDAO usuarioDao = new UsuarioDAO();
            Usuario usuario = usuarioDao.criarUsuario(usuario);
        }catch(DAOException ex){
            throw new UsuarioException("Erro criando usuário", ex);
        }
         */
    }

    public static void atualizarUsuario(Usuario usuario) throws UsuarioException {
        /*
        try{
            usuario.setSenha(gerarHash(usuario.getSenha())); 
            UsuarioDAO usuarioDao = new UsuarioDAO();
            Usuario usuario = usuarioDao.atualizarUsuario(usuario);
        }catch(DAOException ex){
            throw new UsuarioException("Erro atualizando usuário", ex);
        }
         */
    }

    public static void deletarUsuario(int usuarioId) throws UsuarioException {
        /*
        try{
            UsuarioDAO usuarioDao = new UsuarioDAO();
            Usuario usuario = usuarioDao.deletarUsuario(usuarioId);
        }catch(DAOException ex){
            throw new UsuarioException("Erro deletando usuário", ex);
        }
         */
    }

    public static Usuario buscarUsuarioPorId(int usuarioId) throws UsuarioException {
        /*
        try{
            UsuarioDAO usuarioDao = new UsuarioDAO();
            Usuario usuario = usuarioDao.recuperarUsuario(usuarioId);
            return usuario;
        }catch(DAOException ex){
            throw new UsuarioException("Erro buscando usuario", ex);
        }
         */
        return new Usuario();
    }

    public static List<Usuario> buscarColaboradores() throws UsuarioException {
        /*
        try{
            UsuarioDAO usuarioDao = new UsuarioDAO();
            List<Usuario> colaboradores = usuarioDao.buscarColaboradores();
            return funcionarios;
        }catch(DAOException ex){
            throw new UsuarioException("Erro buscando funcionários", ex);
        }
         */
        return new ArrayList<>();
    }

    private String gerarHash(String senha) {
        return "";
    }

}
