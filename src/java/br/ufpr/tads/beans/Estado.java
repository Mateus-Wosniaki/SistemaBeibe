/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

/**
 *
 * @author Mateus Wosniaki
 */
public class Estado {
    private int estadoId;
    private String descricao;
    
    public Estado(){};

    public Estado(int estadoId, String descricao) {
        this.estadoId = estadoId;
        this.descricao = descricao;
    }

    public int getEstadoId() {
        return estadoId;
    }

    public void setEstadoId(int estadoId) {
        this.estadoId = estadoId;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
}
