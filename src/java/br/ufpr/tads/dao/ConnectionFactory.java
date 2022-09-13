/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.dao;

import br.ufpr.tads.exception.DAOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Gabril
 */
public class ConnectionFactory implements AutoCloseable {
    
    private static final String DRIVER = "org.postgresql.Driver";
    private static final String URL    = "jdbc:postgresql://ec2-54-227-248-71.compute-1.amazonaws.com:5432/ddh6iphitj33pc";
    private static final String LOGIN  = "mavnfysevtdgxn";
    private static final String SENHA  = "56b0760dc63b7531000f1616ca038ca0495a4b529a8292cedb6d8ed1b6bb361a";

    private Connection con = null;

    public Connection getConnection() throws DAOException {
        if (con == null) {
            try {
                Class.forName(DRIVER);
                con = DriverManager.getConnection(URL, LOGIN, SENHA);
            } catch (ClassNotFoundException e) {
                throw new DAOException("Erro JDBC: Driver não encontrado", e);
            } catch (SQLException e) {
                throw new DAOException("Erro JDBC: Problema ao se conectar com o banco de dados", e);
            }
        }
        
        return con;
    }
    
    @Override
    public void close() {
        if (con != null) {
            try {
                con.close();
                con = null;
            } catch (SQLException e) {
                System.out.println("Erro JDBC: Problema ao fechar a conexão do banco de dados. Esse erro será ignorado!");
                e.printStackTrace();
            }
        }
    }
}
