package br.ufpr.tads.facade;

import br.ufpr.tads.dao.AtendimentoDAO;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.exception.DAOException;
import br.ufpr.tads.exception.FuncionarioException;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class FuncionarioFacade {
    
    public static void resolverAtendimento(String justificativa) throws FuncionarioException{
//        try{
//            ConnectionFactory con = new ConnectionFactory();
//            AtendimentoDAO atendimentoDAO = new AtendimentoDAO(con.getConnection());
//            
//            atendimentoDAO.atualizar(justificativa);
//        }catch(DAOException ex){
//            throw new FuncionarioException("Erro ao resolver atendimento", ex);
//        }
        throw new FuncionarioException("NECESSÁRIO IMPLEMENTAR: precisa ter o id do Atendimento a ser resolvido... + se possível, o objeto do Atendimento c/ a justificativa");
        // FIXME: Ler o método atualizar de AtendimentoDAO!
    } 
    
}
