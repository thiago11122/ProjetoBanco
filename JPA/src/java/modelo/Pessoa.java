/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author Thiago
 */

@Entity
@Table (name="Pessoa")
public class Pessoa implements Serializable {
    
    @Id
    private String CPF;
    @Column(name="diaNasc")
    private int diaNasc;
    @Column(name="mesNasc")
    private int mesNasc;
    @Column (name="anoNasc")
    private int anoNasc;
    @Column(name="sexo")
    private String sexo;
    @Column(name="rua")
    private String rua;
    @Column(name="bairro")
    private String bairro;
    @Column(name="numCasa")
    private int numCasa;
    @Column(name="cidade")
    private String cidade;
    @Column(name="estado")
    private String estado;
    @Column(name="dinheiro")
    private double dinheiro;
    @Column(name="nome")
    private String nome;
    
    
    //Métodos Gets e Sets
    public void setCPF(String CPF){
        this.CPF=CPF;
    }
    
    public String getCPF(){
        return CPF;
    }
    
    public void setDiaNasc(int diaNasc){
        this.diaNasc=diaNasc;
    }
    
    public int getDiaNasc(){
        return diaNasc;
    }
    
    public void setMesNac(int mesNasc){
        this.mesNasc=mesNasc;
    }
    
    public int getMesNasc(){
        return mesNasc;
    }

    public int getAnoNasc() {
        return anoNasc;
    }

    public void setAnoNasc(int anoNasc) {
        this.anoNasc = anoNasc;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public int getNumCasa() {
        return numCasa;
    }

    public void setNumCasa(int numCasa) {
        this.numCasa = numCasa;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public void setDinheiro(double dinheiro){
        this.dinheiro=dinheiro;
    }
    
    public double getDinheiro(){
        return dinheiro;
    }
    
    public void setNome(String nome){
        this.nome=nome;
    }
    
    public String getNome(){
        return nome;
    }
    
    //Método de empréstimo de dinheiro
    public void emprestar(Pessoa p, double valor) throws FaltaDeDinheiro{
        
        if(valor>dinheiro){
           throw new FaltaDeDinheiro(); 
        }else{
           dinheiro=dinheiro-valor;
           p.dinheiro=p.dinheiro+valor; 
        }
        
        
    }
    
    //Método para sacar
    
    public void sacar(double valor) throws FaltaDeDinheiro{
        
        if(valor>dinheiro){
            throw new FaltaDeDinheiro();
        }else{
           dinheiro=dinheiro-valor; 
        }
        
    }
    
    //Método para depositar
    
    public void depositar(double valor){
        dinheiro=dinheiro+valor;
        
    }
    
    //Sobrescrita do método ToString()

    @Override
    public String toString() {
        return nome;
    }
    
    
    
    
}
