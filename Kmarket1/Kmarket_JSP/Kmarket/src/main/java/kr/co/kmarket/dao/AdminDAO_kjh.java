package kr.co.kmarket.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;

public class AdminDAO_kjh extends DBHelper {

	private static AdminDAO_kjh instance = new AdminDAO_kjh();
	public static AdminDAO_kjh getInstance() {
		return instance;
	}
	private AdminDAO_kjh() {}
	
	// 로거 생성
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
}
