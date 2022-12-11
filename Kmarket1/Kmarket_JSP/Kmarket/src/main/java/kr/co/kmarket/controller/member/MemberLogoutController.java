package kr.co.kmarket.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.kmarket.service.MemberService;

@WebServlet("/user/logout.do")
public class MemberLogoutController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	MemberService service = MemberService.INSTANCE;
	
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		
				// 세션 제거
				HttpSession session = req.getSession();
				session.removeAttribute("sessUser");
				session.invalidate();
				
				// 쿠키 제거 
				Cookie cookie = new Cookie("SESSID", null);
				cookie.setPath("/");
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
				
				// 데이터베이스 세션 로그아웃
				service.updateMemberForSessionOut(uid);
				
				resp.sendRedirect("/Kmarket/user/login.do?success=201");
			
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
