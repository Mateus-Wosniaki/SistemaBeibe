/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

import java.util.Date;

/**
 *
 * @author Mateus Wosniaki
 */
public class Atendimento {
    private int atendimentoId;
    private Date dataCriacao;
    private Situacao situacao;
    private Produto produto;
    private Usuario cliente;
    private TipoAtendimento tipoAtendimentoId;
    private String descricao;
    private String justificativa;

    public Atendimento(){};
    
    public Atendimento(int atendimentoId, Date dataCriacao, Situacao situacao, Produto produto, Usuario cliente, TipoAtendimento tipoAtendimentoId, String descricao, String justificativa) {
        this.atendimentoId = atendimentoId;
        this.dataCriacao = dataCriacao;
        this.situacao = situacao;
        this.produto = produto;
        this.cliente = cliente;
        this.tipoAtendimentoId = tipoAtendimentoId;
        this.descricao = descricao;
        this.justificativa = justificativa;
    }
    
    

    public int getAtendimentoId() {
        return atendimentoId;
    }

    public void setAtendimentoId(int atendimentoId) {
        this.atendimentoId = atendimentoId;
    }

    public Date getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Date dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public Situacao getSituacao() {
        return situacao;
    }

    public void setSituacao(Situacao situacao) {
        this.situacao = situacao;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public Usuario getCliente() {
        return cliente;
    }

    public void setCliente(Usuario cliente) {
        this.cliente = cliente;
    }

    public TipoAtendimento getTipoAtendimentoId() {
        return tipoAtendimentoId;
    }

    public void setTipoAtendimentoId(TipoAtendimento tipoAtendimentoId) {
        this.tipoAtendimentoId = tipoAtendimentoId;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getJustificativa() {
        return justificativa;
    }

    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }
    
    
}
