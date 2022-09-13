/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.beans;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Mateus Wosniaki, Gabriel Jesus Peres
 */
public class Atendimento implements Serializable {
    private int atendimentoId;
    private Date dataCriacao;
    private Date dataFinalizado;
    private Situacao situacao;
    private Produto produto;
    private Usuario cliente;
    private Usuario atendente;
    private TipoAtendimento tipoAtendimento;
    private String descricao;
    private String justificativa;

    public Atendimento(){};

    public Atendimento(int atendimentoId, Date dataCriacao, Date dataFinalizado, Situacao situacao, Produto produto, Usuario cliente, Usuario atendente, TipoAtendimento tipoAtendimento, String descricao, String justificativa) {
        this.atendimentoId = atendimentoId;
        this.dataCriacao = dataCriacao;
        this.dataFinalizado = dataFinalizado;
        this.situacao = situacao;
        this.produto = produto;
        this.cliente = cliente;
        this.atendente = atendente;
        this.tipoAtendimento = tipoAtendimento;
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

    public TipoAtendimento getTipoAtendimento() {
        return tipoAtendimento;
    }

    public void setTipoAtendimento(TipoAtendimento tipoAtendimento) {
        this.tipoAtendimento = tipoAtendimento;
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

    public Date getDataFinalizado() {
        return dataFinalizado;
    }

    public void setDataFinalizado(Date dataFinalizado) {
        this.dataFinalizado = dataFinalizado;
    }

    public Usuario getAtendente() {
        return atendente;
    }

    public void setAtendente(Usuario atendente) {
        this.atendente = atendente;
    }
    
    
    
}
