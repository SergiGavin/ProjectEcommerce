package ecommerce.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.dto.SupplierDTO;
import ecommerce.entities.ProductEntity;
import ecommerce.entities.SupplierEntity;
import ecommerce.services.SupplierService;

@RestController
@CrossOrigin(origins = {"http://localhost:4200", "http://127.0.0.1:4200", "http://localhost:8080"})

@RequestMapping("/ecommerce/supplier")
public class SupplierController {

	@Autowired
	private SupplierService supplierService;

	// GET
	@GetMapping
    public List<SupplierDTO> listSupplier() {
        List<SupplierEntity> supplierEntities = supplierService.getAllSuppliers();
        return convertToDTOs(supplierEntities);
    }

	private List<SupplierDTO> convertToDTOs(List<SupplierEntity> supplierEntities) {
	    List<SupplierDTO> supplierDTOs = new ArrayList<>();

	    for (SupplierEntity entity : supplierEntities) {
	    	List<Long> productIds = convertToProductIds(entity.getProductsList());
	    	
	    	SupplierDTO dto = new SupplierDTO(
	    	    entity.getId_supplier(),
	    	    entity.getSupplier_name(),
	    	    entity.getContact_person(),
	    	    entity.getEmail(),
	    	    entity.getPhone(),
	    	    entity.getAdditional_notes(),
	    	    entity.getBank_info(),
	    	    productIds
	    	);

	        supplierDTOs.add(dto);
	    }

	    return supplierDTOs;
	}

	private List<Long> convertToProductIds(List<ProductEntity> productEntities) {
	    List<Long> productIds = new ArrayList<>();
	    for (ProductEntity productEntity : productEntities) {
	        productIds.add(productEntity.getId_product());
	    }

	    System.out.println("El array tiene: " + productIds);
	    return productIds;
	}
}
