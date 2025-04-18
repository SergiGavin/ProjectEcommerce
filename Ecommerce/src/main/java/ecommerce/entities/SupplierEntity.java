package ecommerce.entities;

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
@Table(name = "Supplier")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_supplier")
@Data
public class SupplierEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_supplier")
	private Long id_supplier;
	private String supplier_name;
	private String contact_person;
	private String email;
	private int phone;
	private String additional_notes;
	private String bank_info;
	
	@OneToMany(mappedBy="supplier")
    private List<ProductEntity> productsList;
	
	public SupplierEntity() {}
	
	public SupplierEntity(String supplier_name, String contact_person, String email, int phone, String additional_notes,
			String bank_info) {
		super();
		this.supplier_name = supplier_name;
		this.contact_person = contact_person;
		this.email = email;
		this.phone = phone;
		this.additional_notes = additional_notes;
		this.bank_info = bank_info;
	}
	
}
