/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package proyectopeliculas;

/**
 *
 * @author NiGonzalez
 */

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class ProyectoPeliculasINSERT {

    /**.
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String usuario = "root";
        String password = "";
        String url = "jdbc:mysql://localhost:3310/proyectopeliculas";
        Connection conexion;
        Statement statement;
        ResultSet rs;
        
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            
            
            // TODO code application logic here
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProyectoPeliculasINSERT.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            conexion = DriverManager.getConnection(url,usuario,password);
            statement = conexion.createStatement();
            statement.executeUpdate("INSERT INTO USUARIO(NOMBRE,CORREO,CONTRASENA) VALUES('ABC','ABC@GMAIL.COM','ABC123')");
            rs = statement.executeQuery("SELECT * FROM USUARIO");
            rs.next();
            do{
                System.out.println(rs.getInt("id_usuario")+" : "+rs.getString("NOMBRE"));
            }while(rs.next());
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ProyectoPeliculasINSERT.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
