package tw.designerfamily.product.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<ProductBean, Integer> {
	
	
	//新增找商品名稱以及設計師
	@Query(value = "from ProductBean where commTitle like concat('%',?1,'%') or category like concat('%',?1,'%') or designer like concat('%',?1,'%')")
	public List<ProductBean> findKeyword(String keyword);
	
	@Query(value="select * from commodity where category = '配件飾品'", nativeQuery = true)
	public List<ProductBean> findcate1();
	
	@Query(value="select * from commodity where category = '包包提袋'", nativeQuery = true)
	public List<ProductBean> findcate2();

	@Query(value="select * from commodity where category = '居家生活'", nativeQuery = true)
	public List<ProductBean> findcate3();
	
	@Query(value="select * from commodity where category = '創意科技'", nativeQuery = true)
	public List<ProductBean> findcate4();
	
	@Query(value="select * from commodity where category = '文具'", nativeQuery = true)
	public List<ProductBean> findcate5();
	
	@Query(value="select * from commodity where category = '衣著'", nativeQuery = true)
	public List<ProductBean> findcate6();
	
	@Query(value="select * from commodity where category = '其他'", nativeQuery = true)
	public List<ProductBean> findcate7();
}
