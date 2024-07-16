package com.example.SpringProyecto.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.SpringProyecto.model.User;
import com.example.SpringProyecto.repository.UserRepository;

/*Ahora realizaremos la implementación de ese servicio*/

@Service
public class UserServiceImplementacion implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User newUser (User newUser) {
        return userRepository.save(newUser);
    }

    @Override
    public Iterable<User> getALL(){
        return this.userRepository.findAll();
    }

    @Override
    public User modifyUser (User user) {

        Optional<User> userEncontrado = this.userRepository.findById(user.getIduser());
        if(userEncontrado.get()!=null){
            userEncontrado.get().setNombre(user.getNombre());
            userEncontrado.get().setEmail(user.getEmail());
            userEncontrado.get().setPassword(user.getPassword());
            return this.newUser(userEncontrado.get());
        }

        return null;
    }

    @Override
    public Boolean deleteUser(Long iduser){
        this.userRepository.deleteById(iduser);
        return true;
    }

}
