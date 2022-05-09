package tw.designerfamily.news.model;

import java.io.Serializable;
import java.sql.Timestamp;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name = "couponlist") 
@Component
public class CouponList implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "HOLDERACCOUNT")
	private String holderAccount;
	
	@Column(name = "TAKETIME")
	private Timestamp taketime;
	
	@Column(name = "STATE")
	private String state;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "COUPONID")
	private CouponBean couponbean;
	

	
	public CouponList() {
	}

	//修改
	public CouponList(String state) {
		this.state = state;
	}
	
	
    //拿券
	public CouponList(String holderAccount, String state) {
		super();
		this.holderAccount = holderAccount;
		this.state = state;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHolderAccount() {
		return holderAccount;
	}

	public void setHolderAccount(String holderAccount) {
		this.holderAccount = holderAccount;
	}

	public Timestamp getTaketime() {
		return taketime;
	}

	public void setTaketime(Timestamp taketime) {
		this.taketime = taketime;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public CouponBean getCouponbean() {
		return couponbean;
	}

	public void setCouponbean(CouponBean couponbean) {
		this.couponbean = couponbean;
	}
	
	

	
}
