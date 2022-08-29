/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.exception.DAOException;
import java.util.List;

/**
 *
 * @author Gabril
 */
public interface DAO<T> {

    T buscar(int id) throws DAOException;

    List<T> buscarTodos() throws DAOException;

    void inserir(T t) throws DAOException;

    void atualizar(T t) throws DAOException;

    void remover(T t) throws DAOException;
}
