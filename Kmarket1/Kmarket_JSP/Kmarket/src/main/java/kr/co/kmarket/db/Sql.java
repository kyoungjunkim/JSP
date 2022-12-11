package kr.co.kmarket.db;

public class Sql {
	// test.insert admin product 김지홍
	public static final String INSERT_PRODUCT_BY_ADMIN = "INSERT INTO `km_product` SET "
			+ "`prodCate1` = ?, "
			+ "`prodCate2` = ?, "
			+ "`prodName` = ?, "
			+ "`descript` = ?, "
			+ "`company` = ?, "
			+ "`seller` = 'admin', "
			+ "`price` = ?, "
			+ "`thumb1` = ?, "
			+ "`thumb2` = ?, "
			+ "`thumb3` = ?, "
			+ "`detail` = ?, "
			+ "`ip` = ?, "
			+ "`point` = ?, "
			+ "`stock` = ?, "
			+ "`delivery` = ?, "
			+ "`discount` = ?, "
			+ "`rdate` = NOW()";

	// admin 상품출력 김지홍
	public static final String SELECT_PRODUCT_BY_ADMIN = "SELECT * FROM `km_product`";
	
	// admin category1 출력 김지홍
	public static final String SELECT_CATEGORY1_BY_ADMIN = "SELECT * FROM `km_product_cate1`";
	
	// admin category2 출력 김지홍

	public static final String SELECT_CATEGORY2_BY_ADMIN = "SELECT * FROM `km_product_cate2` WHERE `cate1` = ?";


  // member 약관
	public static final String SELECT_TERMS = "select * from `km_member_terms`";


}









	
	





















