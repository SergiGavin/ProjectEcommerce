package ecommerce.dto;

import java.util.Date;
import java.util.List;

import ecommerce.entities.ProductOrderEntity;
import jakarta.persistence.Column;
import jakarta.persistence.OneToMany;
import lombok.Data;
@Data
public class ProductDTO {

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
	private List<Long> productOrders;
	
	public ProductDTO() {}
	
	public ProductDTO(Long id_product, String product_name, String description, double price, int stock_quantity,
			String category, Date creation_date, Date update_date, double discount, double taxes, String product_image,
			Boolean availability, String technical_specifications, List<Long> productOrders) {
		super();
		this.id_product = id_product;
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
		this.productOrders = productOrders;
	}
	
	
}
