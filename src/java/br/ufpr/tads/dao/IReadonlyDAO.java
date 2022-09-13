/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.exception.DAOException;
import java.util.List;

/**
 * Interface para DAOs estáticas do sistema, como Cidade, Estado, Situacao, etc
 * @author Gabril
 * @param <T> Bean genérico
 */
public interface IReadonlyDAO<T> {
    T buscar(int id) throws DAOException;
    List<T> buscarTodos() throws DAOException;
}
