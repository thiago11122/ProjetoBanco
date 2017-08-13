/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.FaltaDeDinheiro;
import modelo.Pessoa;
import util.JPAutil;

/**
 *
 * @author Thiago
 */
public class controle extends HttpServlet {

    EntityManager c;
    EntityTransaction tr;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        try{
        c=JPAutil.getEntityManager();
        String acao= request.getServletPath();
        Pessoa p= new Pessoa();
        switch(acao){
            
            case"/cadastrarPessoa":
                
                p.setNome(request.getParameter("idNome"));
                p.setDiaNasc(Integer.parseInt(request.getParameter("idDia")));
                p.setMesNac(Integer.parseInt(request.getParameter("idMes")));
                p.setAnoNasc(Integer.parseInt(request.getParameter("idAno")));
                p.setCPF(request.getParameter("idCPF"));
                p.setSexo(request.getParameter("idSexo"));
                p.setRua(request.getParameter("idRua"));
                p.setBairro(request.getParameter("idBairro"));
                p.setNumCasa(Integer.parseInt(request.getParameter("idNumero")));
                p.setCidade(request.getParameter("idCidade"));
                p.setEstado(request.getParameter("idEstado"));
                p.setDinheiro(Double.parseDouble(request.getParameter("idDinheiro")));
                tr=c.getTransaction();
                tr.begin();
                c.persist(p);
                tr.commit();
                c.close();
                response.sendRedirect("cadastroSuceso.html");
                break;
                
            case "/pesquisarCPF":
            
            response.setContentType("text/plain");
            String palavra=request.getParameter("palavra");
            PrintWriter out= response.getWriter();
            
            Query consulta=c.createQuery("from Pessoa");
            List lista= consulta.getResultList();
            Iterator iterator= lista.iterator();
            while(iterator.hasNext()){
                p=(Pessoa) iterator.next();
                if(p.getCPF().equals(palavra)){
                    out.print("CPF já cadastrado!<br/>Acesse sua conta na seção de outras operações bancárias.");
                    break;
                }else if(iterator.hasNext()==false){
                    out.print("CPF ainda não cadastrado!");
                }
            }
            break;
            
            case "/retornarDados":
                String cpf= request.getParameter("palavra");
                p=c.find(Pessoa.class,cpf);
                PrintWriter out1= response.getWriter();
                out1.print("<b>Nome:&nbsp;</b>"+ p.getNome()+" &nbsp;&nbsp;&nbsp;<b>Sexo:&nbsp;</b>"+p.getSexo()+"<br/><br/>"+
                "<b>Data de Nascimento:&nbsp;</b>&nbsp"+p.getDiaNasc()+"/"+p.getMesNasc()+"/"+p.getAnoNasc()+"<br/><br/>"+
                "<b>Rua:&nbsp;</b>"+p.getRua()+"&nbsp;&nbsp;&nbsp<b>Bairro:&nbsp;</b>"+p.getBairro()+"&nbsp;&nbsp;&nbsp <b>Numero:&nbsp;</b>"+p.getNumCasa()+"<br/><br/>"+
                "<b>Cidade:&nbsp;</b>"+p.getCidade()+"&nbsp;&nbsp;&nbsp <b>Estado:&nbsp;</b>"+p.getEstado()+"<br/><br/>"+
                "<b>Saldo:&nbsp;</b>"+p.getDinheiro()
                );
            break;
            
            case"/sacar":
                String cpf1= request.getParameter("idCPF");
                double valor= Double.parseDouble(request.getParameter("valor"));
                p=c.find(Pessoa.class, cpf1);
                try{
                    p.sacar(valor);
                    tr=c.getTransaction();
                    tr.begin();
                    c.merge(p);
                    tr.commit();
                    c.close();
                    response.sendRedirect("saqueSucesso.html");
                }catch(FaltaDeDinheiro e){
                    response.sendRedirect("erroSaque.html");
                }
                break;
                
            case"/depositar":
                    String cpf2= request.getParameter("idCPF");
                    double valor1= Double.parseDouble(request.getParameter("valor"));
                    p=c.find(Pessoa.class, cpf2);
                    p.depositar(valor1);
                    tr=c.getTransaction();
                    tr.begin();
                    c.merge(p);
                    tr.commit();
                    c.close();
                    response.sendRedirect("DepositoSucesso.html");
                    break;
                    
            case "/transferir":
                    Pessoa p2=new Pessoa();
                    String cpf3=request.getParameter("idCPF");
                    String cpf4=request.getParameter("idCPF2");
                    double valor2= Double.parseDouble(request.getParameter("valor"));
                    p=c.find(Pessoa.class,cpf3);
                    p2=c.find(Pessoa.class, cpf4);
                    
                    try{
                        p.emprestar(p2, valor2);
                        tr=c.getTransaction();
                        tr.begin();
                        c.merge(p);
                        c.merge(p2);
                        tr.commit();
                        c.close();
                        response.sendRedirect("TransferenciaSucesso.html");
                    }catch(FaltaDeDinheiro e){
                        response.sendRedirect("erroTransferencia.html");
                    }
                    
        }
    }catch(Exception e){
        System.out.println("Erro:"+e.getMessage());
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
