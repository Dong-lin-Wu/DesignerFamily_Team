package tw.designerfamily.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface OrderRepository extends JpaRepository<Order, Integer> {
	
	//模糊查詢訂單號碼跟訂單擁有者
	@Query(value = "from Order where ordernumber like concat('%',?1,'%') or orderowner like concat('%',?1,'%')")
	public List<Order> findKeyword(String keyword);
	
	public Order findByOrderNumber(String orderNum);
	
	//查詢訂單詳細使用
	public List<Order> findByOrderNo(int orderNo);
	
		
}
