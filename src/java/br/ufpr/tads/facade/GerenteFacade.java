/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.facade;

import br.ufpr.tads.beans.Categoria;
import br.ufpr.tads.dao.ConnectionFactory;
import br.ufpr.tads.dao.GerenteDAO;
import br.ufpr.tads.exception.DAOException;
import br.ufpr.tads.exception.GerenteException;
import java.util.Map;

/**
 *
 * @author Mateus Wosniaki
 */
public class GerenteFacade {

    
    public static int buscarAtendimentosResolvidos() throws GerenteException {
        try ( ConnectionFactory con = new ConnectionFactory()) {
            GerenteDAO gerenteDao = new GerenteDAO(con.getConnection());
            return gerenteDao.buscarTotalAtendimentosResolvidos();
        } catch (DAOException ex) {
            throw new GerenteException("Erro buscando atendimentos resolvidos", ex);
        }
    }
     
    public static Map<Integer,Double> buscarRelacaoAtendimentosAbertosPorTotal() throws GerenteException {
        try ( ConnectionFactory con = new ConnectionFactory()) {
            GerenteDAO gerenteDao = new GerenteDAO(con.getConnection());
            return gerenteDao.buscarRelacaoAtendimentosAbertosPeloTotal();
        } catch (DAOException ex) {
            throw new GerenteException("Erro buscando relacao atendimentos", ex);
        }
    }
    
    public static Map<Categoria, String> buscarRelacaoAtendimentoPorCategoria() throws GerenteException {
        try ( ConnectionFactory con = new ConnectionFactory()) {
            GerenteDAO gerenteDao = new GerenteDAO(con.getConnection());
            Map<Categoria, String> relacaoPorCategoria = gerenteDao.buscarRelacaoAtendimentoPorCategoria();
            return relacaoPorCategoria;
        } catch (DAOException ex) {
            throw new GerenteException("Erro buscando relacao atendimentos", ex);
        }
    }
    
    //Geracao de relatorio
}
