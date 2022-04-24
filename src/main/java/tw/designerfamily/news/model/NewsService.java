package tw.designerfamily.news.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class NewsService  {

	@Autowired
	private NewsRepository nRo;
	

	//新增
	public void insert(NewsBean nBean) {
		Timestamp newsDate = new Timestamp(System.currentTimeMillis());
		nBean.setNewsDate(newsDate);
		nRo.save(nBean);		
	}

	//查詢全部
	public List<NewsBean> selectAll() {
		return nRo.findAll();
	}

	//查詢by id
	public NewsBean selectById(int id) {
		Optional<NewsBean> op1 = nRo.findById(id);
		return op1.get();
	}

	//修改
	public void update(NewsBean nBean) {
		Timestamp newsDate = new Timestamp(System.currentTimeMillis());
		nBean.setNewsDate(newsDate);
		nRo.save(nBean);		
	}
	

	//刪除
	public void deleteById(int id) {
		nRo.deleteById(id);		
	}
	
	//關鍵字查詢(標題、副標題、活動內容)
	public List<NewsBean> searchByKey(String key){
		return nRo.searchByKey(key);
	}
		
}
