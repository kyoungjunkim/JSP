<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student::register</title>
	</head>
	<body>
		<h3>student 등록하기</h3>
		
		<a href="./list.jsp"></a>
		
		<form action="./registerProc.jsp" method="post">
			<table border = "1">
				<tr>
					<td>아이디</td>
					<td><input type ="text" name="stdNo" placeholder="학번 입력"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type ="text" name="stdname" placeholder="이름 입력"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type ="text" name="stdhp" placeholder="휴대폰 입력"></td>
				</tr>
				<tr>
					<td>학년</td>
					<td>
						<select name="stdYear">
							<option>1학년</option>
							<option>2학년</option>
							<option>3학년</option>
							
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name = "stdAddr" placeholder="주소 입력">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>