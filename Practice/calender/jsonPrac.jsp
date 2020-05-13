<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
#table{
	border-bottom:1px dashed black;
}
.eventTitle {
	color:red;
}
#TableT tr {
	border:1px solid black;
}

#TableT td {
	broder:1px solid black;
}
</style>
</head>
<body>
	<table id="TableT">
		<tr> 
			<td id="table"> T A B L E </td>
		</tr>
		<tr id="tableTR">
			
		</tr>
	</table>
	
	<table id="inputTable">
		<tr>
			<td>제목<input type="text"/></td>
		</tr>
	</table>
	<script type="text/javascript">
	var data = {
		event : [
			{
				title : "여행",
				start : "2020-04-08",
				color : "red"
			},
			{
				title : "휴가",
				start : "2020-04-09",
				color : "blue"
			}
		]			
	}	
	
	//인터넷 익스플로도 고려...
	//부트스트랩 : 상업적이용가능	
	
	
	/*function output() {		
		for(var i=0;i<Object.keys(data['event']).length;i++){
			var eventTitle = document.createElement("td");
			var tableTR = document.getElementById('tableTR');
			tableTR.setAttribute('class','eventSub');
			tableTR.appendChild(eventTitle);		
			eventTitle.setAttribute('class','eventTitle');
			eventTitle.setAttribute('id','')
			var eventTitleText = document.getElementsByClassName('eventTitle');
			eventTitleText[i].innerHTML = data['event'][i]['title'];
		}
	}*/

	//output();
</script>
</body>
</html>