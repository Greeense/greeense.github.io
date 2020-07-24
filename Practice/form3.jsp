<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Practice Form</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style type="text/css">
		table {
			border: 1px solid black;
			width:100px;
			height:50px;
		}
		tr {
			border: 1px solid black;
		}
		td {
			border: 1px solid black;
		}
	</style>
	<script type="text/javascript">
		
		
	</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String titleVal = request.getParameter("title");
	String nameVal = request.getParameter("name");

	String url="jdbc:oracle:thin:@192.168.10.138:1521:Seung";
	String user="seung";
	String pass="1234";
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	pstmt= conn.prepareStatement("select * from PRAC_FORM");
	rs = pstmt.executeQuery();
%>
	<table>
	<% while(rs.next()) { %>
		<tr>
			<td><%= rs.getString("TITLE") %></td>
			<td><%= rs.getString("CONTENT") %></td>
		</tr>
	<% } conn.close(); %>
	</table>
</body>
</html>