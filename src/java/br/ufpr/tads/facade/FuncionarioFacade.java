package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Atendimento;
import br.ufpr.tads.dao.AtendimentoDAO;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.exception.DAOException;
import br.ufpr.tads.exception.FuncionarioException;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class FuncionarioFacade {
    
    public static void resolverAtendimento(Atendimento atendimento) throws FuncionarioException {
        try (ConnectionFactory con = new ConnectionFactory()){
            AtendimentoDAO atendimentoDAO = new AtendimentoDAO(con.getConnection());
            atendimentoDAO.atualizar(atendimento);
        }catch(DAOException ex){
            throw new FuncionarioException("Erro ao resolver atendimento", ex);
        }
    }
}
