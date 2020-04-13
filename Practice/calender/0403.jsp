<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	//json으로 일정추가/수정/삭제
	var data = {
		event : [
			{
				number: '1',
				title : "여행",
				start : "2020-04-01",
				color : "red"
			},
			{
				number: '2',
				title : "휴가",
				start : "2020-04-25",
				color : "blue"
			}			
		]
	}
	//button id="" onclick="" <--이렇게하지말고 다 분리하기
	var today = new Date();
   
	//저번달
	function prevCalendar() { //javascript함수
		today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		makeCalendar();
	}
	//다음달
	function nextCalendar() {
		today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		makeCalendar();
	}
	//오늘날짜로가기-> 오늘날짜 칸 찾기
	function goToday() {
		today = new Date();
		makeCalendar();  
		var todayDate = document.getElementsByClassName('date');
		var todayDateTodo = document.getElementsByClassName('dateTodo');
		var cnt=0;//hidden 칸의 갯수
		for(var i=1;i<todayDate.length;i++){
			if(todayDate[i].style.visibility == "hidden"){
				cnt++;
			}
			if(i==today.getDate()){
				var moveCell = cnt+i;
				todayDate[moveCell].setAttribute('id','todayDate');
				todayDateTodo[i-1].setAttribute('id','todayDateTodo');
			}
		}
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
				
		//이벤트 보여주기
		var eventLength = Object.keys(data['event']).length;
		/*for(var i=0;i<eventLength;i++){
			 
		}
		*/
	}
	
	function mouseEvent(){
		var dateBox = document.getElementsByClassName("dateTodo");
		dateBox.onmouseover = function(){
			dateBox.style.color = "#FFF5BE";
		}
		
	}
	//$(function(){ //jquery함수
	//	$("#selectable").selectable();
	//});
</script>
<style type="text/css">
#event{
	border:1px solid #F9D78A;
	border-bottom:1px dashed white;
}
#todayDate{
	background-color:#FFF5BE;
	border:1px solid #F9D78A;
	border-bottom:1px dashed white;
}
#todayDateTodo{
	background-color:#FFF5BE;
	border:1px solid #F9D78A;
	border-top:0px solid white;
}
.week>.date:nth-child(1) {
	color:red;
	background-color:#FBB1BE;
}
.week>.date:nth-child(7) {
	color:red;
	background-color:#FBB1BE;
}
.weekTodo>.dateTodo:nth-child(1) {
background-color:#E4DCDE;
}
.weekTodo>.dateTodo:nth-child(7) {
background-color:#E4DCDE;
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
	border-bottom:2px solid white;
}
#DayContainer{
	width:auto;
	height:auto;
	border:1px solid white;
}
#DayContainerTbl {
	border-collapse: collapse;
	width:auto;
	height:auto;
	background-color:#F5F5F5;
	
}
.week >td{
	width:101px;
	height:20px;
	background-color:white;
}
.weekTodo >td{
	width:101px;
	height:80px;
	border-top:1px dashed #FB9C87;
	background-color:#F5F5F5;
}

</style>
</head>
<body onload="mouseEvent()" >
	<div id = "Header">
		<table id="HeaderTbl">
			<tr>
			<td><button id="prev" onclick="prevCalendar()"> < </button></td>
			<td id="YM" align="center" colspan="5"> yyyy년 MM월 </td>
			<td><button id="next" onclick="nextCalendar()"> > </button></td>
			<td><button id="goToday" onclick="goToday()">Today</button></td>
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
				<table id="DayContainerTbl">
					<tbody align="center">
						<!-- JSP로 날짜채움 -->
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
	makeCalendar();
	goToday();
	</script>
</body>
</html>