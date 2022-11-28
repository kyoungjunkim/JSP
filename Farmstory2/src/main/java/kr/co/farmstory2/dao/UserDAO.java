package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.vo.TermsVO;
import kr.co.farmstory2.vo.UserVO;
import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.Sql;

public class UserDAO extends DBHelper {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	private UserDAO() {}
	
	public void insertUser(UserVO ub) {
		
		try{
			Connection conn =  getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, ub.getUid());
			psmt.setString(2, ub.getPass());
			psmt.setString(3, ub.getName());
			psmt.setString(4, ub.getNick());
			psmt.setString(5, ub.getEmail());
			psmt.setString(6, ub.getHp());
			psmt.setString(7, ub.getZip());
			psmt.setString(8, ub.getAddr1());
			psmt.setString(9, ub.getAddr2());
			psmt.setString(10, ub.getRegip());
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
	}
	public TermsVO selectTerms() {
		
		TermsVO tb = null;
		
		try {
			Connection conn =  getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
			
			if(rs.next()) {
				tb = new TermsVO();
				tb.setTerms(rs.getString(1));
				tb.setPrivacy(rs.getString(2));
			}
			rs.close();
			conn.close();
			stmt.close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return tb;
	}
	public UserVO selectUser(String uid, String pass) {
		
		UserVO ub = null;
		
		try {
			
			logger.debug("selectUser...");
			Connection conn = getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				ub = new UserVO();
				ub.setUid(rs.getString(1));
				ub.setPass(rs.getString(2));
				ub.setName(rs.getString(3));
				ub.setNick(rs.getString(4));
				ub.setEmail(rs.getString(5));
				ub.setHp(rs.getString(6));
				ub.setGrade(rs.getInt(7));
				ub.setZip(rs.getString(8));
				ub.setAddr1(rs.getString(9));
				ub.setAddr2(rs.getString(10));
				ub.setRegip(rs.getString(11));
				ub.setRdate(rs.getString(12));
			}
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		logger.debug("ub"+ub);
		
		return ub;
	}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
}
