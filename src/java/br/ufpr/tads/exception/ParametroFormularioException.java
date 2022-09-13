/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.ufpr.tads.exception;

/**
 *
 * @author Gabril
 */
public class ParametroFormularioException extends Exception {

    public ParametroFormularioException() {
    }

    public ParametroFormularioException(String message) {
        super("Erro no parâmetro do formulário: "+message);
    }

    public ParametroFormularioException(String message, Throwable cause) {
        super("Erro no parâmetro do formulário: "+message, cause);
    }
    
}
