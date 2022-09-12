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
 * @author Gabriel Jesus Peres
 */
public class AtendimentoDAO implements InterfaceDAO<Atendimento> {
    private static final String INSERIR = 
            "insert into public.Atendimento (idUsuario, idTipoAtendimento, idProduto, descricaoChamado, idSituacao) values (?, ?, ?, ?, ?)";
    private static final String BUSCARTODOS = 
            "select idAtendimento,idUsuario,idTipoAtendimento,dataChamado,idProduto,descricaoChamado,idSituacao,justificativa,idAtendente,dataFinalizado from public.Atendimento";
    private static final String BUSCARPORID = 
            "select idAtendimento,idUsuario,idTipoAtendimento,dataChamado,idProduto,descricaoChamado,idSituacao,justificativa,idAtendente,dataFinalizado from public.Atendimento where idAtendimento = ?";
    private static final String DELETAR = 
            "delete from public.Atendimento where idAtendimento = ?";
    private static final String ATUALIZAR = 
            "update public.Atendimento set justificativa = ?, idAtendente = ?, dataFinalizado = ?, idSituacao = 2 where idAtendimento = ?";
    // idSituação => 1 == Em aberto ; 2 == Finalizado
    private static final String BUSCAR_ATENDIMENTOS_ABERTO = 
            "select idAtendimento,idUsuario,idTipoAtendimento,dataChamado,idProduto,descricaoChamado,idSituacao,justificativa from public.Atendimento where idSituacao = 1 ORDER BY dataChamado";
    private static final String BUSCAR_ATENDIMENTOS_CLIENTE = 
            "select idAtendimento,idUsuario,idTipoAtendimento,dataChamado,idProduto,descricaoChamado,idSituacao,justificativa,idAtendente,dataFinalizado from public.Atendimento where idUsuario = ?";

    private Connection con = null;
    
