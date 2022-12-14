<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.college.bean.LectureBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<LectureBean> lecs = new ArrayList<>();
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from `lecture`");
		
		while(rs.next()){
			LectureBean lb = new LectureBean();
			lb.setLecno(rs.getInt(1));
			lb.setLecname(rs.getString(2));
			lb.setLeccredit(rs.getInt(3));
			lb.setLectime(rs.getInt(4));
			lb.setLecclass(rs.getString(5));
			
			lecs.add(lb);
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
		<title>college::lecture</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function() {
				$('.btnRegister').click(function() {
					let lecno = $(this).val();
					
					$('section').show().find('input[name=lecno]').val(lecno);
						
				});
				
				$('.btnClose').click(function () {
					$('section').hide();
				});
				
				$('input[type=submit]').click(function() {
					
					let lecno = $('input[name=lecno]').val();
					let lecname = $('input[name=lecname]').val();
					let leccredit = $('input[name=leccredit]').val();
					let lectime = $('input[name=lectime]').val();
					let lecclass = $('input[name=lecclass]').val();
					
					let jsonData = {
							"lecno": lecno,
							"lecname": lecname,
							"leccredit": leccredit,
							"lectime": lectime,
							"lecclass": lecclass
					};
					
					console.log('jsonData : '+ jsonData);
					
					$.ajax({
						url:'/College/proc/lectureProc.jsp',
						type:'POST',
						data: jsonData,
						dataType:'json',
						success:function(data){
							if(data.result == 1){
								alert('????????????!');
							}else{
								alert('????????????!');
							}
						}
						
					});
					
				});
				
			});
		
		</script>
		
	</head>
	<body>
		<h3>????????????</h3>
		<a href="/College/lecture.jsp">????????????</a>
		<a href="/College/register.jsp">????????????</a>
		<a href="/College/student.jsp">????????????</a>
		
		<h4>????????????</h4>
		
		
		<button class="btnRegister">??????</button>
		<table border="1">
			<tr>
				<th>??????</th>
				<th>?????????</th>
				<th>??????</th>
				<th>??????</th>
				<th>?????????</th>
			</tr>
			<% for(LectureBean lb : lecs){ %>
			<tr>
				<td><%= lb.getLecno() %></td>
				<td><%= lb.getLecname() %></td>
				<td><%= lb.getLeccredit() %></td>
				<td><%= lb.getLectime() %></td>
				<td><%= lb.getLecclass() %></td>
			</tr>
			<% }%>
		</table>
		
		<section style="display : none">
			<h4>????????????</h4>
			
			<button class="btnClose">??????</button>
			<table border="1">
				<tr>
					<td>??????</td>
					<td><input type="text" name="lecno"></td>
				</tr>
				
				<tr>
					<td>?????????</td>
					<td><input type="text" name="lecname"></td>
				</tr>
				
				<tr>
					<td>??????</td>
					<td><input type="text" name="leccredit"></td>
				</tr>
				
				<tr>
					<td>??????</td>
					<td><input type="text" name="lectime"></td>
				</tr>
				
				<tr>
					<td>?????????</td>
					<td><input type="text" name="lecclass"></td>
				</tr>
				
				<tr>
					
					<td colspan="2" align="right"><input type="submit" value="??????"></td>
				</tr>
			</table>	
			
		</section>
		
		
		
	</body>
</html>