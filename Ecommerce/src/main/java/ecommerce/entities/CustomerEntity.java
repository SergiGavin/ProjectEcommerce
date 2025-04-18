package ecommerce.entities;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;



@Entity
@Table(name = "Customer")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_customer")
@Data
public class CustomerEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_customer")
	private Long id_customer;
	private String first_name;
	private String last_name;
	private String identify_document;
	private String email;
	private int phone;
	private String address;
	private String city;
	private String province;
	private int zip_code;
	private String country;
	private Date registration_date;
	private String payment_info;
	private String account_status;
	private String username;
	private String password;
	
	@OneToMany(mappedBy="purchase_id_customer")
    private List<PurchaseOrderEntity> orderList; 
	
	
	public CustomerEntity() {}
	
	
	
	public CustomerEntity(String first_name, String last_name, String identify_document, String email, int phone,
			String address, String city, String province, int zip_code, String country, Date registration_date,
			String payment_info, String account_status, String username, String password) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.identify_document = identify_document;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.province = province;
		this.zip_code = zip_code;
		this.country = country;
		this.registration_date = registration_date;
		this.payment_info = payment_info;
		this.account_status = account_status;
		this.username = username;
		this.password = password;
	}


	
	
}