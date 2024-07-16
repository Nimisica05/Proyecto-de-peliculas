package com.example.SpringProyecto.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

/*Creamos una clase en el paquete model; pata generar la entidad de la aplicacion */

@Entity
@Data
public class User {
    @Id
    @Column
    private Long iduser;
    @Column
    private String nombre;
    @Column
    private String email;
    @Column
    private String password;


}
