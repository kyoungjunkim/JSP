package kr.co.kmarket.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket.db.DBHelper;
import kr.co.kmarket.db.Sql;
import kr.co.kmarket.db.Sql_Kbs;
import kr.co.kmarket.vo.ProductCate1VO;

import kr.co.kmarket.vo.ProductOrderVO;
import kr.co.kmarket.vo.ProductCate2VO;

import kr.co.kmarket.vo.ProductVO;

public class AdminDAO extends DBHelper {

	private static AdminDAO instance = new AdminDAO();
	public static AdminDAO getInstance() {
		return instance;
	}
	private AdminDAO() {}
	
	// 로거 생성
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	// admin 상품 등록	
	public int insertProductByAdmin(ProductVO vo) {
		logger.info("insertProductByAdmin...");
		int result = 0;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_PRODUCT_BY_ADMIN);
			psmt.setInt(1, vo.getProdCate1());
			psmt.setInt(2, vo.getProdCate2());
			psmt.setString(3, vo.getProdName());
			psmt.setString(4, vo.getDescript());
			psmt.setString(5, vo.getCompany());
			psmt.setInt(6, vo.getPrice());
			psmt.setString(7, vo.getThumb1());
			psmt.setString(8, vo.getThumb2());
			psmt.setString(9, vo.getThumb3());
			psmt.setString(10, vo.getDetail());
			psmt.setString(11, vo.getIp());
			psmt.setInt(12, vo.getPoint());
			psmt.setInt(13, vo.getStock());
			psmt.setInt(14, vo.getDelivery());
			psmt.setInt(15, vo.getDiscount());
			
			result = psmt.executeUpdate();
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result :" + result);
		return result;
	}
	
	// admin 등록한 상품 리스트 김지홍
	public List<ProductVO> selectProductByAdmin(String uid) {
		logger.info("selectProductByAdmin...");
		List<ProductVO> products = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_PRODUCT_BY_ADMIN);
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setPrdoNo(rs.getInt(1));
				vo.setProdCate1(rs.getInt(2));
				vo.setProdCate2(rs.getInt(3));
				vo.setProdName(rs.getString(4));
				vo.setDescript(rs.getString(5));
				vo.setCompany(rs.getString(6));
				vo.setSeller(rs.getString(7));
				vo.setPrice(rs.getInt(8));
				vo.setDiscount(rs.getInt(9));
				vo.setPoint(rs.getInt(10));
				vo.setStock(rs.getInt(11));
				vo.setSold(rs.getInt(12));
				vo.setDelivery(rs.getInt(13));
				vo.setHit(rs.getInt(14));
				vo.setScore(rs.getInt(15));
				vo.setReview(rs.getInt(16));
				vo.setThumb1(rs.getString(17));
				vo.setThumb2(rs.getString(18));
				vo.setThumb3(rs.getString(19));
				vo.setDetail(rs.getString(20));
				vo.setStatus(rs.getString(21));
				vo.setDuty(rs.getString(22));
				vo.setReceipt(rs.getString(23));
				vo.setBizType(rs.getString(24));
				vo.setOrigin(rs.getString(25));
				vo.setIp(rs.getString(26));
				vo.setRdate(rs.getString(27));
				products.add(vo);
			}
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result :" + products);
		return products;
	}
	
	// admin 카테고리 리스트 출력 	

	public List<ProductCate1VO> selectCategory1ByAdmin() {
		logger.info("insertProductByAdmin...");
		List<ProductCate1VO> cates = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_CATEGORY1_BY_ADMIN);
			while(rs.next()) {
				ProductCate1VO vo = new ProductCate1VO();
				vo.setCate1(rs.getInt(1));
				vo.setC1Name(rs.getString(2));
				cates.add(vo);
			}
			
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("cates :" + cates);
		return cates;
	}
		
	// admin 주문건수	
	public ProductOrderVO selectOrderByAdmin(String ordNo) {
		logger.info("selectOrderByAdmin...");
		ProductOrderVO vo = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql_Kbs.SELECT_COUNT_ORDER);
			psmt.setString(1, ordNo);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new ProductOrderVO();
				vo.setOrdNo(rs.getInt(1));
				vo.setOrdUid(rs.getString(2));
				vo.setOrdCount(rs.getInt(3));
				vo.setOrdPrice(rs.getInt(4));
				vo.setOrdDiscount(rs.getInt(5));
				vo.setOrdDelivery(rs.getInt(6));
				vo.setSavePoint(rs.getInt(7));
				vo.setUsedPoint(rs.getInt(8));
				vo.setOrdTotPrice(rs.getInt(9));
				vo.setRecipName(rs.getString(01));
				vo.setRecipHp(rs.getString(11));
				vo.setRecipZip(rs.getString(12));
				vo.setRecipAddr1(rs.getString(13));
				vo.setRecipAddr2(rs.getString(14));
				vo.setOrdPayment(rs.getInt(15));
				vo.setOrdComplete(rs.getInt(16));
				vo.setOrdDate(rs.getString(17));
			}
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("vo :" + vo);
		return vo;
	}



	// admin 카테고리2 리스트 출력 	
	public List<ProductCate2VO> selectCategory2ByAdmin(String cate2) {
		logger.info("insertProductByAdmin2...");
		List<ProductCate2VO> cates = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_CATEGORY2_BY_ADMIN);
			psmt.setString(1, cate2);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ProductCate2VO vo = new ProductCate2VO();
				vo.setCate1(rs.getInt(1));
				vo.setCate2(rs.getInt(2));
				vo.setC2Name(rs.getString(3));
				cates.add(vo);
			}
			
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("cates :" + cates);
		return cates;
	}

	
	
	
	
	
	
	
}
