/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

/**
 *
 * @author Mateus Wosniaki
 */
public class Situacao {
    private int situacaoId;
    private String descricao;

    public Situacao(){};
    
    public Situacao(int situacaoId, String descricao) {
        this.situacaoId = situacaoId;
        this.descricao = descricao;
    }
    
    public int getSituacaoId() {
        return situacaoId;
    }

    public void setSituacaoId(int situacaoId) {
        this.situacaoId = situacaoId;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
}
