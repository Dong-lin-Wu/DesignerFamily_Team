package tw.designerfamily.order.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity@Table(name = "purchaseorder")
@Component
public class Order implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id@Column(name="ORDERNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderNo;
	
	@Column(name="ORDERNUMBER")
	private String orderNumber;
	
	@Column(name="ORDEROWNER")
	private String orderOwner;
	
	@Column(name="ORDERQTY")
	private int orderQty;
	
	@Column(name="ORDERDATE")
	private String orderDate;
	
	@Column(name="ORDERPRICE")
	private int orderPrice;
	
	@Column(name="ORDERSTATUS")
	private String orderStatus;
	
	@Column(name="ORDERADDRESS")
	private String orderAddress;
	
	@Column(name="ORDERPHONE")
	private String orderPhone;
	
	@Column(name="ORDERRECEIVE")
	private String orderReceive;
	
	//對應CartItem(購物車多筆商品)
	@JsonIgnore
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL,mappedBy = "order",orphanRemoval = true)
	private Set<CartItem> item = new LinkedHashSet<CartItem>();
	
	public Order() {
		
	}

	//產生訂單用
	public Order(String orderNumber, String orderOwner, int orderQty, String orderDate, int orderPrice,
			String orderStatus, String orderAddress, String orderPhone, String orderReceive) {
		super();
		this.orderNumber = orderNumber;
		this.orderOwner = orderOwner;
		this.orderQty = orderQty;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderStatus = orderStatus;
		this.orderAddress = orderAddress;
		this.orderPhone = orderPhone;
		this.orderReceive = orderReceive;
	}
	
	//修改用
	public Order(int orderNo, String orderNumber, String orderOwner, int orderQty, String orderDate, int orderPrice,
			String orderStatus) {
		super();
		this.orderNo = orderNo;
		this.orderNumber = orderNumber;
		this.orderOwner = orderOwner;
		this.orderQty = orderQty;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderStatus = orderStatus;
	}

	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public String getOrderNumber() {
		return orderNumber;
	}


	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}


	public String getOrderOwner() {
		return orderOwner;
	}


	public void setOrderOwner(String orderOwner) {
		this.orderOwner = orderOwner;
	}


	public int getOrderQty() {
		return orderQty;
	}


	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public int getOrderPrice() {
		return orderPrice;
	}


	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getOrderAddress() {
		return orderAddress;
	}


	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}


	public String getOrderPhone() {
		return orderPhone;
	}


	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}


	public String getOrderReceive() {
		return orderReceive;
	}


	public void setOrderReceive(String orderReceive) {
		this.orderReceive = orderReceive;
	}

	public Set<CartItem> getItem() {
		return item;
	}

	public void setItem(Set<CartItem> item) {
		this.item = item;
	}

}
