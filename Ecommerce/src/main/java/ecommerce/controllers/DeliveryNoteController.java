package ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.entities.DeliveryNoteEntity;
import ecommerce.services.DeliveryNoteService;

@RestController
@CrossOrigin(origins = {"http://localhost:5173", "http://127.0.0.1:5173", "http://localhost:8080"})

@RequestMapping("/ecommerce/delivery")
public class DeliveryNoteController {

	@Autowired
	private DeliveryNoteService deliveryNoteService;

	// GET
	@GetMapping
	public List<DeliveryNoteEntity>listDelivery() {
		return deliveryNoteService.getAllDeliveryNote();
	}
}
