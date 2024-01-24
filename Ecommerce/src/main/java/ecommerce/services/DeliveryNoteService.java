package ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecommerce.entities.DeliveryNoteEntity;
import ecommerce.repositories.DeliveryNoteRepository;

@Service
public class DeliveryNoteService {

	@Autowired
	private DeliveryNoteRepository deliveryNoteRepository;
	
	public List<DeliveryNoteEntity>getAllDeliveryNote(){
		return deliveryNoteRepository.findAll();
	}
	
}
