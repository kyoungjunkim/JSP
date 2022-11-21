package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.DBCP;
import vo.BookVo;

public class BookDao {
	
	private static BookDao instance = new BookDao();
	public static BookDao getInstance() {
		return instance;
	}
	
	private BookDao() {}
	
	public List<BookVo> selectbooks() {
		
		List<BookVo> books = new ArrayList<>();
		
		try {
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from `book`");
			
			while(rs.next()) {
				BookVo vo = new BookVo();
				vo.setBookId(rs.getInt(1));
				vo.setBookName(rs.getString(2));
				vo.setPublisher(rs.getString(3));
				vo.setPrice(rs.getInt(4));
				books.add(vo);
			}
			
			rs.close();
			conn.close();
			stmt.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}
	
	public void insertbook(BookVo vo) {
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("insert into `book` values (?,?,?,?)");
			psmt.setInt(1, vo.getBookId());
			psmt.setString(2, vo.getBookName());
			psmt.setString(3, vo.getPublisher());
			psmt.setInt(4, vo.getPrice());
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BookVo selectbook(String bookId) {
		
		BookVo vo = null;
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("select * from `book` where `bookId`=?");
			psmt.setString(1, bookId);
			ResultSet rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				vo = new BookVo();
				vo.setBookId(rs.getInt(1));
				vo.setBookName(rs.getString(2));
				vo.setPublisher(rs.getString(3));
				vo.setPrice(rs.getInt(4));
			}
			
			rs.close();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
			return vo;
	}
	
	public void updatebook(BookVo vo) {
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("update `book` set `bookName`=?, `publisher`=?, `price`=? where `bookId`=?");
			psmt.setString(1, vo.getBookName());
			psmt.setString(2, vo.getPublisher());
			psmt.setInt(3, vo.getPrice());
			psmt.setInt(4, vo.getBookId());
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deletebook(String bookId) {
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("delete from `book` where `bookId`=?");
			psmt.setString(1, bookId);
			psmt.executeUpdate();
			
			
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
