<%@page import="bean.StudentBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid= request.getParameter("uid");
	
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java1db";
	String user = "root";
	String pass = "1234";
	
	StudentBean sb = null;
	
	try{
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
	 	Statement stmt = conn.createStatement();
		// 4단계
		ResultSet rs = stmt.executeQuery("SELECT * FROM `member` WHERE `uid`='"+uid+"'");
		// 5단계
		if(rs.next()){
			sb = new StudentBean();
			sb.setstdNo(rs.getString(1));
			sb.setstdName(rs.getString(2));
			sb.setstdHp(rs.getString(3));
			sb.setstdYear(rs.getInt(4));
			sb.setstdAddr(rs.getString(5));
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user::modify</title>
	</head>
	<body>
		<h3>user 수정하기</h3>
		
		<a href="./list.jsp">user 목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="stdNo" readonly value="<%= sb.getstdNo() %>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdname" value="<%= sb.getstdName() %>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdhp" value="<%= sb.getstdHp() %>"/></td>
				</tr>
				<tr>
					<td>학년</td>
					<td><input type="text" name="stdYear" value="<%= sb.getstdYear() %>"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="number" name="stdAddr" value="<%= sb.getstdAddr() %>"/></td>
				</tr>
				
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기"/>
					</td>
				</tr>			
			</table>	
		</form>
	</body>
</html>