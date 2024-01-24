package ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.entities.SupplierEntity;
import ecommerce.services.SupplierService;

@RestController
@CrossOrigin(origins = {"http://localhost:5173", "http://127.0.0.1:5173", "http://localhost:8080"})

@RequestMapping("/ecommerce/supplier")
public class SupplierController {

	@Autowired
	private SupplierService supplierService;

	// GET
	@GetMapping
	public List<SupplierEntity>listSupplier() {
		return supplierService.getAllSuppliers();
	}
}
