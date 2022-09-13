/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

import java.io.Serializable;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class Produto implements Serializable {
    private int produtoId;
    private String nome;
    private Categoria categoria;
    private Double peso;
    private String descricao;

    public Produto(){};
    
    public Produto(int produtoId, String nome, Categoria categoria, Double peso, String descricao) {
        this.produtoId = produtoId;
        this.nome = nome;
        this.categoria = categoria;
        this.peso = peso;
        this.descricao = descricao;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
}
