/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

/**
 *
 * @author Mateus Wosniaki
 */
public class Funcao {
    private int funcaoId;
    private String descricao;

    public Funcao(){};
    
    public Funcao(int funcaoId, String descricao) {
        this.funcaoId = funcaoId;
        this.descricao = descricao;
    }

    public int getFuncaoId() {
        return funcaoId;
    }

    public void setFuncaoId(int funcaoId) {
        this.funcaoId = funcaoId;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
}
