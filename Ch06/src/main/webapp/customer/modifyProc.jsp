<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String custid    = request.getParameter("custid");
	String name   = request.getParameter("name");
	String hp     = request.getParameter("hp");
	String addr   = request.getParameter("addr");
	String rdate  = request.getParameter("rdate");
	
	// 데이터베이스 처리
		String host = "jdbc:mysql://127.0.0.1:3306/java1_shop";
		String user = "root";
		String pass = "1234";
		
		try{
			// 1단계
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2단계
			Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "UPDATE `customer` SET `name`=?, `hp`=?, `addr`=?, `rdate`=? ";
		       sql += "WHERE `custid`=?";
		       
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, addr);
		psmt.setString(4, rdate);
		psmt.setString(5, custid);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>