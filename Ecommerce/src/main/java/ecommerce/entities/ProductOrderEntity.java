package ecommerce.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "product_has_order")
@Data
public class ProductOrderEntity {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_product_has_order")
	private Long id_product_has_order;
	
	
		@ManyToOne
		@JoinColumn(name = "product_id_product", referencedColumnName = "id_product")
		 private ProductEntity product;
		@ManyToOne
		@JoinColumn(name = "purchase_order_id_order", referencedColumnName = "id_order")
		 private PurchaseOrderEntity purchase_order;
		
	


	    public ProductOrderEntity() {}
	    
		public ProductOrderEntity(ProductEntity product, PurchaseOrderEntity purchase_order) {
			super();
			this.product = product;
			this.purchase_order = purchase_order;
		}
	    
	    
}