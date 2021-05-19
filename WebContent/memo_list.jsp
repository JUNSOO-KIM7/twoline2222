<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	String url = "jdbc:mysql://localhost/Aworld?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "22242224";
	Connection con = null;
	String sql = "select * from oneline";
	PreparedStatement pstmt = null;	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection(url, user, passwd);
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();	//select
	//	pstmt.executeUpdate();	//insert, delete, update, 기타.. 
	
	while(rs.next()) {
		int no = rs.getInt(1);
		String memo = rs.getString(2); // 2 말고 "memo" //이름으로도 가능. 
		String wdate = rs.getString(3);
		
		out.println(no + ": " + memo + " :(" + wdate + ")<br>");
	}
	rs.close();
	pstmt.close();
	con.close();
	out.println("DB조회 성공");
%>
</body>
</html>