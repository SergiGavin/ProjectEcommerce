package ecommerce.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecommerce.entities.ProductEntity;
import ecommerce.repositories.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	public List<ProductEntity>getAllProduct(){
		return productRepository.findAll();
	}
	 public Optional<ProductEntity> getProductById(Long productId) {
	        return productRepository.findById(productId);
	 }
	 public List<ProductEntity> getNewProducts() {
		 return productRepository.findAllByOrderByCreationDateDesc();
	 }
	 public List<ProductEntity> getProductWithDiscount() {
		 return productRepository.findAllByOrderByDiscountDesc();
	 }
}
