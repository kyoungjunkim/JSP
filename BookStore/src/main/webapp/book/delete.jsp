<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	String bookId= request.getParameter("bookId");
	
	
	
	try{
		Connection conn = DBHelper.getConnection();
		
		String sql = "DELETE FROM `book` WHERE `bookId`=?";
		
	 	PreparedStatement psmt = conn.prepareStatement(sql);
	 	
		psmt.setString(1, bookId);
		
		psmt.executeUpdate();
		
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("./list.jsp");
%>