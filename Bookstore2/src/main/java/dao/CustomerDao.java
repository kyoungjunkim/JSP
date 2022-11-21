package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.DBCP;
import vo.CustomerVo;

public class CustomerDao  {
	
	private static CustomerDao instance = new CustomerDao();
	public static CustomerDao getInstance() {
		return instance;
	}
	
	private CustomerDao() {}
	
	public List<CustomerVo> selectcustomers() {
		
		List<CustomerVo> customers = new ArrayList<>();
		
		try {
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from `customer`");
			
			while(rs.next()) {
				CustomerVo vo = new CustomerVo();
				vo.setCustId(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddr(rs.getString(3));
				vo.setPhone(rs.getString(4));
				customers.add(vo);
			}
			
			conn.close();
			rs.close();
			stmt.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return customers;
	}
	
	public void insertcustomer(CustomerVo vo) {
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("insert into `customer` values (?,?,?,?)");
			psmt.setInt(1, vo.getCustId());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getAddr());
			psmt.setString(4, vo.getPhone());
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public CustomerVo selectcustomer(String custId) {
		
		CustomerVo vo = null;
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("select * from `customer` where `custId`=?");
			psmt.setString(1, custId);
			ResultSet rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				vo = new CustomerVo();
				vo.setCustId(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setAddr(rs.getString(3));
				vo.setPhone(rs.getString(4));
			}
			
			rs.close();
			conn.close();
			psmt.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
			return vo;
	}
	
	public void updatecustomer(CustomerVo vo) {
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("update `customer` set `name`=?, `addr`=?, `phone`=? where `custId`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getAddr());
			psmt.setString(3, vo.getPhone());
			psmt.setInt(4, vo.getCustId());
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deletecustomer(String custId) {
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement("delete from `customer` where `custId`=?");
			psmt.setString(1, custId);
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
