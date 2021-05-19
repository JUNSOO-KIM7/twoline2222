<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="java.util.ArrayList" %>
<%@ page import="twoline.OnelineDAO" %>
<%@ page import="twoline.OnelineDTO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	h1
	{
		background-color : yellow;
		font-style: italic;
		text-align: center;
		
	}
	section
	{
		margin: auto;
	}
	
	div
	{
		width: 1000px;
		margin: auto;
		border:3px solid;
		border-color: grey;
		font-size: 30px;
		text-align: center;
		background: #f00;
		background: linear-gradient(45deg, #f00, #fff);
	}
	p
	{
		border:0.5px solid;
		border-color: grey;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		
		font-size: 20px; 
		text-align: center;
	}
</style>
</head>
<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
<%
	String url = "jdbc:mysql://localhost/Aworld?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "22242224";
	Connection con = null;
	String sql = "select * from oneline order by no desc";
	PreparedStatement pstmt = null;	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection(url, user, passwd);
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();	//select
%>

<body>
<div id="postIt">
	<h1>메모장</h1><hr>
	
	<form method="post" action="memo_write.jsp">
	
	<section>
	<input type="text" name="memo" placeholder="메모입력 여기로 하세여 !!!!!" size="50"></input>
	<input type="submit" value="등록"></input>
	</section>
	</form>
	<hr>
	<div>
<%
	for(int i = 0; i < dtos.size() ; i++) {
		OnelineDTO dto = dtos.get(i);
		out.println("<p>(" + dto.getWdate() + ") " + dto.getMemo() + 
				"<input type=\"button\" value=\"X\" onClick=\"location.href='memo_delete.jsp?no=" + dto.getNo() + "'\"><br>");
		out.println("</input></p>");
	}
%>	
		
	</div>
	</div>

</body>
</html>