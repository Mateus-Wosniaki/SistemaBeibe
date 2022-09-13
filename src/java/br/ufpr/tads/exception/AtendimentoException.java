/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.exception;

/**
 *
 * @author Mateus Wosniaki
 */
public class AtendimentoException extends Exception{

    public AtendimentoException() {
    }

    public AtendimentoException(String message) {
        super(message);
    }

    public AtendimentoException(String message, Throwable cause) {
        super(message, cause);
    }
   
}
