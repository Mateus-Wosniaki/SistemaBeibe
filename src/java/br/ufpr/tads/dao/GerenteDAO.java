/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Categoria;
import java.sql.Connection;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Gabriel Jesus Peres
 */
public class GerenteDAO {
    private static final String BUSCAR_RESOLVIDOS = "SELECT COUNT(*) as totalResolvidos FROM atendimento WHERE idSituacao = 2";
    private static final String BUSCAR_ATENDIMENTO_POR_TOTAL = "SELECT COUNT(*) as abertos, CAST(COUNT(*)::decimal / coalesce(NULLIF((SELECT COUNT(*) FROM Atendimento),0),1)::decimal * 100 AS decimal(10,2)) AS porcentagem FROM Atendimento a WHERE a.idsituacao = 1";
    private static final String BUSCAR_RELACAO_CATEGORIA = "select t.idcategoria, t.nomeCategoria, COUNT(*) as abertos, t.TotalCategoria\n" +
                                                            " from (SELECT a.idsituacao, c.idcategoria, c.nomeCategoria, COUNT(c.idcategoria) OVER (PARTITION BY c.idcategoria) as TotalCategoria FROM Atendimento a\n" +
                                                            " INNER JOIN Produto p on p.idproduto = a.idproduto\n" +
                                                            " INNER JOIN Categoria c on c.idcategoria = p.idcategoria) t\n" +
                                                            " where t.idsituacao = 1\n" +
                                                            " group by t.idcategoria, t.nomeCategoria, t.TotalCategoria;";

    private Connection con = null;
    
    public GerenteDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar ProdutoDAO.");
        }
        this.con = con;
    }

    public int buscarTotalAtendimentosResolvidos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCAR_RESOLVIDOS)) {
            int totalAtendimentosResolvidos = 0;
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalAtendimentosResolvidos = rs.getInt("totalResolvidos");
            }
            
            return totalAtendimentosResolvidos;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar total atendimentos resolvidos", e);
        }
    }

    public Map<Integer,Double> buscarRelacaoAtendimentosAbertosPeloTotal() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCAR_ATENDIMENTO_POR_TOTAL)) {
            Map<Integer, Double> relacaoAbertosPeloTotal = new HashMap<>();
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int abertos = rs.getInt("abertos");
                Double porcentagemPeloTotal = rs.getDouble("porcentagem");
                relacaoAbertosPeloTotal.put(abertos, porcentagemPeloTotal);
            }
            
            return relacaoAbertosPeloTotal;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar relacao atendimentos abertos pelo total", e);
        }
    }

   public Map<Categoria, String> buscarRelacaoAtendimentoPorCategoria() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCAR_RELACAO_CATEGORIA)) {
            Map<Categoria, String> relacaoPorCategoria = new HashMap<>();
            
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                int idCategoria = rs.getInt("idcategoria");
                String descCategoria = rs.getString("nomecategoria");
                
                categoria.setCategoriaId(idCategoria);
                categoria.setDescricao(descCategoria);
                
                int abertosCategoria = rs.getInt("abertos");
                int totalCategoria = rs.getInt("totalcategoria");
                String relacao = String.format("%d / %d", abertosCategoria, totalCategoria);
                
                relacaoPorCategoria.put(categoria, relacao);
            }
            
            return relacaoPorCategoria;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar relacao atendimentos abertos pelo total por categoria", e);
        }
    }
}