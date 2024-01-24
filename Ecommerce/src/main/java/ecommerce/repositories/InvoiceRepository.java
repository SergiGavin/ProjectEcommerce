package ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ecommerce.entities.InvoiceEntity;

public interface InvoiceRepository extends JpaRepository<InvoiceEntity, Long> { 

}
