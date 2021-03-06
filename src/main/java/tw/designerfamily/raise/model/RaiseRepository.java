package tw.designerfamily.raise.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RaiseRepository extends JpaRepository<RaiseBean, Integer> {
	
	@Query(value = "from RaiseBean where RaiseTitle like concat('%',?1,'%') or RaiseBrief like concat('%',?1,'%') Order By RaiseNo DESC")
	public List<RaiseBean> searchByKey(String key);
	
	@Query(value = "from RaiseBean Order By RaiseNo DESC")
	public List<RaiseBean> searchAllDESC();
	
	@Query(value = "from RaiseBean where RaiseStatus=?1 Order By RaiseNo DESC")
	public List<RaiseBean> searchByStatus(String status);
	
	@Query(value = "from RaiseBean where RaiseName=?1 Order By RaiseNo DESC")
	public List<RaiseBean> searchByName(String name);
	
	@Query(value = "from RaiseBean where RaiseCategory like concat('%',?1,'%') and RaiseStatus='Approved' Order By RaiseNo DESC")
	public List<RaiseBean> searchByCategory(String name);
}
