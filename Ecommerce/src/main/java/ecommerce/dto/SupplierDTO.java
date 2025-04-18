package ecommerce.dto;

import java.util.List;

import lombok.Data;
@Data
public class SupplierDTO {

	private Long id_supplier;
	private String supplier_name;
	private String contact_person;
	private String email;
	private int phone;
	private String additional_notes;
	private String bank_info;
	
    private List<Long> productsList;
    
    public SupplierDTO() {}
    
	public SupplierDTO(Long id_supplier, String supplier_name, String contact_person, String email, int phone,
			String additional_notes, String bank_info, List<Long> productsList) {
		super();
		this.id_supplier = id_supplier;
		this.supplier_name = supplier_name;
		this.contact_person = contact_person;
		this.email = email;
		this.phone = phone;
		this.additional_notes = additional_notes;
		this.bank_info = bank_info;
		this.productsList = productsList;
	}
    
    
}
