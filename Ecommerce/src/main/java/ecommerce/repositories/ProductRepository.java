package ecommerce.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ecommerce.entities.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> { 

	List<ProductEntity> findAllByOrderByCreationDateDesc();
	List<ProductEntity> findAllByOrderByDiscountDesc();


}
