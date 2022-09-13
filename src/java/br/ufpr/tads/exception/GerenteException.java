/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.exception;

/**
 *
 * @author Mateus Wosniaki
 */
public class GerenteException extends Exception{

    public GerenteException() {
    }

    public GerenteException(String message) {
        super(message);
    }

    public GerenteException(String message, Throwable cause) {
        super(message, cause);
    }
   
}
