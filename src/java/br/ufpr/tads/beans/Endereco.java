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
public class Endereco implements Serializable {
    private int enderecoId;
    private String cep;
    private int numero;
    private String rua;
    private String complemento;
    private Cidade cidade;
    
    public Endereco(){};

    public Endereco(int enderecoId, String rua, String complemento, String cep, Cidade cidade, int numero) {
        this.enderecoId = enderecoId;
        this.rua = rua;
        this.complemento = complemento;
        this.cep = cep;
        this.cidade = cidade;
        this.numero = numero;
    }

    public int getEnderecoId() {
        return enderecoId;
    }

    public void setEnderecoId(int enderecoId) {
        this.enderecoId = enderecoId;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public Cidade getCidade() {
        return cidade;
    }

    public void setCidade(Cidade cidade) {
        this.cidade = cidade;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
}
