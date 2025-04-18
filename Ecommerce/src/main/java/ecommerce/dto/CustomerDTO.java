package ecommerce.dto;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CustomerDTO {
    private Long idCustomer;
    private String firstName;
    private String lastName;
    private String identifyDocument;
    private String email;
    private int phone;
    private String address;
    private String city;
    private String state;
    private Integer zipCode;
    private String country;
    private Date registrationDate;
    private String paymentInfo;
    private String accountStatus;
    private String username;
    private String password;
    private List<Long> orderList;
    
    public CustomerDTO() {}
    
	public CustomerDTO(Long idCustomer, String firstName, String lastName, String identifyDocument, String email,
			int phone, String address, String city, String state, Integer zipCode, String country,
			Date registrationDate, String paymentInfo, String accountStatus, String username, String password,
			List<Long> orderList) {
		super();
		this.idCustomer = idCustomer;
		this.firstName = firstName;
		this.lastName = lastName;
		this.identifyDocument = identifyDocument;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.country = country;
		this.registrationDate = registrationDate;
		this.paymentInfo = paymentInfo;
		this.accountStatus = accountStatus;
		this.username = username;
		this.password = password;
		this.orderList = orderList;
	}

	public CustomerDTO(List<Long> orderList) {
		super();
		this.orderList = orderList;
	}
	
    
    
}