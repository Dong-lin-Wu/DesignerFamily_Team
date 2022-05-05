package tw.designerfamily.forum.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




@Service
@Transactional
public class ForumService {
	
	@Autowired
	public ForumRepository forumRepo;
	
	@Autowired
	public CommentRepository commentRepo;
	
	public List<ForumBean> selectAll(){
		return forumRepo.selectAll();
	}
	
	public ForumBean insert(ForumBean fBean) {
		return forumRepo.save(fBean);		
	}
	
	public ForumBean update(ForumBean fBean) {
		return forumRepo.save(fBean);		
	}
	
	public void deleteById(Integer id) {
		forumRepo.deleteById(id);
	}
	
	public ForumBean findById(Integer id) {
		Optional<ForumBean> optional = forumRepo.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
//	public List<ForumBean> searchBySubject(String subject){
//		return forumRepo.searchBySubject(subject);
//	}
	public List<ForumBean> searchByKey(String key){
		return forumRepo.searchByKey(key);
	}
	
	public List<CommentBean> searchByCommKey(String key){
		return commentRepo.searchByCommKey(key);
		
	}
	
	
	public Page<ForumBean> findAllByPage(Pageable pageable){
		return forumRepo.findAll(pageable);
	}
	
	//留言串
	public List<CommentBean> selectCommAll(){
		return commentRepo.selectCommAll();
	}
	public CommentBean findCommById(Integer id) {
		Optional<CommentBean> optional = commentRepo.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	public void deleteCommById(Integer id) {
		commentRepo.deleteById(id);
	}
	
	
	
	
	
	
	

}
