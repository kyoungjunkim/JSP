/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.67
 * Generated at: 2022-10-12 03:44:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import bean.MemberBean;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("bean.MemberBean");
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.Statement");
    _jspx_imports_classes.add("java.sql.DriverManager");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java1db";
	String user = "root";
	String pass = "1234";
	List<MemberBean> members = null;
	
	try{
		// 1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		// 3단계
		Statement stmt = conn.createStatement();		
		// 4단계
		String sql = "SELECT * FROM `member`";
		ResultSet rs = stmt.executeQuery(sql);
		// 5단계
		members = new ArrayList<>();
		
		while(rs.next()){
			MemberBean mb = new MemberBean();			
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setRdate(rs.getString(6));
			members.add(mb);			
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("	<head>\r\n");
      out.write("		<meta charset=\"UTF-8\">\r\n");
      out.write("		<title>user::list</title>\r\n");
      out.write("	</head>\r\n");
      out.write("	<body>\r\n");
      out.write("		<h3>user 목록</h3>\r\n");
      out.write("		<a href=\"./register.jsp\">user 등록하기</a>\r\n");
      out.write("		<table border=\"1\">\r\n");
      out.write("			<tr>\r\n");
      out.write("				<th>아이디</th>\r\n");
      out.write("				<th>이름</th>\r\n");
      out.write("				<th>휴대폰</th>\r\n");
      out.write("				<th>직급</th>\r\n");
      out.write("				<th>번호</th>\r\n");
      out.write("				<th>날짜</th>\r\n");
      out.write("			</tr>\r\n");
      out.write("			");
 for(MemberBean mb : members){ 
      out.write("\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>");
      out.print( mb.getUid() );
      out.write("</td>\r\n");
      out.write("				<td>");
      out.print( mb.getName() );
      out.write("</td>\r\n");
      out.write("				<td>");
      out.print( mb.getHp() );
      out.write("</td>\r\n");
      out.write("				<td>");
      out.print( mb.getPos() );
      out.write("</td>\r\n");
      out.write("				<td>\r\n");
      out.write("						");
 
							switch(mb.getDep()){
							case 101:
								out.println("영업1부");
								break;
							case 102:
								out.println("영업2부");
								break;
							case 103:
								out.println("영업3부");
								break;
							case 104:
								out.println("영업4부");
								break;
							case 105:
								out.println("인사부");
								break;
							}
						
      out.write("\r\n");
      out.write("					</td>\r\n");
      out.write("				<td>");
      out.print( mb.getRdate().substring(0, 10) );
      out.write("</td>\r\n");
      out.write("				<td>\r\n");
      out.write("					<a href=\"./modify.jsp?uid=");
      out.print( mb.getUid() );
      out.write("\">수정</a>\r\n");
      out.write("					<a href=\"./delete.jsp?uid=");
      out.print( mb.getUid() );
      out.write("\">삭제</a>\r\n");
      out.write("				</td>				\r\n");
      out.write("			</tr>\r\n");
      out.write("			");
 } 
      out.write("\r\n");
      out.write("		</table>		\r\n");
      out.write("	</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
