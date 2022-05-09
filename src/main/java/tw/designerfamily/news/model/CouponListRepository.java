package tw.designerfamily.news.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface CouponListRepository extends JpaRepository<CouponList, Integer> {

	@Query(value = "Select * From CouponList Order By Id DESC",nativeQuery = true)
	public List<CouponList> findAll();
	
	public List<CouponList>findByHolderAccount(String name);
	
		
}
