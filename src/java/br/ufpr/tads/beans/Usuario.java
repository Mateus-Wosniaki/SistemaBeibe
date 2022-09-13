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
public class Usuario extends Login implements Serializable {
    private String email;
    private String cpf;
    private String telefone;
    private String senha;
    private Endereco endereco;
    
    public Usuario(){};

    public Usuario(int usuarioId, String nomeCompleto, String email, String cpf, String telefone, String senha, Endereco endereco, Funcao funcao) {
        super(usuarioId, nomeCompleto, funcao);
        this.email = email;
        this.cpf = cpf;
        this.telefone = telefone;
        this.senha = senha;
        this.endereco = endereco;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
}
