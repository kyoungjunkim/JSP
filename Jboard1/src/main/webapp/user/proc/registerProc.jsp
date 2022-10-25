<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid 		= request.getParameter("uid");
	String pass1 	= request.getParameter("pass1");
	String name 	= request.getParameter("name");
	String nick 	= request.getParameter("nick");
	String email 	= request.getParameter("email");
	String hp 		= request.getParameter("hp");
	String zip 		= request.getParameter("zip");
	String addr1 	= request.getParameter("addr1");
	String addr2 	= request.getParameter("addr2");
	String regip 	= request.getRemoteAddr(); //클라이언트 ip주소 
	
	//데이터베이스 작업
	try{
		
		Connection conn = DBCP.getConnection(); //커넥션 가져오기
		
		
		
		// 위에 쿼리문에 ?같이 준비만 되어있는 쿼리문일때는 PrepareStatement, 완성된 쿼리문일때 Statement
		
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_USER);
		psmt.setString(1,uid);
		psmt.setString(2,pass1);
		psmt.setString(3,name);
		psmt.setString(4,nick);
		psmt.setString(5,email);
		psmt.setString(6,hp);
		psmt.setString(7,zip);
		psmt.setString(8,addr1);
		psmt.setString(9,addr2);
		psmt.setString(10,regip);
		//4단계
		psmt.executeUpdate();
		//5단계
		//6단계
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/Jboard1/user/login.jsp");
	
	
%>