<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.*" %>
    <%@page import="java.util.*" %>
    <% 
    request.setCharacterEncoding("utf-8");
    String where = "C:/My__PC/schedule/schedule.txt";
    
    String name = request.getParameter("name");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    
    String message ="";
    String script="";
    
    message ="일정이 저장되었습니다.";
    
    StringWriter str = new StringWriter();
    PrintWriter pw = new PrintWriter(str);
    pw.println("---------------------------");
    pw.println("[이름] : "+name);
    pw.println("[날짜] : "+date);
    pw.println("[시간] : "+time);
    pw.println("[제목] : "+title);
    pw.println("[내용] : "+content);
    
    StringReader strReader = new StringReader(str.toString());
    FileWriter file = new FileWriter(where,true);
    file.append(str.toString());
    
    file.close();
    %>
    <!-- https://ddo-o.tistory.com/76 -->
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%=str %>
</body>
</html>
