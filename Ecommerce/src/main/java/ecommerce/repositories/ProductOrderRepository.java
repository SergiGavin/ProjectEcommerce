package ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ecommerce.entities.ProductOrderEntity;

public interface ProductOrderRepository extends JpaRepository<ProductOrderEntity, Long> {  

}
