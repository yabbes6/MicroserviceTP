package com.example.customerservice.Entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomerProduct {
    private Long id;
    private String customerName;
    private String email;
    private String productName ;
    private double price;

}
