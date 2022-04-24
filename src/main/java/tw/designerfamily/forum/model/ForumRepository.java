package tw.designerfamily.forum.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.designerfamily.raise.model.RaiseBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer> {
	
	@Query(value = "from ForumBean where forumsubject like concat('%',?1,'%')  Order By forumid DESC")
	public List<ForumBean> searchBySubject(String subject);
	
	@Query(value = "from ForumBean Order By forumid DESC")
	public List<ForumBean> selectAll();

}
