package ecommerce.entities;

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
@Table(name = "delivery_note")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_deliverynote")
@Data
public class DeliveryNoteEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_deliverynote")
	private Long id_deliverynote;
    private Date dispatch_date;
    private String shipping_details;
    private String receiver_signature;
    private String delivery_status;

    private String delivery_notes;

    @ManyToOne
    @JoinColumn(name = "purchase_order_id_order")
    @JsonIgnoreProperties({"order_date","order_status","payment_method","total_order_amount","customer_notes","estimated_delivery_date","shipping_date","deliveryNoteList","invoiceList"})
    private PurchaseOrderEntity purchase_order_delivery;
    
   

    public DeliveryNoteEntity() {}
    
	public DeliveryNoteEntity(Date dispatch_date, String shipping_details, String receiver_signature,
			String delivery_status, String delivery_notes, PurchaseOrderEntity purchase_order) {
		super();
		this.dispatch_date = dispatch_date;
		this.shipping_details = shipping_details;
		this.receiver_signature = receiver_signature;
		this.delivery_status = delivery_status;
		this.delivery_notes = delivery_notes;
		this.purchase_order_delivery = purchase_order;
	}
    
    
}