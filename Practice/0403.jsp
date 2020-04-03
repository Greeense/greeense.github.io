<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var today = new Date();

	//저번달
	function prevCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		makeCalendar();
	}
	//다음달
	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		makeCalendar();
	}
	//오늘날짜로가기
	function goToday() {
		today = new Date();
		alert(today.getMonth());
		makeCalendar();
	}
	//달력생성
	function makeCalendar(){
		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);//1
		var lastDate =  new Date(today.getFullYear(), today.getMonth()+1, 0);//30
		var day = today.getDay();
		var textYM = document.getElementById("YM");
		var DayContainerTbl = document.getElementById("DayContainerTbl");
		textYM.innerHTML = today.getFullYear()+"년 "+(today.getMonth()+1)+"월";
				
		
		 //보고있는 달력 삭제(다음달로 넘기면 이전것은 사라져야한다)
		while(DayContainerTbl.rows.length > 0){
			DayContainerTbl.deleteRow(DayContainerTbl.rows.length  - 1);
		}
	
		var cnt = 0;
		var row1 = DayContainerTbl.insertRow(DayContainerTbl.rows.length);//1-1 0 첫번쨰
		row1.setAttribute('class','week');
		var row2 = DayContainerTbl.insertRow(DayContainerTbl.rows.length);//
		row2.setAttribute('class','weekTodo');
		
		//1일 시작 칸 맞추기
		for(var i=0;i<firstDate.getDay();i++){
			var noDate = row1.insertCell();
			noDate.style.visibility = "hidden";
			noDate.setAttribute('class','date');
			var noTodo = row2.insertCell();
			noTodo.style.visibility = "hidden";
			cnt = cnt+1;
		}
		//1일부터 넣기
		for(var i=1;i<=lastDate.getDate();i++){
			var cell1 = row1.insertCell();
			cell1.innerHTML = i;
			cell1.setAttribute('class','date');
			var cell2 = row2.insertCell();
			cell2.innerHTML = " ";
			cell2.setAttribute('class','dateTodo');
			cnt += 1;			
			if(cnt%7 == 0){
				row1 = DayContainerTbl.insertRow(DayContainerTbl.rows.length); 
				row1.setAttribute('class','week');
				row2 = DayContainerTbl.insertRow(DayContainerTbl.rows.length); 
				row2.setAttribute('class','weekTodo');
			}
		}
	}
</script>
<style type="text/css">
.week>.date:nth-child(1) {
	color:red;
}
.week>.date:nth-child(7) {
	color:red;
}
#HeaderTbl { 
	border-collapse: collapse;
}
#DayHeaderTbl {
	border-collapse: collapse;
}
#DayHeaderTbl>thead>tr>th{
	width:101px;
	height:20px;
	background-color:lightgray;
}
#DayContainer{
	width:auto;
	height:auto;
}
#DayContainerTbl {
	border-collapse: collapse;
	width:auto;
	height:auto;
}
.week >td{
	width:100px;
	height:20px;
	border-bottom:1px solid black;
}
.weekTodo >td{
	width:100px;
	height:80px;
	border-top:1px solid black;
}
</style>
</head>
<body>
	<div id = "Header">
		<table id="HeaderTbl">
			<tr>
			<td><button onclick="prevCalendar()"> < </button></td>
			<td id="YM" align="center" colspan="5"> yyyy년 MM월 </td>
			<td><button onclick="nextCalendar()"> > </button></td>
			<td><button onclick="goToday">Today</button></td>
			</tr>
		</table>
	</div>
	<div id = "DayHeader">
		<table id = "DayHeaderTbl">
			<thead>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id = "MonthContainer">
		<div id = "WeekContainer">
			<div id = "DayContainer">
				<table id="DayContainerTbl"">
					<tbody align="right">
						<!-- JSP로 날짜채움 -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
	makeCalendar();
	</script>
</body>
</html>