package tw.designerfamily.news.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CouponService {

	@Autowired
	private CouponRepository cRo;
	
	
	//新增
	public void insert(CouponBean cBean) {
		Timestamp CouponCrDate = new Timestamp(System.currentTimeMillis());
		cBean.setCouponCrDate(CouponCrDate);
		cRo.save(cBean);		
	}
	
	//查詢全部
	public List<CouponBean> selectAll() {
		return cRo.findAll();
	}
	
	//查詢by id
	public CouponBean selectById(int id) {
		Optional<CouponBean> op1 = cRo.findById(id);	
		return op1.get();
	}
	

	
	//查詢by newsId
	public CouponBean selectByNewsId(int newsId) {
		CouponBean op1 = cRo.findByNewsId(newsId);
		return op1;
	}
	
	//修改
	public void update(CouponBean cBean) {
		Timestamp CouponCrDate = new Timestamp(System.currentTimeMillis());
		cBean.setCouponCrDate(CouponCrDate);
		cRo.save(cBean);		
	}
	
	//刪除
		public void deleteById(int id) {
			cRo.deleteById(id);		
		}
		
//	查詢by account
	public List<CouponList> findByCouponOwner(String HolderAccount) {
		return cRo.findByCouponOwner(HolderAccount);
	}	
	
	
}
