package ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import ecommerce.entities.DeliveryNoteEntity;

public interface DeliveryNoteRepository extends JpaRepository<DeliveryNoteEntity, Long> { 

}
