package tw.designerfamily.news.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CouponRepository extends JpaRepository<CouponBean, Integer> {
	
	@Query(value = "Select * From Coupon Order By CouponId DESC",nativeQuery = true)
	public List<CouponBean> findAll();
	
}
