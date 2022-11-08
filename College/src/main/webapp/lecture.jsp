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
								alert('등록완료!');
							}else{
								alert('등록실패!');
							}
						}
						
					});
					
				});
				
			});
		
		</script>
		
	</head>
	<body>
		<h3>강좌관리</h3>
		<a href="/College/lecture.jsp">강좌관리</a>
		<a href="/College/register.jsp">수강관리</a>
		<a href="/College/student.jsp">학생관리</a>
		
		<h4>강좌현황</h4>
		
		
		<button class="btnRegister">등록</button>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>강좌명</th>
				<th>학점</th>
				<th>시간</th>
				<th>강의장</th>
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
			<h4>강좌등록</h4>
			
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="lecno"></td>
				</tr>
				
				<tr>
					<td>강좌명</td>
					<td><input type="text" name="lecname"></td>
				</tr>
				
				<tr>
					<td>학점</td>
					<td><input type="text" name="leccredit"></td>
				</tr>
				
				<tr>
					<td>시간</td>
					<td><input type="text" name="lectime"></td>
				</tr>
				
				<tr>
					<td>강의장</td>
					<td><input type="text" name="lecclass"></td>
				</tr>
				
				<tr>
					
					<td colspan="2" align="right"><input type="submit" value="추가"></td>
				</tr>
			</table>	
			
		</section>
		
		
		
	</body>
</html>