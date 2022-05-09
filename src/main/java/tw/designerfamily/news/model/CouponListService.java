package tw.designerfamily.news.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class CouponListService {
	
	@Autowired
	private CouponListRepository clRo;
	
	
	//新增
	public void insert(CouponList list) {
		Timestamp CouponTaketime = new Timestamp(System.currentTimeMillis());
		list.setTaketime(CouponTaketime);
		clRo.save(list);		
	}
	
	//修改
	public void update(CouponList list) {
		Timestamp CouponTaketime = new Timestamp(System.currentTimeMillis());
		list.setTaketime(CouponTaketime);
		clRo.save(list);
	}
	
	//查詢by id
	public Optional<CouponList> selectById(int Id) {
		Optional<CouponList> op = clRo.findById(Id);
		return op;
	}
	
	
	//查詢全部
		public List<CouponList> selectAll() {
			return clRo.findAll();
		}
		
		public List<CouponList> findybyowner(String name){
			return clRo.findByHolderAccount(name);
		}
		
	
		
	
}
