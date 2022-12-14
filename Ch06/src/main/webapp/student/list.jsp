<%@page import="bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.jboard1.db.JDBC"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<StudentBean> students = null;
	
	try{
		Connection conn = JDBC.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `student`");
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setstdNo(rs.getString(1));
			sb.setstdName(rs.getString(2));
			sb.setstdHp(rs.getString(3));
			sb.setstdYear(rs.getInt(4));
			sb.setstdAddr(rs.getString(5));
			students.add(sb);
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
		<title>student::list</title>
	</head>
	<body>
		<h3>student 목록</h3>
		<a href="./register.jsp">student 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>주소</th>
			</tr>
			<% for(StudentBean sb : students){ %>
			<tr>
				<td><%= sb.getstdNo() %></td>
				<td><%= sb.getstdName() %></td>
				<td><%= sb.getstdHp() %></td>
				<td>
				<% 
							switch(sb.getstdYear()){
							case 1:
								out.println("1학년");
								break;
							case 2:
								out.println("2학년");
								break;
							case 3:
								out.println("3학년");
								break;
							}
						%>
				</td>
				<td><%= sb.getstdAddr() %></td>
		<td>
					<a href="./modify.jsp?uid=<%= sb.getstdNo() %>">수정</a>
					<a href="./delete.jsp?uid=<%= sb.getstdNo() %>">삭제</a>
				</td>				
			</tr>
			<% } %>
		</table>		
	</body>
</html>