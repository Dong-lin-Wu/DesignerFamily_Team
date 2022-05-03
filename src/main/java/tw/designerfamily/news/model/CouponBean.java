package tw.designerfamily.news.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "coupon") 
@Component
public class CouponBean {
		
	@Id	@Column(name = "COUPONID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int couponId;
	
	@Column(name = "NEWSID")
	private int newsId;
	
	@Column(name = "COUPONNAME")
	private String couponName;
	
	@Column(name = "COUPONCODE")
	private String couponCode;
		
	@Column(name = "COUPONCRDATE")
	private Timestamp couponCrDate;
	
	@Column(name = "COUPONSTDATE")
	private String couponStDate;
	
	@Column(name = "COUPONEXPDATE")
	private String couponExpDate;
	
	@Column(name = "COUPONCONTENT")
	private String couponContent;	
	
	@Column(name = "COUPONSTATE")
	private String couponState;
	
	@Column(name = "CREATEACCOUNT")
	private String createAccount;
	
	
	
	public CouponBean() {		
	}
	
	//新增
	public CouponBean(int newsId,String couponName,String couponCode,String couponStDate,String couponExpDate,String couponContent,String couponState) {		
		this.newsId = newsId;
		this.couponName = couponName;
		this.couponCode = couponCode;
		this.couponStDate = couponStDate;
		this.couponExpDate = couponExpDate;
		this.couponContent = couponContent;
		this.couponState = couponState;
//		this.createAccount = createAccount;
	}
	
	//修改
	public CouponBean(int couponId,int newsId,String couponName,String couponCode,String couponStDate,String couponExpDate,String couponContent,String couponState) {
		this.couponId = couponId;
		this.newsId = newsId;
		this.couponName = couponName;
		this.couponCode = couponCode;
		this.couponStDate = couponStDate;
		this.couponExpDate = couponExpDate;
		this.couponContent = couponContent;
		this.couponState = couponState;
//		this.createAccount = createAccount;
		
	}

	
	
	public int getCouponId() {
		return couponId;
	}




	public void setCouponId(int couponId) {
		this.couponId = couponId;
	}


	public String getCouponName() {
		return couponName;
	}

	
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	
	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public Timestamp getCouponCrDate() {
		return couponCrDate;
	}


	public void setCouponCrDate(Timestamp couponCrDate) {
		this.couponCrDate = couponCrDate;
	}


	public String getCouponStDate() {
		return couponStDate;
	}


	public void setCouponStDate(String couponStDate) {
		this.couponStDate = couponStDate;
	}


	public String getCouponExpDate() {
		return couponExpDate;
	}


	public void setCouponExpDate(String couponExpDate) {
		this.couponExpDate = couponExpDate;
	}


	public String getCouponContent() {
		return couponContent;
	}


	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}


	public int getNewsId() {
		return newsId;
	}
	
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	
	
	public String getCouponState() {
		return couponState;
	}

	
	public void setCouponState(String couponState) {
		this.couponState = couponState;
	}

	public String getCreateAccount() {
		return createAccount;
	}

	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}

	
}
