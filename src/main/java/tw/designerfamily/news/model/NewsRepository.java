package tw.designerfamily.news.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NewsRepository extends JpaRepository<NewsBean, Integer> {
	
	@Query(value ="from NewsBean where NewsTitle like concat('%',?1,'%') or NewsSubtitle like concat('%',?1,'%') or NewsDate like concat('%',?1,'%') or NewsContent like concat('%',?1,'%') Order By NewsID DESC")
	public List<NewsBean> searchByKey(String key);
	
	
	@Query(value = "Select * From News Order By NewsID DESC",nativeQuery = true)
	public List<NewsBean> findAll();
	
	
	@Query(value="select * from News where NewsType = '熱門活動' ", nativeQuery = true)
	public List<NewsBean> findType1();
	
	
	@Query(value="select * from News where NewsType = '領取優惠' ", nativeQuery = true)
	public List<NewsBean> findType2();
	

	@Query(value="select * from News where NewsType = '期間限定'  ", nativeQuery = true)
	public List<NewsBean> findType3();
	
	
	@Query(value="select * from News where NewsType = '實體活動'  ", nativeQuery = true)
	public List<NewsBean> findType4();
	
}
