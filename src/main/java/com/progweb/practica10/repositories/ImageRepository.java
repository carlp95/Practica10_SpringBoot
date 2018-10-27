package com.progweb.practica10.repositories;

import com.progweb.practica10.entities.Image;
import org.springframework.data.jpa.repository.JpaRepository;

//DEPRECADO
public interface ImageRepository extends JpaRepository<Image, Long> {

    // TODO - este repositorio no es necesario pues

}
