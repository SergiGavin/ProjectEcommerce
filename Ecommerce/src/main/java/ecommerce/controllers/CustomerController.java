package ecommerce.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ecommerce.dto.CustomerDTO;
import ecommerce.entities.CustomerEntity;
import ecommerce.entities.PurchaseOrderEntity;
import ecommerce.services.CustomerService;

@RestController
@CrossOrigin(origins = {"http://localhost:4200", "http://127.0.0.1:4200", "http://localhost:8080"})

@RequestMapping("/ecommerce/customer")

public class CustomerController {

	@Autowired
	private CustomerService customerService;

	// GET
	 @GetMapping
	    public List<CustomerDTO> listCustomers() {
	        List<CustomerEntity> customerEntities = customerService.getAllCustomers();
	        return convertToDTOs(customerEntities);
	    }
	
	
	 private List<CustomerDTO> convertToDTOs(List<CustomerEntity> customerEntities) {
		    List<CustomerDTO> customerDTOs = new ArrayList<>();

		    for (CustomerEntity entity : customerEntities) {
		        List<Long> orderIds = convertToOrderIds(entity.getOrderList());

		        CustomerDTO dto = new CustomerDTO(
		            entity.getId_customer(),
		            entity.getFirst_name(),
		            entity.getLast_name(),
		            entity.getIdentify_document(),
		            entity.getEmail(),
		            entity.getPhone(),
		            entity.getAddress(),
		            entity.getCity(),
		            entity.getProvince(),
		            entity.getZip_code(),
		            entity.getCountry(),
		            entity.getRegistration_date(),
		            entity.getPayment_info(),
		            entity.getAccount_status(),
		            entity.getUsername(),
		            entity.getPassword(),
		            orderIds
		        );

		        customerDTOs.add(dto);
		    }

		    return customerDTOs;
		}

		private List<Long> convertToOrderIds(List<PurchaseOrderEntity> orderEntities) {
		    List<Long> orderIds = new ArrayList<>();
		    for (PurchaseOrderEntity orderEntity : orderEntities) {
		        orderIds.add(orderEntity.getId_order());
		    }
		    
		    System.out.println("El array tiene: "+orderIds);
		    return orderIds;
		}
		
		//Registro
		 @PostMapping("/register")
		 public ResponseEntity<CustomerEntity> registerCustomer(@RequestBody CustomerEntity customer){
			 CustomerEntity savedCustomer = customerService.registerCustomer(customer);
			 return ResponseEntity.ok(savedCustomer);
		 }
		 
		 //Login
		 @PostMapping("/login")
		 public ResponseEntity<CustomerEntity> login(@RequestBody CustomerEntity credentials) {
		        CustomerEntity customer = customerService.login(credentials.getUsername(), credentials.getPassword());
		        if (customer != null) {
		            return ResponseEntity.ok(customer);
		        } else {
		            return ResponseEntity.status(401).body(null);
		        }
		    }
		
		
		
	}

