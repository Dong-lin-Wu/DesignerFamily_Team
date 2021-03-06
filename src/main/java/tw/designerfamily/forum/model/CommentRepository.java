package tw.designerfamily.forum.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CommentRepository extends JpaRepository<CommentBean, Integer> {
	
	@Query(value = "from CommentBean Order By forumid DESC")
	public List<CommentBean> selectCommAll();
	
	@Query(value = "from CommentBean where commentdescription like concat('%',?1,'%') or commentaccount like concat('%',?1,'%')  Order By commentId DESC")
	public List<CommentBean> searchByCommKey(String key);

}
