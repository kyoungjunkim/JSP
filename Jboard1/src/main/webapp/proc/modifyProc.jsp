<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	String no = request.getParameter("no");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	ArticleDAO.getInstance().updateArticle(no, title, content);
	
	response.sendRedirect("/Jboard1/view.jsp?no="+no+"&pg="+pg);
	
	
	
	


	



%>