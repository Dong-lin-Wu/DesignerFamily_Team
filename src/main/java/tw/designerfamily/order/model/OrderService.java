package tw.designerfamily.order.model;

import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OrderService {
	
	@Autowired
	private OrderRepository oRepo;
	
	//新增
	public Order insert(Order o) {
		return oRepo.save(o);
	}
	
	//修改
	public Order update(Order o) {
		return oRepo.save(o);
	}
	
	//刪除
	public void deleteById(Integer id) {
		oRepo.deleteById(id);
	}
	
	//查詢*all
	public List<Order> selectAll(){
		return oRepo.findAll();
	}
	
	//查詢by id
	public Order findById(Integer id) {
		Optional<Order> op1 = oRepo.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	//查詢by orderNum(訂單付款後update用)
	public Order findByOrderNum(String orderNum) {
		return oRepo.findByOrderNumber(orderNum);
	}
	
	//模糊查詢(by orderNumber or orderOwner)
	public List<Order> findKeyWord(String keyword){
		return oRepo.findKeyword(keyword);
	}
	
	//查詢訂單詳細使用
	public List<Order> findyByOrderNo(int orderNo){
		return oRepo.findByOrderNo(orderNo);
	}
	
}
