package com.example.SpringProyecto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.SpringProyecto.model.User;
import com.example.SpringProyecto.services.UserService;

@RestController
@RequestMapping ("/User")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/nuevo")
    public User newUser(@RequestBody User newUser) {
        return this.userService.newUser(newUser);
    }

    @GetMapping("/mostrar")
    public Iterable<User> grtALL(){
        return userService.getALL();
    }

    @PostMapping("/modificar")
    public User updateUser(@RequestBody User user){
        return this.userService.modifyUser(user);
    }

    @PostMapping(value="/{id}")
    public Boolean deleteUser(@PathVariable(value="id")Long id) {
        return this.userService.deleteUser(id);
    }

}
