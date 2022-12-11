package kr.co.kmarket.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;

public class CsDAO extends DBHelper {

	private static CsDAO instance = new CsDAO();
	public static CsDAO getInstance() {
		return instance;
	}
	private CsDAO() {}
	
	// 로거 생성
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	
	
	
	
}
