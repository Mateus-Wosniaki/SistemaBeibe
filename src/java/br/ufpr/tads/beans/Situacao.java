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
public class Situacao implements Serializable {
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
