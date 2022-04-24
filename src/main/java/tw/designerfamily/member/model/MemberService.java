package tw.designerfamily.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {

	@Autowired
	private MemberRepository mRepo;

	@Autowired
	private StatusRepository sRepo;

	public List<Member> selectAll() {
		return mRepo.selectAll();
	}

	public Member selectMemberById(int id) {
		Optional<Member> op1 = mRepo.findById(id);
		return op1.get();
	}

	public Status selectStatusById(int id) {
		Optional<Status> op2 = sRepo.findById(id);
		return op2.get();
	}

	public List<Member> selectByPhoneAccountEmail(String keyword) {
		return mRepo.selectByPhoneAccountEmail(keyword);
	}

	public Member selectLogin(String account) {
		return mRepo.selectLogin(account);
	}

	public Member selectRegister(String phone, String account, String email) {
		return mRepo.selectRegister(phone, account, email);
	}

	public Member insert(Member m) {
		return mRepo.save(m);
	}

	public Member update(Member m) {
		return mRepo.save(m);
	}

	public void delete(int id) {
		mRepo.deleteById(id);
	}

}
