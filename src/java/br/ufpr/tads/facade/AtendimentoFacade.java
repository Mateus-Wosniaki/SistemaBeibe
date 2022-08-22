/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Atendimento;
import br.ufpr.tads.exception.AtendimentoException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mateus Wosniaki
 */
public class AtendimentoFacade {

    public static List<Atendimento> buscarTodosAtendimentosAbertos() throws AtendimentoException {
        /*
        try{
            AtendimentoDAO atendimentoDao = new AtendimentoDAO();
            List<Atendimento> atendimentos = atendimentoDao.buscarTodosAtendimentosAbertos();
            return atendimentos;
        }
        }catch(DAOException ex){
            throw new AtendimentoException("Erro ao buscar todos os atendimentos abertos", ex);
        }
         */
        return new ArrayList<>();
    }

    public static List<Atendimento> buscarTodosAtendimentos() throws AtendimentoException {
        /*
        try{
            AtendimentoDAO atendimentoDao = new AtendimentoDAO();
            List<Atendimento> atendimentos = atendimentoDao.buscarTodosAtendimentos();
            return atendimentos;
        }
        }catch(DAOException ex){
            throw new AtendimentoException("Erro ao buscar todos os atendimentos", ex);
        }
         */
        return new ArrayList<>();
    }

    public static List<Atendimento> buscarAtendimentosPorCliente(int clienteId) throws AtendimentoException {
        /*
        try{
            AtendimentoDAO atendimentoDao = new AtendimentoDAO();
            List<Atendimento> atendimentos = atendimentoDao.buscarAtendimentosCliente(clienteId);
            return atendimentos;
        }
        }catch(DAOException ex){
            throw new AtendimentoException("Erro ao buscar atendimentos por cliente", ex);
        }
         */
        return new ArrayList<>();
    }

    public static Atendimento buscarAtendimentoPorId(int atendimentoId) throws AtendimentoException {
        /*
        try{
            AtendimentoDAO atendimentoDao = new AtendimentoDAO();
            Atendimento atendimento = atendimentoDao.buscarAtendimento(atendimentoId);
            return atendimento;
        }catch(DAOException ex){
            throw new AtendimentoException("Erro buscando atendimento por id", ex);
        }
         */
        return new Atendimento();
    }

    public static void criarAtendimento(Atendimento atendimento) throws AtendimentoException {
        /*
        try{
            AtendimentoDAO atendimentoDao = new AtendimentoDAO();
            atendimentoDao.criarAtendimento(atendimento);
        }catch(DAOException ex){
            throw new AtendimentoException("Erro criando atendimento", ex);
        }
         */
    }

    public static void deletarAtendimento(int atendimentoId) throws AtendimentoException {
        /*
        try{
            AtendimentoDAO atendimentoDao = new AtendimentoDAO();
            atendimentoDao.deletarAtendimento(atendimentoId);
        }catch(DAOException ex){
            throw new AtendimentoException("Erro deletando atendimento", ex);
        }
         */
    }
}
