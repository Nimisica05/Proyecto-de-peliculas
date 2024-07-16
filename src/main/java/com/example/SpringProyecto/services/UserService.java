package com.example.SpringProyecto.services;

import com.example.SpringProyecto.model.User;

/*Creamos esta para llevar a cabo los CRUD en esta entidad*/
/*veremos cuales son los componentes atraves de los cuales se va a generar la interfaz*/

public interface UserService {

    User newUser (User newuser);
    Iterable<User> getALL();
    User modifyUser (User user);
    Boolean deleteUser (Long iduser);
    /*con esto tenemos la comunicacion de como van a ser llamados cada uno de los metodos */
    /* Creacion, consulta, modificacion y eliminacion*/


}
