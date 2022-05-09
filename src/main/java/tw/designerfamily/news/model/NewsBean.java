package tw.designerfamily.news.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "news") 
@Component
public class NewsBean implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id	@Column(name = "NEWSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int newsId;
	
	@Column(name = "NEWSTYPE")
	private String newsType;
	
	@Column(name = "NEWSTITLE")
	private String newsTitle;
	
	@Column(name = "NEWSSUBTITLE")
	private String newsSubtitle;
	
	@Column(name = "NEWSCRDATE")
	private Timestamp newsCrDate;
	
	@Column(name = "NEWSSTDATE")
	private String newsStDate;
	
	@Column(name = "NEWSEXPDATE")
	private String newsExpDate;
		
	@Column(name = "NEWSCONTENT")
	private String newsContent;
	
	@Column(name = "NEWSPICBASE64")
	private String newsPicBase64;
	
	@Column(name = "NEWSNOTE")
	private String newsNote;
	

		
	public NewsBean() {		
	}

	//新增
	public NewsBean(String newsType, String newsTitle, String newsSubtitle,String newsStDate,String newsExpDate,String newsContent, String newsPicBase64, String newsNote) {		
		this.newsType = newsType;
		this.newsTitle = newsTitle;
		this.newsSubtitle = newsSubtitle;
		this.newsStDate = newsStDate;
		this.newsExpDate = newsExpDate;
		this.newsContent = newsContent;
		this.newsPicBase64 = newsPicBase64;
		this.newsNote = newsNote;
	}
	
	//修改
	public NewsBean(int NewsId,String newsType, String newsTitle, String newsSubtitle,String newsStDate,String newsExpDate,
			String newsContent,String newsPicBase64, String newsNote) {
		this.newsId = NewsId;
		this.newsType = newsType;
		this.newsTitle = newsTitle;
		this.newsSubtitle = newsSubtitle;
		this.newsStDate = newsStDate;
		this.newsExpDate = newsExpDate;
		this.newsContent = newsContent;
		this.newsPicBase64 = newsPicBase64;
		this.newsNote = newsNote;
	}
	
		
		
	public int getNewsId() {
		return newsId;
	}


	
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}



	public String getNewsType() {
		return newsType;
	}



	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}



	public String getNewsTitle() {
		return newsTitle;
	}



	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}



	public String getNewsSubtitle() {
		return newsSubtitle;
	}



	public void setNewsSubtitle(String newsSubtitle) {
		this.newsSubtitle = newsSubtitle;
	}


	public Timestamp getNewsCrDate() {
		return newsCrDate;
	}

	
	public void setNewsCrDate(Timestamp newsCrDate) {
		this.newsCrDate = newsCrDate;
	}

	
	public String getNewsStDate() {
		return newsStDate;
	}

	
	public void setNewsStDate(String newsStDate) {
		this.newsStDate = newsStDate;
	}

	
	public String getNewsExpDate() {
		return newsExpDate;
	}

	
	public void setNewsExpDate(String newsExpDate) {
		this.newsExpDate = newsExpDate;
	}

	
	public String getNewsContent() {
		return newsContent;
	}


	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}


	
	public String getNewsPicBase64() {
		return newsPicBase64;
	}

	
	public void setNewsPicBase64(String newsPicBase64) {
		this.newsPicBase64 = newsPicBase64;
	}

	
	public String getNewsNote() {
		return newsNote;
	}


	public void setNewsNote(String newsNote) {
		this.newsNote = newsNote;
	}
	
	
			
}



