package kr.co.kmarket.db;

public class Sql_kkj {
	
	// member 로그인
	public static final String SELECT_MEMBER = "select * from `km_member` where `uid`=? and `pass`=SHA2(?, 256)";
	
	public static final String UPDATE_USER_FOR_SESSION = "update `km_member` set `sessId`=?, `sessLimitDate` = DATE_ADD(NOW(), INTERVAL 3 DAY) where `uid`=?";
	public static final String UPDATE_USER_FOR_SESSION_OUT = "update `km_member` set `sessId`=NULL, `sessLimitDate`=NULL where `uid`=?";
	
	
	
	// member 약관
	public static final String SELECT_TERMS = "select * from `km_member_terms`";
	
	
	// member 회원가입
	public static final String INSERT_USER      = "insert into `km_member` set "
			+ "`uid`=?,"
			+ "`pass`=SHA2(?, 256),"
			+ "`name`=?,"
			+ "`gender`=?,"
			+ "`email`=?,"
			+ "`hp`=?,"
			+ "`zip`=?,"
			+ "`addr1`=?,"
			+ "`addr2`=?,"
			+ "`regip`=?,"
			+ "`rdate`=NOW()";
	
	public static final String SELECT_COUNT_UID  = "select count(`uid`) from `km_member` where `uid`=?";
	
	
}
