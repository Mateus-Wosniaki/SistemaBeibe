/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import java.sql.Connection;
import br.ufpr.tads.beans.Atendimento;
import br.ufpr.tads.beans.Produto;
import br.ufpr.tads.beans.Situacao;
import br.ufpr.tads.beans.TipoAtendimento;
import br.ufpr.tads.beans.Usuario;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Gabril
 */
public class AtendimentoDAO implements DAO<Atendimento> {
    private static final String INSERIR = 
            "insert into public.Atendimento (idUsuario, idTipoAtendimento, idProduto, descricaoChamado, idSituacao) values (?, ?, ?, ?, ?)";
    private static final String BUSCARTODOS = 
            "select idAtendimento,idUsuario,idTipoAtendimento,dataChamado,idProduto,descricaoChamado,idSituacao,justificativa,idAtendente,dataFinalizado from public.Atendimento";
    private static final String BUSCARPORID = 
            "select idAtendimento,idUsuario,idTipoAtendimento,dataChamado,idProduto,descricaoChamado,idSituacao,justificativa,idAtendente,dataFinalizado from public.Atendimento where idAtendimento = ?";
    private static final String DELETAR = 
            "delete from public.Atendimento where idAtendimento = ?";
    private static final String ATUALIZAR = 
            "update public.Atendimento set MUDAR = ?, MUDAR = ?, MUDAR = ? where idAtendimento = ?";

    private Connection con = null;

    @Override
    public Atendimento buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Atendimento atendimento = new Atendimento();
            
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                atendimento.setAtendimentoId(rs.getInt("idAtendimento"));
                atendimento.setDataCriacao(rs.getDate("dataChamado"));
                atendimento.setDataFinalizado(rs.getDate("dataFinalizado"));
                atendimento.setJustificativa(rs.getString("justificativa"));
                atendimento.setDescricao(rs.getString("descricaoChamado"));
                
                Usuario cliente = new Usuario();
                cliente.setUsuarioId(rs.getInt("idUsuario"));
                atendimento.setCliente(cliente);
                
                // Realiza uma etapa extra de validação, pois Atendente pode ser nulo, 
                // caso o status ainda esteja em aberto, por exemplo
                int idAtendente = rs.getInt("idAtendente");
                if (!rs.wasNull()) {
                    Usuario atendente = new Usuario();
                    atendente.setUsuarioId(idAtendente);
                    atendimento.setAtendente(atendente);
                }
                
                Produto produto = new Produto();
                produto.setProdutoId(rs.getInt("idProduto"));
                atendimento.setProduto(produto);
                
                Situacao situacao = new Situacao();
                situacao.setSituacaoId(rs.getInt("idSituacao"));
                atendimento.setSituacao(situacao);
                
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idTipoAtendimento"));
                atendimento.setTipoAtendimento(tipoAtendimento);
            }
            
            return atendimento;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o atendimento ID: " + id, e);
        }
    }

    @Override
    public List<Atendimento> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Atendimento> atendimentos = new ArrayList<>();
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                
                atendimento.setAtendimentoId(rs.getInt("idAtendimento"));
                atendimento.setDataCriacao(rs.getDate("dataChamado"));
                atendimento.setDataFinalizado(rs.getDate("dataFinalizado"));
                atendimento.setJustificativa(rs.getString("justificativa"));
                atendimento.setDescricao(rs.getString("descricaoChamado"));
                
                Usuario cliente = new Usuario();
                cliente.setUsuarioId(rs.getInt("idUsuario"));
                atendimento.setCliente(cliente);
                
                // Realiza uma etapa extra de validação, pois Atendente pode ser nulo, 
                // caso o status ainda esteja em aberto, por exemplo
                int idAtendente = rs.getInt("idAtendente");
                if (!rs.wasNull()) {
                    Usuario atendente = new Usuario();
                    atendente.setUsuarioId(idAtendente);
                    atendimento.setAtendente(atendente);
                }
                
                Produto produto = new Produto();
                produto.setProdutoId(rs.getInt("idProduto"));
                atendimento.setProduto(produto);
                
                Situacao situacao = new Situacao();
                situacao.setSituacaoId(rs.getInt("idSituacao"));
                atendimento.setSituacao(situacao);
                
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idTipoAtendimento"));
                atendimento.setTipoAtendimento(tipoAtendimento);
                
                atendimentos.add(atendimento);
            }
            
            return atendimentos;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos atendimentos", e);
        }
    }

    @Override
    public void inserir(Atendimento atendimento) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERIR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o atendimento: " + atendimento.getAtendimentoId(), e);
        }
    }

    @Override
    public void atualizar(Atendimento atendimento) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o atendimento: " + atendimento.getAtendimentoId(), e);
        }
    }

    @Override
    public void remover(Atendimento atendimento) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            // TODO: implementar
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o atendimento: " + atendimento.getAtendimentoId(), e);
        }
    }
}
