package tw.designerfamily.raise.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RaiseService {
	
	@Autowired
	private RaiseRepository rRepo;
	
	public RaiseBean insert(RaiseBean rBean) {
		return rRepo.save(rBean);
	}
	
	public List<RaiseBean> searchAllDESC(){
		return rRepo.searchAllDESC();
	}
	
	public List<RaiseBean> searchAll(){
		return rRepo.findAll();
	}
	
	public List<RaiseBean> selectByStatus(String status){
		return rRepo.searchByStatus(status);
	}
	
	public RaiseBean selectById(int id) {
		Optional<RaiseBean> rOp = rRepo.findById(id);
		if(rOp.isPresent()) {
			return rOp.get();			
		}
		return null;
	}
	
	public List<RaiseBean> selectByName(String name){
		return rRepo.searchByName(name);
	}
	
	public List<RaiseBean> selectByCategory(String name){
		return rRepo.searchByCategory(name);
	}

	
	public RaiseBean update(RaiseBean rBean) {
		return rRepo.save(rBean);
	}
	
	public void deleteById(int id) {
		rRepo.deleteById(id);
	}
	
	public List<RaiseBean> searchByKey(String key){
		return rRepo.searchByKey(key);
	}
	
	public RaiseBean updateStatus(int id, String status) {
		Optional<RaiseBean> rOp = rRepo.findById(id);
		RaiseBean rBean = rOp.get();
		rBean.setRaiseStatus(status);
		return rRepo.save(rBean);
	}

}
