package tw.designerfamily.raise.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RaiseRepository extends JpaRepository<RaiseBean, Integer> {
	
	@Query(value = "from RaiseBean where RaiseTitle like concat('%',?1,'%') or RaiseBrief like concat('%',?1,'%')  Order By RaiseNo DESC")
	public List<RaiseBean> searchByKey(String key);
	
	@Query(value = "from RaiseBean Order By RaiseNo DESC")
	public List<RaiseBean> searchAll();

}
