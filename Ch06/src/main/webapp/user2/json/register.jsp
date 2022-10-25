<%@page import="kr.co.jboard1.db.JDBC"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%

//전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	
	//데이터베이스 작업
	
	
	
		int result = 0;
	
		try{
			Connection conn = JDBC.getInstance().getConnection();
			
		
		//3단계
		String sql = "INSERT INTO `user2` VALUES (?,?,?,?);";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,uid);
		psmt.setString(2,name);
		psmt.setString(3,hp);
		psmt.setString(4,age);
		//4단계
		result = psmt.executeUpdate();
		//5단계
		//6단계
		psmt.close();
		conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//String jsonData = "{\"result\":"+result+"}"; 
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		String jsonData = json.toString();
		
		out.print(jsonData);
%>