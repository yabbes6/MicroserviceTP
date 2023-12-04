package com.example.customerservice;

import com.example.customerservice.Entities.Customer;
import com.example.customerservice.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CustomerServiceApplication implements CommandLineRunner {
	@Autowired
	CustomerRepository customerRepository;

	public static void main(String[] args) {
		SpringApplication.run(CustomerServiceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		customerRepository.save(new Customer(null,"imane","imane@gmail.com",null));
		customerRepository.save(new Customer(null,"yassine","yassine@gmail.com",null));
		customerRepository.save(new Customer(null,"omar","omar@gmail.com",null));

	}
}
