<%@page import="bean.MemberBean"%>
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
	
	MemberBean mb = null;
	
	try{
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
	 	Statement stmt = conn.createStatement();
		// 4단계
		ResultSet rs = stmt.executeQuery("SELECT * FROM `member` WHERE `uid`='"+uid+"'");
		// 5단계
		if(rs.next()){
			mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setRdate(rs.getString(6));
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
					<td><input type="text" name="uid" readonly value="<%= mb.getUid() %>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= mb.getName() %>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= mb.getHp() %>"/></td>
				</tr>
				<tr>
					<td>직급</td>
					<td><input type="text" name="pos" value="<%= mb.getPos() %>"/></td>
				</tr>
				<tr>
					<td>번호</td>
					<td><input type="number" name="dep" value="<%= mb.getDep() %>"/></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td><input type="datetime" name="rdate" value="<%= mb.getRdate() %>"/></td>
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