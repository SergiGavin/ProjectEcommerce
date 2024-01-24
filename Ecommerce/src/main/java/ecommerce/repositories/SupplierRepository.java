package ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ecommerce.entities.SupplierEntity;

public interface SupplierRepository extends JpaRepository<SupplierEntity, Long> {  

}
