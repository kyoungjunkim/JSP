<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String custid = request.getParameter("custid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	String rdate = request.getParameter("rdate");
	
	
	//데이터베이스 작업
	
	
	
		
		try{
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env"); // JNDI 서비스를 사용하기 위한 기본이름
			
			//2단계 - 커넥션 풀 얻기
			DataSource ds = (DataSource)ctx.lookup("dbcp_java1_shop"); //커넥션 풀 가져오기
			Connection conn = ds.getConnection(); //커넥션 가져오기
			
		
		//3단계
		String sql = "INSERT INTO `customer` VALUES (?,?,?,?,?);";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,custid);
		psmt.setString(2,name);
		psmt.setString(3,hp);
		psmt.setString(4,addr);
		psmt.setString(5,rdate);
		//4단계
		psmt.executeUpdate();
		//5단계
		//6단계
		psmt.close();
		conn.close();
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
	//리다이렉트
	response.sendRedirect("./list.jsp");
	

%>
