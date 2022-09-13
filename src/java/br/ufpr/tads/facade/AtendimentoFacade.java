/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Atendimento;
import br.ufpr.tads.beans.TipoAtendimento;
import br.ufpr.tads.dao.AtendimentoDAO;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.dao.TipoAtendimentoDAO;
import br.ufpr.tads.exception.AtendimentoException;
import br.ufpr.tads.exception.DAOException;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class AtendimentoFacade {

    public static List<Atendimento> buscarTodosAtendimentosAbertos() throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            AtendimentoDAO atendimentoDao = new AtendimentoDAO(connF.getConnection());
            
            List<Atendimento> atendimentos = atendimentoDao.buscarTodosAtendimentosAbertos();
            return atendimentos;
        } catch(DAOException ex){
            throw new AtendimentoException("Erro ao buscar todos os atendimentos abertos", ex);
        }
    }

    public static List<Atendimento> buscarTodosAtendimentos() throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            AtendimentoDAO atendimentoDao = new AtendimentoDAO(connF.getConnection());
            
            List<Atendimento> atendimentos = atendimentoDao.buscarTodos();
            return atendimentos;
        } catch(DAOException ex){
            throw new AtendimentoException("Erro ao buscar todos os atendimentos", ex);
        }
    }

    public static List<Atendimento> buscarAtendimentosPorCliente(int clienteId) throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            AtendimentoDAO atendimentoDao = new AtendimentoDAO(connF.getConnection());
            List<Atendimento> atendimentos = atendimentoDao.buscarAtendimentosCliente(clienteId);
            return atendimentos;
        }catch(DAOException ex){
            throw new AtendimentoException("Erro ao buscar atendimentos por cliente", ex);
        }
    }

    public static Atendimento buscarAtendimentoPorId(int atendimentoId) throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            AtendimentoDAO atendimentoDao = new AtendimentoDAO(connF.getConnection());
            
            Atendimento atendimento = atendimentoDao.buscar(atendimentoId);
            return atendimento;
        }catch(DAOException ex){
            throw new AtendimentoException("Erro buscando atendimento por id", ex);
        }
    }

    public static void criarAtendimento(Atendimento atendimento) throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            AtendimentoDAO atendimentoDao = new AtendimentoDAO(connF.getConnection());
            
            atendimentoDao.inserir(atendimento);
        }catch(DAOException ex){
            throw new AtendimentoException("Erro criando atendimento", ex);
        }
    }

    public static void deletarAtendimento(int atendimentoId) throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            AtendimentoDAO atendimentoDao = new AtendimentoDAO(connF.getConnection());
            
            Atendimento atendimento = AtendimentoFacade.buscarAtendimentoPorId(atendimentoId);
            
            // Verifica se o atendimento está em aberto, se estiver, remove
            // do contrário, não faz nenhuma ação
            if (atendimento.getSituacao().getSituacaoId() == 1) {
                atendimentoDao.remover(atendimentoId);
            }
        }catch(DAOException ex){
            throw new AtendimentoException("Erro deletando atendimento", ex);
        }
    }
    
    public static List<TipoAtendimento> buscarTodosTiposAtendimento() throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            TipoAtendimentoDAO tipoAtendimentoDAO = new TipoAtendimentoDAO(connF.getConnection());
            return tipoAtendimentoDAO.buscarTodos();
        }catch(DAOException ex){
            throw new AtendimentoException("Erro buscando todos os tipos de atendimento", ex);
        }
    }

    public static TipoAtendimento buscarTipoAtendimento(int idTipoAtendimento) throws AtendimentoException {
        try(ConnectionFactory connF = new ConnectionFactory()){
            TipoAtendimentoDAO tipoAtendimentoDAO = new TipoAtendimentoDAO(connF.getConnection());
            return tipoAtendimentoDAO.buscar(idTipoAtendimento);
        }catch(DAOException ex){
            throw new AtendimentoException("Erro buscando o tipo de atendimento id: " + idTipoAtendimento, ex);
        }
    }
}
