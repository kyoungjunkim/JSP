<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean sessUser = (UserBean)session.getAttribute("sessUser");

	if(sessUser == null){
		response.sendRedirect("/Jboard1/user/login.jsp?success=101");
		return; //처리종료
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>    
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <header>
            <h3><a href="/Jboard1">Board System v1.0</a></h3>
            <p>
                <span class="nick"><%= sessUser.getNick() %></span>님 반갑습니다.
                <a href="/Jboard1/user/proc/logout.jsp" class="logout">[로그아웃]</a>
            </p>
        </header>