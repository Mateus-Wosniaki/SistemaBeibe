/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.exception.DAOException;

/**
 * Implementação dos métodos CRUD, extendendo métodos de leitura da interface
 * ReadonlyDAO
 * @author Gabril
 * @param <T> Bean Genérico
 */
public interface InterfaceDAO<T> extends IReadonlyDAO<T> {
    
    void inserir(T t) throws DAOException;

    void atualizar(T t) throws DAOException;

    void remover(T t) throws DAOException;
}
