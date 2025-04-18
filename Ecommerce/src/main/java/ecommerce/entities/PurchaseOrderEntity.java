package ecommerce.entities;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
@Table(name = "purchase_order")
@Data
public class PurchaseOrderEntity {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_order")
    private Long id_order;
    private Date order_date;
    private String order_status;
    private String payment_method;
    private BigDecimal total_order_amount;
    private String customer_notes;
    private Date estimated_delivery_date;
    private Date shipping_date;
  
    
    @ManyToOne
    @JoinColumn(name = "purchase_id_customer")
    //Agregamos aqui los elementos que no queremos que se muestren(todos menos el id)
    @JsonIgnoreProperties({"first_name","last_name","identify_document","email","phone","address","city","state","zip_code","country","registration_date","payment_info","account_status","username","password","orderList"}) 
    private CustomerEntity purchase_id_customer;
    
    @OneToMany(mappedBy="purchase_order_delivery")
    @JsonIgnoreProperties({"dispatch_date","shipping_details","receiver_signature","delivery_status","delivery_notes","purchase_order_delivery"})
    private List<DeliveryNoteEntity> deliveryNoteList; 
    
    @OneToMany(mappedBy="purchase_order_invoice")
    @JsonIgnoreProperties({"invoice_date","due_date","shipping_details","subtotal","taxes","discounts","total_invoice_amount","payment_status","invoice_notes","purchase_order_invoice"})
    private List<InvoiceEntity> invoiceList; 

    
    public PurchaseOrderEntity() {}
    
	public PurchaseOrderEntity(Date order_date, String order_status, String payment_method,
			BigDecimal total_order_amount, String customer_notes, Date estimated_delivery_date, Date shipping_date,
			CustomerEntity purchase_id_customer) {
		super();
		this.order_date = order_date;
		this.order_status = order_status;
		this.payment_method = payment_method;
		this.total_order_amount = total_order_amount;
		this.customer_notes = customer_notes;
		this.estimated_delivery_date = estimated_delivery_date;
		this.shipping_date = shipping_date;
		this.purchase_id_customer = purchase_id_customer;
	}
    
    
}