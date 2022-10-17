<%@page import="bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String host = "jdbc:mysql://127.0.0.1:3306/java1db";
String user = "root";
String pass = "1234";
	
	List<UserBean> users = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `user3`";
		ResultSet rs = stmt.executeQuery(sql);
		
		users = new ArrayList<>();
		
		while (rs.next()){
			UserBean ub = new UserBean();
			
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
			users.add(ub);
		}
		
		stmt.close();
		rs.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
			

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>user목록</h3>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				
			</tr>
			<% for(UserBean ub : users){ %>
			<tr>
				<td><%= ub.getUid() %></td>
				<td><%= ub.getName() %></td>
				<td><%= ub.getHp() %></td>
				<td><%= ub.getAge() %></td>
			
			
			
			</tr>
			<% } %>
			
		</table>
		
	</body>
</html>