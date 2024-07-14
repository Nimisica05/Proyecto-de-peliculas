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
public class ProyectoPeliculasUPDATE {

    public static void main(String[] args) throws SQLException {
        
        String usuario = "root";
        String password = "";
        String url = "jdbc:mysql://localhost:3310/proyectopeliculas";
        Connection conexion;
        Statement statement;
        ResultSet rs;
        
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            conexion = DriverManager.getConnection(url,usuario,password);
            statement = conexion.createStatement();
            statement.executeUpdate("UPDATE USUARIO SET NOMBRE = 'Tony' WHERE NOMBRE = 'ABC'");
            rs = statement.executeQuery("SELECT * FROM USUARIO");
            rs.next();
            do{
                System.out.println(rs.getInt("id_usuario")+" : "+rs.getString("NOMBRE"));
            }while(rs.next());
            
        } catch (ClassNotFoundException | SQLException ex) {
           ex.printStackTrace();
        }
   
        

    }  
}
