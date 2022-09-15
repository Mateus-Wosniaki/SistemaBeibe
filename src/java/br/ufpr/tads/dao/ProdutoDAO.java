/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.beans.Categoria;
import java.sql.Connection;
import br.ufpr.tads.beans.Produto;
import br.ufpr.tads.exception.DAOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabriel Jesus Peres
 */
public class ProdutoDAO implements InterfaceDAO<Produto> {
    private static final String INSERIR = "insert into public.Produto (tituloProduto, descricaoProduto, pesoProduto, idCategoria) values (?, ?, ?, ?)";
    private static final String BUSCARTODOS = "select p.idProduto, p.tituloProduto, p.descricaoProduto, p.pesoProduto, p.idCategoria, c.nomeCategoria from public.Produto p inner join Categoria c on c.idCategoria = p.idCategoria WHERE p.deleted = false";
    private static final String BUSCARPORID = "select p.idProduto, p.tituloProduto, p.descricaoProduto, p.pesoProduto, p.idCategoria, c.nomeCategoria from public.Produto p inner join Categoria c on c.idCategoria = p.idCategoria where p.idProduto = ? AND p.deleted = false";
    private static final String DELETAR = "UPDATE Produto SET deleted = true where idProduto = ?";
    private static final String ATUALIZAR = "update public.Produto set tituloProduto = ?, descricaoProduto = ?, pesoProduto = ?, idCategoria = ? where idProduto = ?";

    private Connection con = null;
    
    public ProdutoDAO(Connection con) throws DAOException {
        if (con == null) {
            throw new DAOException("Erro DAO: Conexão nula ao criar ProdutoDAO.");
        }
        this.con = con;
    }

    @Override
    public Produto buscar(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARPORID)) {
            Produto produto = new Produto();
            st.setInt(1, id);
            
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                produto.setProdutoId(rs.getInt("idproduto"));
                produto.setNome(rs.getString("tituloproduto"));
                produto.setDescricao(rs.getString("descricaoproduto"));
                produto.setPeso(rs.getDouble("pesoproduto"));
                
                Categoria categoria = new Categoria();
                categoria.setCategoriaId(rs.getInt("idcategoria"));
                categoria.setDescricao(rs.getString("nomecategoria"));
                
                produto.setCategoria(categoria);
            }
            
            return produto;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar o produto ID: " + id, e);
        }
    }

    @Override
    public List<Produto> buscarTodos() throws DAOException {
        try (PreparedStatement st = con.prepareStatement(BUSCARTODOS)) {
            List<Produto> produtos = new ArrayList<>();
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                
                produto.setProdutoId(rs.getInt("idproduto"));
                produto.setNome(rs.getString("tituloproduto"));
                produto.setDescricao(rs.getString("descricaoproduto"));
                produto.setPeso(rs.getDouble("pesoproduto"));
                
                Categoria categoria = new Categoria();
                categoria.setCategoriaId(rs.getInt("idcategoria"));
                categoria.setDescricao(rs.getString("nomecategoria"));
                
                produto.setCategoria(categoria);
                
                produtos.add(produto);
            }
            
            return produtos;
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao recuperar todos produtos", e);
        }
    }

    @Override
    public void inserir(Produto produto) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(INSERIR, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, produto.getNome());
            st.setString(2, produto.getDescricao());
            st.setDouble(3, produto.getPeso());
            st.setInt(4, produto.getCategoria().getCategoriaId());
            
            st.executeUpdate();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                produto.setProdutoId(rs.getInt(1));
            }
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao inserir o produto: " + produto.getDescricao(), e);
        }
    }

    @Override
    public void atualizar(Produto produto) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(ATUALIZAR)) {
            st.setString(1, produto.getNome());
            st.setString(2, produto.getDescricao());
            st.setDouble(3, produto.getPeso());
            st.setInt(4, produto.getCategoria().getCategoriaId());
            st.setInt(5, produto.getProdutoId());
            
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao atualizar o produto: " + produto.getDescricao(), e);
        }
    }

    @Override
    public void remover(int id) throws DAOException {
        try (PreparedStatement st = con.prepareStatement(DELETAR)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch(SQLException e) {
            throw new DAOException("Erro DAO: Problema ao remover o produto: " + id, e);
        }
    }
}
