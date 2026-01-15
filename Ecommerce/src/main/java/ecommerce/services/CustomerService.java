package ecommerce.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import ecommerce.entities.CustomerEntity;
import ecommerce.repositories.CustomerRepository;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	public List<CustomerEntity>getAllCustomers(){
		return customerRepository.findAll();
	}
	//Registro de cliente
	public CustomerEntity registerCustomer(CustomerEntity customer) {
		if(customerRepository.findByEmail(customer.getEmail())!= null || customerRepository.findByUsername(customer.getUsername())!= null) {
			throw new RuntimeException("El email o el usuario ya está registrado");
		}
		//Encriptamos contraseña
		String encryptedPassword = passwordEncoder.encode(customer.getPassword());
		customer.setPassword(encryptedPassword);
		System.out.println("CONTRASEÑA ENCRIPTADA "+ encryptedPassword);
		
		customer.setRegistration_date(new Date());
		
		return customerRepository.save(customer);
	}
	//Login de cliente
	public CustomerEntity login(String username, String password) {
		CustomerEntity customer = customerRepository.findByUsername(username);
		
		if(customer != null && passwordEncoder.matches(password, customer.getPassword())) {
			System.out.println("Login correcto "+username + " " + password);
			return customer;
		}
		System.out.println("Login incorrecto "+username + " " + password);
		return null;
	}
}
