package ecommerce.entities;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "product")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_product")
@Data
public class ProductEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_product")
	private Long id_product;
	private String product_name;
	private String description;
	private double price;
	private int stock_quantity;
	private String category;
	@Column(name = "creation_date")
	private Date creationDate;
	private Date update_date;
	private double discount;
	private double taxes;
	private String product_image;
	private Boolean availability;
	private String technical_specifications;
	
	@OneToMany(mappedBy = "product")
	private List<ProductOrderEntity> productOrders;
	
	@ManyToOne
    @JoinColumn(name = "supplier_id_supplier")
    private SupplierEntity supplier;
	
	
	public ProductEntity() {}
	
	public ProductEntity(String product_name, String description, double price, int stock_quantity, String category,
			Date creation_date, Date update_date, double discount, double taxes, String product_image,
			Boolean availability, String technical_specifications, SupplierEntity supplier) {
		super();
		this.product_name = product_name;
		this.description = description;
		this.price = price;
		this.stock_quantity = stock_quantity;
		this.category = category;
		this.creationDate = creation_date;
		this.update_date = update_date;
		this.discount = discount;
		this.taxes = taxes;
		this.product_image = product_image;
		this.availability = availability;
		this.technical_specifications = technical_specifications;
		this.supplier = supplier;
	}
	 
	
	
}