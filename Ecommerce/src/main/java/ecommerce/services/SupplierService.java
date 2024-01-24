package ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecommerce.entities.SupplierEntity;
import ecommerce.repositories.SupplierRepository;

@Service
public class SupplierService {

	@Autowired
	private SupplierRepository supplierRepository;
	
	public List<SupplierEntity>getAllSuppliers(){
		return supplierRepository.findAll();
	}
}
