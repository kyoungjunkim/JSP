<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.college.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.college.bean.RegisterBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<RegisterBean> regs = new ArrayList<>();
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		
		String 	sql = "SELECT a.*, b.`stdname`, c.`lecname` FROM `register` AS a ";
		sql += "JOIN `student` AS b ON a.regstdno = b.stdno ";
		sql += "JOIN `lecture` AS c ON a.reglecno = c.lecno; ";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			RegisterBean rb = new RegisterBean();
			rb.setRegstdno(rs.getString(1));
			rb.setReglecno(rs.getInt(2));
			rb.setRegmidscore(rs.getInt(3));
			rb.setRegfinalscore(rs.getInt(4));
			rb.setRegtotalscore(rs.getInt(5));
			rb.setReggrade(rs.getString(6));
			rb.setStdname(rs.getString(7));
			rb.setLecname(rs.getString(8));
			
			regs.add(rb);
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
		<title>college::register</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function() {
				$('.btnRegister').click(function() {
					let regstdno = $(this).val();
					
					$('section').show().find('input[name=regstdno]').val(regstdno);
						
				});
				
				$('.btnClose').click(function () {
					$('section').hide();
				});
				
				$('input[type=submit]').click(function() {
					
					let regstdno = $('input[name=regstdno]').val();
					let stdname = $('input[name=stdname]').val();
					let lecname = $('select[name=lecname]').val();
					
					let jsonData = {
							"regstdno": regstdno,
							"stdname": stdname,
							"lecname": lecname
					};
					
					console.log('jsonData : '+ jsonData);
					
					$.ajax({
						url:'/College/proc/registerProc.jsp',
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
		<h3>수강관리</h3>
		<a href="/College/lecture.jsp">강좌관리</a>
		<a href="/College/register.jsp">수강관리</a>
		<a href="/College/student.jsp">학생관리</a>
		
		<h4>수강현황</h4>
		
		
		<textarea></textarea>
		<button>검색</button>
		<button class="btnRegister">수강신청</button>
		
		
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>강좌명</th>
				<th>강좌코드</th>
				<th>중간시험</th>
				<th>기말시험</th>
				<th>총점</th>
				<th>등급</th>
			</tr>
			
			
			<% for(RegisterBean rb : regs){ %>
			<tr>
				<td><%= rb.getRegstdno() %></td>
				<td><%= rb.getStdname() %></td>
				<td><%= rb.getLecname() %></td>
				<td><%= rb.getReglecno() %></td>
				<td><%= rb.getRegmidscore() %></td>
				<td><%= rb.getRegfinalscore() %></td>
				<td><%= rb.getRegtotalscore() %></td>
				<td><%= rb.getReggrade() %></td>
			</tr>
			<% }%>
		
		</table>
		
		<section style="display : none">
			<h4>수강신청</h4>
			
			<button class="btnClose">닫기</button>
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="regstdno"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdname"></td>
				</tr>
				
				
				
				<tr>
					<td>신청강좌</td>
					<td>
						<select name="lecname">
						<option value="문법">문법</option>
						<option value="인지행동심리학">인지행동심리학</option>
						<option value="운영체제론">운영체제론</option>
						<option value="중급 영문법">중급 영문법</option>
						<option value="세법개론">세법개론</option>
						<option value="빅데이터개론">빅데이터개론</option>
						<option value="컴퓨터사고와코딩">컴퓨터사고와코딩</option>
						<option value="사회복지마케팅">사회복지마케팅</option>
						</select>
					</td>
				</tr>
				
				
				
				<tr>
					
					<td colspan="2" align="right"><input type="submit" value="신청"></td>
				</tr>
			</table>	
			
		</section>
		
	</body>
</html>