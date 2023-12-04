package com.example.customerservice.Controller;

import com.ctc.wstx.shaded.msv_core.util.LightStack;
import com.example.customerservice.Entities.Customer;
import com.example.customerservice.Entities.CustomerProduct;
import com.example.customerservice.Entities.Product;
import com.example.customerservice.configurations.ApplicationPropertiesConfiguration;
import com.example.customerservice.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class CustomerController {

    @Autowired
    private final ApplicationPropertiesConfiguration applicationPropertiesConfiguration;
    @Autowired(required = false)
    RestTemplate restTemplate;
    @Autowired
    CustomerRepository customerRepository;

    public CustomerController(ApplicationPropertiesConfiguration applicationPropertiesConfiguration){
        this.applicationPropertiesConfiguration = applicationPropertiesConfiguration;
    }

    @GetMapping("/customers")
    public List<Customer> getCustomer(){
        List<Customer> customers = customerRepository.findAll();
        List<Customer> limitCustomers = customers.subList(0, applicationPropertiesConfiguration.getLimitCustomers());
        return limitCustomers;
    }

    @GetMapping("/getCustomerProducts/{id}")
    public CustomerProduct getCustomerProducts(@PathVariable Long id){
        Optional<Customer> customer = customerRepository.findById(id);
        Product product= restTemplate.getForObject("http://localhost:8888/INVENTORY-SERVICE/products/" + customer.get().getProductId(), Product.class);

        return new CustomerProduct(customer.get().getId(),customer.get().getName(),customer.get().getEmail(),product.getName(),product.getPrice());
    }

    @GetMapping("/customers/{id}")
    public Optional<Customer> getCustomer(@PathVariable("id") Long id){
        return customerRepository.findById(id);
    }
}
