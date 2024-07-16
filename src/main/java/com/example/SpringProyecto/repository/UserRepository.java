package com.example.SpringProyecto.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.SpringProyecto.model.User;

/*Aqui llamare unas conexiones con la clase que creamos del usuario */


public interface UserRepository extends JpaRepository<User, Long>{

}
