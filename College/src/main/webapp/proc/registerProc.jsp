<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String regstdno = request.getParameter("regstdno");
	String reglecno = request.getParameter("reglecno");
	String regmidscore = request.getParameter("regmidscore");
	String regfinalscore = request.getParameter("regfinalscore");
	String regtotalscore = request.getParameter("regtotalscore");
	String reggrade = request.getParameter("reggrade");
	String stdname = request.getParameter("stdname");
	String lecname = request.getParameter("lecname");

	int result = 0;
	
	try{
		Connection conn = DBCP.getConnection();
		String 	sql = "insert into `register` (`regstdno`, `stdname`, `lecname`)";
				sql += "values (?, ?, ?)";
		
				
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, regstdno);
		psmt.setString(2, reglecno);
		psmt.setString(3, regmidscore);
		psmt.setString(4, regfinalscore);
		psmt.setString(5, regtotalscore);
		psmt.setString(6, reggrade);
		
		result = psmt.executeUpdate();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//JSON출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
	
%>