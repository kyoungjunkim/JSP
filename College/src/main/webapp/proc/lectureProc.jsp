<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String lecno = request.getParameter("lecno");
	String lecname = request.getParameter("lecname");
	String leccredit = request.getParameter("leccredit");
	String lectime = request.getParameter("lectime");
	String lecclass = request.getParameter("lecclass");

	int result = 0;
	
	try{
		Connection conn = DBCP.getConnection();
		String 	sql = "insert into `lecture` (`lecno`, `lecname`, `leccredit`, `lectime`, `lecclass`)";
				sql += "values (?, ?, ?, ?, ?)";
		
				
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, lecno);
		psmt.setString(2, lecname);
		psmt.setString(3, leccredit);
		psmt.setString(4, lectime);
		psmt.setString(5, lecclass);
		
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