package ecommerce.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.dto.ProductOrderDTO;
import ecommerce.entities.ProductOrderEntity;
import ecommerce.services.ProductOrderService;

@RestController
@CrossOrigin(origins = {"http://localhost:5173", "http://127.0.0.1:5173", "http://localhost:8080"})

@RequestMapping("/ecommerce/productorder")
public class ProductOrderController {
	
    @Autowired
    private ProductOrderService productOrderService;

    // GET
    @GetMapping
    public List<ProductOrderDTO> listProductOrder() {
        List<ProductOrderEntity> productOrderEntities = productOrderService.getAllproductOrder();

        // Convertir entidades a DTOs
        List<ProductOrderDTO> productOrderDTOs = convertToDTOs(productOrderEntities);

        return productOrderDTOs;
    }

    // Método para convertir entidades a DTOs
    private List<ProductOrderDTO> convertToDTOs(List<ProductOrderEntity> productOrderEntities) {
        List<ProductOrderDTO> productOrderDTOs = new ArrayList<>();
        
        for (ProductOrderEntity entity : productOrderEntities) {
            ProductOrderDTO dto = new ProductOrderDTO(
                entity.getId_product_has_order(),
                entity.getProduct().getId_product(),
                entity.getPurchase_order().getId_order()
            );

            productOrderDTOs.add(dto);
        }

        return productOrderDTOs;
    }
	
	
}
