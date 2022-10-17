<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String custid= request.getParameter("custid");
	
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java1_shop";
	String user = "root";
	String pass = "1234";
	
	try{
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
		String sql = "DELETE FROM `customer` WHERE `custid`=?";
	 	PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custid);
		// 4단계
		psmt.executeUpdate();
		// 6단계
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("./list.jsp");
%>