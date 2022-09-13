/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.exception;

/**
 *
 * @author Mateus Wosniaki
 */
public class FuncionarioException extends Exception{

    public FuncionarioException() {
    }

    public FuncionarioException(String message) {
        super(message);
    }

    public FuncionarioException(String message, Throwable cause) {
        super(message, cause);
    }
   
}
