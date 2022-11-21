package controller.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import vo.CustomerVo;

@WebServlet("/customer/register.do")
public class ReigsterController extends HttpServlet {

private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//view forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/customer/register.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post 요청
		String custId = req.getParameter("custId");
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		String phone = req.getParameter("phone");
		
		CustomerVo vo = new CustomerVo();
		vo.setCustId(custId);
		vo.setName(name);
		vo.setAddr(addr);
		vo.setPhone(phone);
		
		CustomerDao.getInstance().insertcustomer(vo);
		
		// 리다이렉트
		resp.sendRedirect("/Bookstore2/customer/list.do");
	}
	
}