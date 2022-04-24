package tw.designerfamily.forum.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity @Table(name = "comment")
@Component
public class CommentBean {
		
	@Id @Column(name = "COMMENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commentId;
	
	@Column(name = "COMMENTDESCRIPTION")
	private String commentDescription;
	
	@Column(name = "COMMENT_CREATETIME")
	private String commentCreatetime;
	
	@Column(name = "COMMENT_UPDATETIME")
	private String commentUpdatetime;
	
	@Column(name = "COMMENTACCOUNT")
	private String commentAccount;
	

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.MERGE, CascadeType.PERSIST})
	@JoinColumn(name = "FORUMID")
	private ForumBean forumBean;
	
	public CommentBean() {
	}	
	
	//修改
	public CommentBean(int commentId, String commentDescription, String commentCreatetime, String commentUpdatetime,
			String commentAccount) {
		super();
		this.commentId = commentId;
		this.commentDescription = commentDescription;
		this.commentCreatetime = commentCreatetime;
		this.commentUpdatetime = commentUpdatetime;
		this.commentAccount = commentAccount;		
	}
	//新增
	public CommentBean(String commentDescription, String commentCreatetime, String commentUpdatetime,
			String commentAccount) {
		super();
		this.commentDescription = commentDescription;
		this.commentCreatetime = commentCreatetime;
		this.commentUpdatetime = commentUpdatetime;
		this.commentAccount = commentAccount;		
	}


	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getCommentDescription() {
		return commentDescription;
	}

	public void setCommentDescription(String commentDescription) {
		this.commentDescription = commentDescription;
	}

	public String getCommentCreatetime() {
		return commentCreatetime;
	}

	public void setCommentCreatetime(String commentCreatetime) {
		this.commentCreatetime = commentCreatetime;
	}

	public String getCommentUpdatetime() {
		return commentUpdatetime;
	}

	public void setCommentUpdatetime(String commentUpdatetime) {
		this.commentUpdatetime = commentUpdatetime;
	}

	public String getCommentAccount() {
		return commentAccount;
	}

	public void setCommentAccount(String commentAccount) {
		this.commentAccount = commentAccount;
	}

	

	public ForumBean getForumBean() {
		return forumBean;
	}



	public void setForumBean(ForumBean forumBean) {
		this.forumBean = forumBean;
	}
	
	

	
	
	
	

}
