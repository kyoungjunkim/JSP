<%@page import="kr.co.college.bean.StudentBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<StudentBean> stds = new ArrayList<>();
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from `student`");
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStdno(rs.getString(1));
			sb.setStdname(rs.getString(2));
			sb.setStdhp(rs.getString(3));
			sb.setStdyear(rs.getInt(4));
			sb.setStdaddress(rs.getString(5));
			
			stds.add(sb);
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
					let stdno = $(this).val();
					
					$('section').show().find('input[name=stdno]').val(stdno);
						
				});
				
				$('.btnClose').click(function () {
					$('section').hide();
				});
				
				$('input[type=submit]').click(function() {
					
					let stdno = $('input[name=stdno]').val();
					let stdname = $('input[name=stdname]').val();
					let stdhp = $('input[name=stdhp]').val();
					let stdyear = $('select[name=stdyear]').val();
					let stdaddress = $('input[name=stdaddress]').val();
					
					let jsonData = {
							"stdno": stdno,
							"stdname": stdname,
							"stdhp": stdhp,
							"stdyear": stdyear,
							"stdaddress": stdaddress
					};
					
					console.log('jsonData : '+ jsonData);
					
					$.ajax({
						url:'/College/proc/studentProc.jsp',
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
		
		
		<button class="btnRegister" >??????</button>
		<table border="1">
			<tr>
				<th>??????</th>
				<th>??????</th>
				<th>?????????</th>
				<th>??????</th>
				<th>??????</th>
			</tr>
			<% for(StudentBean sb : stds){ %>
			<tr>
				<td><%= sb.getStdno() %></td>
				<td><%= sb.getStdname() %></td>
				<td><%= sb.getStdhp() %></td>
				<td><%= sb.getStdyear() %></td>
				<td><%= sb.getStdaddress() %></td>
			</tr>
			<% }%>
		</table>
		
		
	<section style="display : none">
			<h4>????????????</h4>
			
			<button class="btnClose" >??????</button>
			<table border="1">
				<tr>
					<td>??????</td>
					<td><input type="text" name="stdno"></td>
				</tr>
				
				<tr>
					<td>??????</td>
					<td><input type="text" name="stdname"></td>
				</tr>
				
				<tr>
					<td>?????????</td>
					<td><input type="text" name="stdhp"></td>
				</tr>
				
				<tr>
					<td>??????</td>
					<td>
						<select name="stdyear">
						<option value="1">1??????</option>
						<option value="2">2??????</option>
						<option value="3">3??????</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>??????</td>
					<td><input type="text" name="stdaddress"></td>
				</tr>
				
				<tr>
					
					<td colspan="2" align="right"><input type="submit" value="??????"></td>
				</tr>
			</table>	
		</section>
	</body>
</html>