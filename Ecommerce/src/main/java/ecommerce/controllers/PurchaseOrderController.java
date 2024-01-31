package ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.entities.PurchaseOrderEntity;
import ecommerce.services.PurchaseOrderService;

@RestController
@CrossOrigin(origins = {"http://localhost:4200", "http://127.0.0.1:4200", "http://localhost:8080"})

@RequestMapping("/ecommerce/purchaseorder")
public class PurchaseOrderController {

	@Autowired
	private PurchaseOrderService purchaseOrderService;

	// GET
	@GetMapping
	public List<PurchaseOrderEntity>listPurchaseOrder() {
		return purchaseOrderService.getAllPurchaseOrder();
	}
}
