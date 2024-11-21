package ecommerce.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.dto.ProductDTO;
import ecommerce.entities.ProductEntity;
import ecommerce.entities.ProductOrderEntity;
import ecommerce.services.ProductService;

@RestController
@CrossOrigin(origins = {"http://localhost:4200", "http://127.0.0.1:4200", "http://localhost:8080","http://127.0.0.1:8080"})

@RequestMapping("/ecommerce/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public List<ProductDTO> listProduct() {
        List<ProductEntity> productEntities = productService.getAllProduct();
        return convertToDTOs(productEntities);
    }

    @GetMapping("/{productId}")
    public ResponseEntity<?> getProductById(@PathVariable Long productId) {
        Optional<ProductEntity> productEntityOptional = productService.getProductById(productId);

        if (productEntityOptional.isPresent()) {
            ProductEntity productEntity = productEntityOptional.get();
            ProductDTO productDTO = convertToDTO1item(productEntity);

            return new ResponseEntity<>(productDTO, HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Producto no encontrado", HttpStatus.NOT_FOUND);
        }
    }
    @GetMapping("/nuevos")
    public List<ProductDTO> getNewProducts() {
        List<ProductEntity> newProducts = productService.getNewProducts();
        return convertToDTOs(newProducts);
    }
    @GetMapping("/ofertas")
    public List<ProductDTO> getProductsWithDiscount() {
        List<ProductEntity> newProducts = productService.getProductWithDiscount();
        return convertToDTOs(newProducts);
    }
    
    
  
    
    
    
    //Metodo para convertir a DTO para muchos.
    private List<ProductDTO> convertToDTOs(List<ProductEntity> productEntities) {
        List<ProductDTO> productDTOs = new ArrayList<>();

        for (ProductEntity entity : productEntities) {
            List<Long> orderIds = convertToOrderIds(entity.getProductOrders());

            ProductDTO dto = new ProductDTO(
                entity.getId_product(),
                entity.getProduct_name(),
                entity.getDescription(),
                entity.getPrice(),
                entity.getStock_quantity(),
                entity.getCategory(),
                entity.getCreationDate(),
                entity.getUpdate_date(),
                entity.getDiscount(),
                entity.getTaxes(),
                entity.getProduct_image(),
                entity.getAvailability(),
                entity.getTechnical_specifications(),
                orderIds
            );

            productDTOs.add(dto);
        }

        return productDTOs;
    }
    //Metodo para convertir a DTO para uno solo.
    private ProductDTO convertToDTO1item(ProductEntity entity) {
        List<Long> orderIds = convertToOrderIds(entity.getProductOrders());

        return new ProductDTO(
            entity.getId_product(),
            entity.getProduct_name(),
            entity.getDescription(),
            entity.getPrice(),
            entity.getStock_quantity(),
            entity.getCategory(),
            entity.getCreationDate(),
            entity.getUpdate_date(),
            entity.getDiscount(),
            entity.getTaxes(),
            entity.getProduct_image(),
            entity.getAvailability(),
            entity.getTechnical_specifications(),
            orderIds
        );
    }

    private List<Long> convertToOrderIds(List<ProductOrderEntity> productOrderEntities) {
        List<Long> orderIds = new ArrayList<>();
        for (ProductOrderEntity productOrderEntity : productOrderEntities) {
            Long orderId = productOrderEntity.getPurchase_order().getId_order();
            orderIds.add(orderId);
        }

        System.out.println("El array tiene: " + orderIds);
        return orderIds;
    }
}