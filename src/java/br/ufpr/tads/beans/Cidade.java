/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

/**
 *
 * @author Mateus Wosniaki
 */
public class Cidade {
    private int cidadeId;
    private String descricao;
    private Estado estado;
    
    public Cidade(){};

    public Cidade(int cidadeId, String descricao, Estado estado) {
        this.cidadeId = cidadeId;
        this.descricao = descricao;
        this.estado = estado;
    }

    public int getCidadeId() {
        return cidadeId;
    }

    public void setCidadeId(int cidadeId) {
        this.cidadeId = cidadeId;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }
    
    
}
