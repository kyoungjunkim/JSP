<%@page import="kr.co.Shop.bean.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.Shop.db.DBCP"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	
	List<OrderBean> orders = new ArrayList<>();
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String 	sql = "SELECT a.*, b.`name`, c.`prodName` FROM `order` AS a ";
				sql += "JOIN `customer` AS b ON a.orderid = b.custid ";
				sql += "JOIN `product` AS c ON a.orderproduct = c.prodno; ";
				
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			OrderBean ob = new OrderBean();
			ob.setOrderNo(rs.getInt(1));
			ob.setOrderId(rs.getString(2));
			ob.setOrderProduct(rs.getString(3));
			ob.setOrderCount(rs.getInt(4));
			ob.setOrderDate(rs.getString(5));
			ob.setName(rs.getString(6));
			ob.setProdName(rs.getString(7));
			
			orders.add(ob);
		}
		
		conn.close();
		stmt.close();
		rs.close();
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>order::list</title>
	</head>
	<body>
		<h3>주문목록</h3>
		<a href="/Shop/customer.jsp">고객목록</a>
		<a href="/Shop/order.jsp">주문목록</a>
		<a href="/Shop/product.jsp">상품목록</a>
		
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문일</th>
			</tr>
			<% for(OrderBean ob : orders){ %>
			<tr>
				<td><%= ob.getOrderNo() %></td>
				<td><%= ob.getName() %></td>
				<td><%= ob.getProdName() %></td>
				<td><%= ob.getOrderCount() %></td>
				<td><%= ob.getOrderDate().substring(0, 16) %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>