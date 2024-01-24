package ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.entities.ProductEntity;
import ecommerce.services.ProductService;

@RestController
@CrossOrigin(origins = {"http://localhost:5173", "http://127.0.0.1:5173", "http://localhost:8080"})

@RequestMapping("/ecommerce/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	// GET
	@GetMapping
	public List<ProductEntity>listProducts() {
		return productService.getAllProduct();
	}
}
