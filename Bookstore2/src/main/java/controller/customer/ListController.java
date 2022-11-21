package controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import vo.CustomerVo;

@WebServlet("/customer/list.do")
public class ListController extends HttpServlet {
	
	
	
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		
	
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CustomerVo> customers = CustomerDao.getInstance().selectcustomers();
		
		// view에서 데이터 출력을 위한 request scope 데이터 설정
		req.setAttribute("customers", customers);
		
		
		//forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/customer/list.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	
	}
	
}


