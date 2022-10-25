<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="bean.CustBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String custid = request.getParameter("custid");
	
	//데이터베이스 처리
		String host = "jdbc:mysql://127.0.0.1:3306/java1_shop";
		String user = "root";
		String pass = "1234";
	
	CustBean cb = null;
	
	
	
		
		
		
		
	try{
		// 2단계
				Connection conn = DriverManager.getConnection(host, user, pass);
				// 3단계
			 	Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM `customer` WHERE `custid`='"+custid+"'");
		
		if(rs.next()){
			cb = new CustBean();
			cb.setCustid(rs.getString(1));
			cb.setName(rs.getString(2));
			cb.setHp(rs.getString(3));	
			cb.setAddr(rs.getString(4));
			cb.setRdate(rs.getString(5));	
		}
		
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
		<title>customer::modify</title>
	</head>
	<body>
		<h3>customer 수정</h3>
		
		<a href="../2_DBCPTest.jsp">처음으로</a>
		<a href="./list.jsp">customer 목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="custid" value="<%= cb.getCustid() %>" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= cb.getName() %>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= cb.getHp() %>"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%= cb.getAddr() %>"/></td>
				</tr>
				<tr>
					<td>날짜</td>
					<td><input type="date" name="rdate" value="<%= cb.getRdate() %>"/></td>
				</tr>
				
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"/></td>
				</tr>
			</table>
		</form>
	</body>
</html>