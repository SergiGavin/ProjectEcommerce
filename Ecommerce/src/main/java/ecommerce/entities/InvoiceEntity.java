package ecommerce.entities;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "Invoice")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_invoice")
@Data
public class InvoiceEntity {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_invoice")
	private Long id_invoice;
    private Date invoice_date;
    private Date due_date;
    private String shipping_details;
    private BigDecimal subtotal;
    private BigDecimal taxes;
    private BigDecimal discounts;
    private BigDecimal total_invoice_amount;
    private String payment_status;
    private String invoice_notes;
    
    @ManyToOne
    @JoinColumn(name = "purchase_order_id_order")
    @JsonIgnoreProperties({"order_date","order_status","payment_method","total_order_amount","customer_notes","estimated_delivery_date","shipping_date","deliveryNoteList","invoiceList"})
    private PurchaseOrderEntity purchase_order_invoice;
  
    
    
    public InvoiceEntity() {}
    
	public InvoiceEntity(Date invoice_date, Date due_date, String shipping_details, BigDecimal subtotal,
			BigDecimal taxes, BigDecimal discounts, BigDecimal total_invoice_amount, String payment_status,
			String invoice_notes, PurchaseOrderEntity purchaseOrder) {
		super();
		this.invoice_date = invoice_date;
		this.due_date = due_date;
		this.shipping_details = shipping_details;
		this.subtotal = subtotal;
		this.taxes = taxes;
		this.discounts = discounts;
		this.total_invoice_amount = total_invoice_amount;
		this.payment_status = payment_status;
		this.invoice_notes = invoice_notes;
		this.purchase_order_invoice = purchaseOrder;
	}
    
    
	
	
}