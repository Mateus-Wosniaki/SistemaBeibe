/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.exception;

/**
 *
 * @author Mateus Wosniaki
 */
public class CategoriaException extends Exception{

    public CategoriaException() {
    }

    public CategoriaException(String message) {
        super(message);
    }

    public CategoriaException(String message, Throwable cause) {
        super(message, cause);
    }
   
}
