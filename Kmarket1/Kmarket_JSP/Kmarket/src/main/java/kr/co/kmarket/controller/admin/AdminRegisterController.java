package kr.co.kmarket.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kmarket.service.AdminService;
import kr.co.kmarket.vo.ProductVO;

@WebServlet("/admin/product/register.do")
public class AdminRegisterController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	AdminService service = AdminService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/product/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String savePath = req.getServletContext().getRealPath("/file");
		File mdfile = new File(savePath);
		if(!mdfile.exists()) mdfile.mkdirs();
				int maxSize = 1024 * 1024 * 5;
		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String prodCate1 = mr.getParameter("category1");
		String prodCate2 = mr.getParameter("category2");
		String prodName = mr.getParameter("prodName");
		String descript = mr.getParameter("descript");
		String company = mr.getParameter("company");
		String price = mr.getParameter("price");
		String ip = req.getRemoteAddr();
		String point = mr.getParameter("point");
		String stock = mr.getParameter("stock");
		String delivery = mr.getParameter("delivery");
		String discount = mr.getParameter("discount");
		String thumb1 = mr.getFilesystemName("thumb1");
		String thumb2 = mr.getFilesystemName("thumb2");
		String thumb3 = mr.getFilesystemName("thumb3");
		String detail = mr.getFilesystemName("detail");
		
		//String status = mr.getParameter("status");
		//String duty = mr.getParameter("duty");
		//String receipt = mr.getParameter("receipt");
		//String bizType = mr.getParameter("bizType");
		//String brand = mr.getParameter("brand");
		//String origin = mr.getParameter("origin");
		//String stock = mr.getParameter("stock");
		
		
		String newThumb1 = null;
		String newThumb2 = null;
		String newThumb3 = null;
		String newDetail = null;
		try {
			newThumb1 = service.reNameFile(thumb1, "uid190", savePath);
			TimeUnit.SECONDS.sleep(1);
			newThumb2 = service.reNameFile(thumb2, "uid230", savePath);
			TimeUnit.SECONDS.sleep(1);
			newThumb3 = service.reNameFile(thumb3, "uid456", savePath);
			TimeUnit.SECONDS.sleep(1);
			newDetail = service.reNameFile(detail, "uid940", savePath);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		ProductVO vo = new ProductVO();
		vo.setProdCate1(prodCate1);
		vo.setProdCate2(prodCate2);
		vo.setProdName(prodName);
		vo.setDescript(descript);
		vo.setCompany(company);
		vo.setPrice(price);
		vo.setIp(ip);
		vo.setPoint(point);
		vo.setStock(stock);
		vo.setDelivery(delivery);
		vo.setDiscount(discount);
		vo.setThumb1(newThumb1);
		vo.setThumb2(newThumb2);
		vo.setThumb3(newThumb3);
		vo.setDetail(newDetail);
		
		// 상품정보 제공고시
		
//		vo.setStatus(status);
//		vo.setDuty(duty);
//		vo.setReceipt(receipt);
//		vo.setBizType(bizType);
//		vo.setBrand(brand);
//		vo.setOrigin(origin);
		
		
		
		
		
		
		int result = service.insertProductByAdmin(vo);
		
		if(result >0) resp.sendRedirect("./list.do");
		
	}
}
