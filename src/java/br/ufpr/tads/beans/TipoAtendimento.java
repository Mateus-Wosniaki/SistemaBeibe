/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

/**
 *
 * @author Mateus Wosniaki
 */
public class TipoAtendimento {
    private int tipoAtendimentoId;
    private String descricao;

    public TipoAtendimento(){};
    
    public TipoAtendimento(int tipoAtendimentoId, String descricao) {
        this.tipoAtendimentoId = tipoAtendimentoId;
        this.descricao = descricao;
    }

    public int getTipoAtendimentoId() {
        return tipoAtendimentoId;
    }

    public void setTipoAtendimentoId(int tipoAtendimentoId) {
        this.tipoAtendimentoId = tipoAtendimentoId;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
}
