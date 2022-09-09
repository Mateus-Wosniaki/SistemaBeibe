/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.exception;

/**
 *
 * @author Mateus Wosniaki
 */
public class LoginException extends Exception{

    public LoginException() {
    }

    public LoginException(String message) {
        super("Erro Login: " + message);
    }

    public LoginException(String message, Throwable cause) {
        super("Erro Login: " + message, cause);
    }
   
}
