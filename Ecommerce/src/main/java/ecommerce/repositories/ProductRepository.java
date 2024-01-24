package ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ecommerce.entities.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> { 

}
