package kr.co.kmarket.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.kmarket.dao.AdminDAO;
import kr.co.kmarket.vo.ProductCate1VO;

import kr.co.kmarket.vo.ProductOrderVO;
import kr.co.kmarket.vo.ProductCate2VO;

import kr.co.kmarket.vo.ProductVO;

public enum AdminService {
	INSTANCE;
	AdminDAO dao = AdminDAO.getInstance();
	
	// admin 상품 등록 김지홍
	public int insertProductByAdmin(ProductVO vo) {
		return dao.insertProductByAdmin(vo);
	}
	
	// admin list 출력 김지홍
	public List<ProductVO> selectProductByAdmin(String uid){
		return dao.selectProductByAdmin(uid);
	}

	// admin cate 출력 김지홍
	public List<ProductCate1VO> selectCategory1ByAdmin(){
		return dao.selectCategory1ByAdmin();
	}
	
	// admin cate 출력 김지홍
	public List<ProductCate2VO> selectCategory2ByAdmin(String cate2){
		return dao.selectCategory2ByAdmin(cate2);
	}
	
	// admin 주문건수 출력 김보성
	public ProductOrderVO selectOrderByAdmin(String ordNo) {
		return dao.selectOrderByAdmin(ordNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 파일 이름 변경 김지홍
	public String reNameFile(String fName, String uid, String savePath) {
		int idx = fName.lastIndexOf("."); // 확장자 인덱스
		String ext = fName.substring(idx); // 확장자 구분
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_"); // 날짜형식 
		String now = sdf.format(new Date()); // 오늘 날짜 포맷 적용
		String newName = now + uid + ext; // 새로운 파일 이름
		File oriFile = new File(savePath + "/" + fName); // 실제 저장된 파일 객체
		File newFIle = new File(savePath + "/" + newName); // 변경할 파일 객체
		oriFile.renameTo(newFIle);
		return newName;
	}
	
	// list json 변환 메서드 김지홍
	public void gsonTojson(Object obj, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/x-json; charset=UTF-8");
		Gson gson = new Gson();
		String jsonData = gson.toJson(obj);
		PrintWriter writer = resp.getWriter();
		writer.print(jsonData);
	}
	

}