    public AtendimentoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar AtendimentoDAO.");
        }
        this.con = con;
    }

    @Override
    public Atendimento buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Atendimento atendimento = new Atendimento();
            
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                atendimento.setAtendimentoId(rs.getInt("idatendimento"));
                atendimento.setDataCriacao(rs.getDate("datachamado"));
                atendimento.setDataFinalizado(rs.getDate("datafinalizado"));
                atendimento.setJustificativa(rs.getString("justificativa"));
                atendimento.setDescricao(rs.getString("descricaochamado"));
                
                Usuario cliente = new Usuario();
                cliente.setUsuarioId(rs.getInt("idusuario"));
                atendimento.setCliente(cliente);
                
                // Realiza uma etapa extra de validação, pois Atendente pode ser nulo, 
                // caso o status ainda esteja em aberto, por exemplo
                int idAtendente = rs.getInt("idatendente");
                if (!rs.wasNull()) {
                    Usuario atendente = new Usuario();
                    atendente.setUsuarioId(idAtendente);
                    atendimento.setAtendente(atendente);
                }
                
                Produto produto = new Produto();
                produto.setProdutoId(rs.getInt("idproduto"));
                atendimento.setProduto(produto);
                
                Situacao situacao = new Situacao();
                situacao.setSituacaoId(rs.getInt("idsituacao"));
                atendimento.setSituacao(situacao);
                
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idtipoatendimento"));
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
                
                atendimento.setAtendimentoId(rs.getInt("idatendimento"));
                atendimento.setDataCriacao(rs.getDate("datachamado"));
                atendimento.setDataFinalizado(rs.getDate("datafinalizado"));
                atendimento.setJustificativa(rs.getString("justificativa"));
                atendimento.setDescricao(rs.getString("descricaochamado"));
                
                Usuario cliente = new Usuario();
                cliente.setUsuarioId(rs.getInt("idusuario"));
                atendimento.setCliente(cliente);
                
                // Realiza uma etapa extra de validação, pois Atendente pode ser nulo, 
                // caso o status ainda esteja em aberto, por exemplo
                int idAtendente = rs.getInt("idatendente");
                if (!rs.wasNull()) {
                    Usuario atendente = new Usuario();
                    atendente.setUsuarioId(idAtendente);
                    atendimento.setAtendente(atendente);
                }
                
                Produto produto = new Produto();
                produto.setProdutoId(rs.getInt("idproduto"));
                atendimento.setProduto(produto);
                
                Situacao situacao = new Situacao();
                situacao.setSituacaoId(rs.getInt("idsituacao"));
                atendimento.setSituacao(situacao);
                
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idtipoatendimento"));
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
        try (PreparedStatement st = con.prepareStatement(INSERIR, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, atendimento.getAtendimentoId());
            st.setInt(2, atendimento.getTipoAtendimento().getTipoAtendimentoId());
            st.setInt(3, atendimento.getProduto().getProdutoId());
            st.setString(4, atendimento.getDescricao());
            st.setInt(5, atendimento.getSituacao().getSituacaoId());
            
            st.executeUpdate();
            
            // Recebe de retorno do statement o idAtendimento, e então,
            // Atualiza o objeto origem, setando o idAtendimento do banco de dados
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                atendimento.setAtendimentoId(rs.getInt(1));
            }   
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o atendimento: " + atendimento.getAtendimentoId(), e);
        }
    }

    /**
     * O método de atualização serve para a conclusão dos Atendimentos, portanto
     * irá atualizar apenas: Justificativa, idAtendente, dataFinalizada e Situação
     * @param atendimento
     * @throws DAOException 
     */
    @Override
    public void atualizar(Atendimento atendimento) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            st.setString(1, atendimento.getJustificativa());
            st.setInt(2, atendimento.getAtendente().getUsuarioId());
            st.setDate(3, new java.sql.Date(atendimento.getDataFinalizado().getTime()));
            st.setInt(4, atendimento.getAtendimentoId());
            
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o atendimento: " + atendimento.getAtendimentoId(), e);
        }
    }

    @Override
    public void remover(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o atendimento: " + id, e);
        }
    }

    public List<Atendimento> buscarTodosAtendimentosAbertos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCAR_ATENDIMENTOS_ABERTO)) {
            List<Atendimento> atendimentos = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                
                atendimento.setAtendimentoId(rs.getInt("idatendimento"));
                atendimento.setDataCriacao(rs.getDate("datachamado"));
                atendimento.setJustificativa(rs.getString("justificativa"));
                atendimento.setDescricao(rs.getString("descricaochamado"));
                
                Usuario cliente = new Usuario();
                cliente.setUsuarioId(rs.getInt("idusuario"));
                atendimento.setCliente(cliente);

                Produto produto = new Produto();
                produto.setProdutoId(rs.getInt("idproduto"));
                atendimento.setProduto(produto);
                
                Situacao situacao = new Situacao();
                situacao.setSituacaoId(rs.getInt("idsituacao"));
                atendimento.setSituacao(situacao);
                
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idtipoatendimento"));
                atendimento.setTipoAtendimento(tipoAtendimento);
                
                atendimentos.add(atendimento);
            }
            
            return atendimentos;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos atendimentos", e);
        }
    }

    public List<Atendimento> buscarAtendimentosCliente(int clienteId) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCAR_ATENDIMENTOS_CLIENTE)) {
            List<Atendimento> atendimentos = new ArrayList<>();
            st.setInt(1, clienteId);
            
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                
                atendimento.setAtendimentoId(rs.getInt("idatendimento"));
                atendimento.setDataCriacao(rs.getDate("datachamado"));
                atendimento.setDataFinalizado(rs.getDate("datafinalizado"));
                atendimento.setJustificativa(rs.getString("justificativa"));
                atendimento.setDescricao(rs.getString("descricaochamado"));
                
                Usuario cliente = new Usuario();
                cliente.setUsuarioId(rs.getInt("idusuario"));
                atendimento.setCliente(cliente);
                
                // Realiza uma etapa extra de validação, pois Atendente pode ser nulo, 
                // caso o status ainda esteja em aberto, por exemplo
                int idAtendente = rs.getInt("idatendente");
                if (!rs.wasNull()) {
                    Usuario atendente = new Usuario();
                    atendente.setUsuarioId(idAtendente);
                    atendimento.setAtendente(atendente);
                }
                
                Produto produto = new Produto();
                produto.setProdutoId(rs.getInt("idproduto"));
                atendimento.setProduto(produto);
                
                Situacao situacao = new Situacao();
                situacao.setSituacaoId(rs.getInt("idsituacao"));
                atendimento.setSituacao(situacao);
                
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setTipoAtendimentoId(rs.getInt("idtipoatendimento"));
                atendimento.setTipoAtendimento(tipoAtendimento);
                
                atendimentos.add(atendimento);
            }
            
            return atendimentos;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos atendimentos do cliente Id: " + clienteId, e);
        }
    }
}
