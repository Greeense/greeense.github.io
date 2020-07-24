<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
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

	String title = titleVal;
	String name = nameVal;
	
	pstmt= conn.prepareStatement("INSERT INTO PRAC_FORM(TITLE, CONTENT) values(?,?)");
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	
	rs = pstmt.executeQuery();
	pstmt.close();
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Practice Form</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style type="text/css">
		#window {
			display:block;
		}
	</style>
	<script type="text/javascript">
		var titleVal ='<%=titleVal%>';
		var nameVal = '<%=nameVal%>';
		window.onload = function() {
			document.getElementById('title2').value = titleVal;
			document.getElementById('name2').value = nameVal;
		};
		
		
	</script>
</head>
<body>
	<div id="window">
			<ul>
				<li>
					<label id="title">제목</label>
					<input type="text" name="title2" id="title2" readonly/>
				</li>
				<li>
					<label id="name">이름</label>
					<input type="text" name="name2" id="name2" readonly/>
				</li>
			</ul>
			<input type="button" value="뒤로" onclick="location.href='./form.html'" />
	</div>
</body>
</html>