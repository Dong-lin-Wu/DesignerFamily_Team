package tw.designerfamily.member.model;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository<Member, Integer> {

	@Query(value = "from Member order by id")
	public List<Member> selectAll();

	@Query(value = "from Member where phone like concat('%',?1,'%') or account like concat('%',?1,'%') or email like concat('%',?1,'%') order by id")
	public List<Member> selectByPhoneAccountEmail(String keyword);
	
	@Query(value = "from Member where (phone = ?1 or account = ?1 or email = ?1) order by id")
	public Member selectLogin(String account);
	
	@Query(value = "from Member where phone = ?1 or account = ?2 or email = ?3 order by id")
	public Member selectRegister(String phone, String account, String email);

}
