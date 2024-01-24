package ecommerce.dto;

import lombok.Data;

@Data
public class ProductOrderDTO {

	private Long id_product_has_order;
    private Long product_id_product;
    private Long purchase_order_id_order;
    
    
    public ProductOrderDTO() {}


	public ProductOrderDTO(Long id_product_has_order, Long product_id_product, Long purchase_order_id_order) {
		super();
		this.id_product_has_order = id_product_has_order;
		this.product_id_product = product_id_product;
		this.purchase_order_id_order = purchase_order_id_order;
	}
    
	
    
    
}
