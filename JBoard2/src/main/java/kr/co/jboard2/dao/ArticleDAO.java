package kr.co.jboard2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;

public class ArticleDAO extends DBHelper{
	
	private static ArticleDAO instance = new ArticleDAO();
	
	public static ArticleDAO getInstance() {
		return instance;
	}
	
	private ArticleDAO() {}
	
	
	// 로거 생성
	Logger logger = LoggerFactory.getLogger(this.getClass());
		
	public void selectArticle() {}	
	public void selectArticles() {}
	public void insertArticle() {}
	public void updateArticle() {}
	public void deleteArticle() {}
	
	

}
