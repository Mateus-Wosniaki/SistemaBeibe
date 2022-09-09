/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

import java.io.Serializable;

/**
 *
 * @author Gabril
 */
public class Login implements Serializable {
    private int usuarioId;
    private String nomeCompleto;
    private Funcao funcao;

    public Login() {}

    public Login(int usuarioId, String nomeCompleto, Funcao funcao) {
        this.usuarioId = usuarioId;
        this.nomeCompleto = nomeCompleto;
        this.funcao = funcao;
    }
    
    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }
 
    public Funcao getFuncao() {
        return funcao;
    }

    public void setFuncao(Funcao funcao) {
        this.funcao = funcao;
    }
}
