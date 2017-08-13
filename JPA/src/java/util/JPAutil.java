/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Thiago
 */
public class JPAutil {
    
    private static final  EntityManagerFactory factory;  
    
    static { 
        factory = Persistence.createEntityManagerFactory("JPAPU");  
    }  
    public static EntityManager getEntityManager() { 
        return factory.createEntityManager();  
    }  
    public static void close() { 
        factory.close();  
    }
    
}
