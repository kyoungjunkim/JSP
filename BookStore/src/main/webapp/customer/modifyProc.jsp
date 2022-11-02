<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	String custId = request.getParameter("custId");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "UPDATE `customer` SET `name`=?, `addr`=?, `phone`=? ";
		       sql += "WHERE `custId`=?";
		       
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, addr);
		psmt.setString(3, phone);
		psmt.setString(4, custId);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>