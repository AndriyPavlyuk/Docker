package it.discovery.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import it.discovery.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
