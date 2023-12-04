package com.example.inventoryservice.controller;

import com.example.inventoryservice.entities.Product;
import com.example.inventoryservice.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductRepository productRespository;

    @GetMapping("/prod")
    public List<Product> allProduct(){
        return productRespository.findAll();
    }

    @GetMapping("/{id}")
    public Product product(@PathVariable Long id){
        return productRespository.findById(id).orElseThrow();
    }
}
