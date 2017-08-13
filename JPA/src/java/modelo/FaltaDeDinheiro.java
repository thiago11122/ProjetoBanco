/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Thiago
 */
public class FaltaDeDinheiro extends Exception {
    
    
    public String mensagemErro(){
        
        return "Não há dinheiro suficinente para fazer esta operação";
    }
    
    
    
}
