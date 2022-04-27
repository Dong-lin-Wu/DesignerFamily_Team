package tw.designerfamily.order.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

import tw.designerfamily.product.model.ProductBean;

@Entity@Table(name = "orderlist")
@Component
public class CartItem implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@JsonIgnore
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="ORDERNO")
	private Order order;
	
	@JsonIgnore
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "COMM_NO")
	private ProductBean product;
	
	@Column(name = "QTY")
	private int qty;
	
	@Column(name = "TOTALPRICE")
	private int totalprice;

	
	public CartItem() {
		
	}
	
    //購物車用
	public CartItem(ProductBean product, int qty, int totalprice) {
		super();
		this.product = product;
		this.qty = qty;
		this.totalprice = totalprice;
	}



	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public ProductBean getProduct() {
		return product;
	}

	public void setProduct(ProductBean product) {
		this.product = product;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

}
