package ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ecommerce.entities.CustomerEntity;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> { 

}
