<%@page import="config.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
		
		//전송데이터 수신
		request.setCharacterEncoding("utf-8");
		String custId 	= request.getParameter("custId");
		String name 	= request.getParameter("name");
		String addr 	= request.getParameter("addr");
		String phone	= request.getParameter("phone");
			
	
	
	
		
		try{
			
			Connection conn = DBCP.getConnection(); 
			
		
		String sql = "INSERT INTO `customer` VALUES (?,?,?,?);";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,custId);
		psmt.setString(2,name);
		psmt.setString(3,addr);
		psmt.setString(4,phone);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
	response.sendRedirect("./list.jsp");
	

%>
