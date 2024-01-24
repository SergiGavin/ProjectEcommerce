package ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecommerce.entities.ProductOrderEntity;
import ecommerce.repositories.ProductOrderRepository;

@Service
public class ProductOrderService {
	
	@Autowired
	private ProductOrderRepository productOrderRepository;
	
	public List<ProductOrderEntity>getAllproductOrder(){
		return productOrderRepository.findAll();
	}

}
