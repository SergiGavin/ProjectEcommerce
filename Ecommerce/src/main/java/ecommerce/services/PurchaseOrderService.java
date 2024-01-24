package ecommerce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecommerce.entities.PurchaseOrderEntity;
import ecommerce.repositories.PurchaseOrderRepository;

@Service
public class PurchaseOrderService {

	@Autowired
	private PurchaseOrderRepository purchaseOrderRepository;
	
	public List<PurchaseOrderEntity>getAllPurchaseOrder(){
		return purchaseOrderRepository.findAll();
	}
}
