package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.vo.ArticleVo;

@WebServlet("/view.do")
public class ViewController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String no = req.getParameter("no");
		
		
		ArticleDAO dao = ArticleDAO.getInstance();
		ArticleVo vo = dao.selectArticle(no);
		
		req.setAttribute("article", vo);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}