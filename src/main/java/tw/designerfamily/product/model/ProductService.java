package tw.designerfamily.product.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductRepository pRepo;
	
	//新增
	public ProductBean insert(ProductBean p) {
		return	pRepo.save(p);
	}
	
	//修改
	public ProductBean update(ProductBean p) {
		return pRepo.save(p);
	}
	
	//刪除
	public void delete(Integer id) {
		pRepo.deleteById(id);
	}
	
	//查詢*all
	public List<ProductBean> selectAll(){
		return pRepo.findAll();
	}
	
	//查詢by id
	public ProductBean selectById(Integer id) {
		Optional<ProductBean> op1 = pRepo.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	//模糊查詢(by)
	public List<ProductBean> findByKeyword(String keyword){
		return pRepo.findKeyword(keyword);
	}
	
	//分類查詢
	public List<ProductBean> findcate1(){
		return pRepo.findcate1();
	}
	
	public List<ProductBean> findcate2(){
		return pRepo.findcate2();
	}
	
	public List<ProductBean> findcate3(){
		return pRepo.findcate3();
	}
	
	public List<ProductBean> findcate4(){
		return pRepo.findcate4();
	}
	
	public List<ProductBean> findcate5(){
		return pRepo.findcate5();
	}
	
	public List<ProductBean> findcate6(){
		return pRepo.findcate6();
	}
	
}
