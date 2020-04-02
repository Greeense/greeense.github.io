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
	
	//달력생성
	function makeCalendar(){
		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);//1
		var lastDate =  new Date(today.getFullYear(), today.getMonth()+1, 0);//30
		var day = today.getDay();
		var textYM = document.getElementById("YM");
		var tblCalendar = document.getElementById("calDate");
		textYM.innerHTML = today.getFullYear()+"년 "+(today.getMonth()+1)+"월";
		
		while($(".date").length>0){
				$(".date").remove();
		}
		
		for(var i=0;i<firstDate.getDay();i++){
			
		}
		/*
		//보고있는 달력 삭제(다음달로 넘기면 이전것은 사라져야한다)
		while(tblCalendar.rows.length > 0){
			tblCalendar.deleteRow(tblCalendar.rows.length  - 1);
		}
		
		var row = tblCalendar.insertRow(); //tr한단 생성
		var cnt = 0;
		
		//1일 시작 칸 맞추기
		for(var i=0;i<firstDate.getDay();i++){
			var cell = row.insertCell();
			cnt = cnt+1;
		}
		//1일부터 넣기
		for(var i=1;i<=lastDate.getDate();i++){
			cell = row.insertCell();
			cell.innerHTML = i;
			cnt = cnt+1;
			if(cnt%7 == 0){
				row = calDate.insertRow();
			}
			
		}
		*/
	}
</script>
<style type="text/css">
#HeaderTbl{
	border-collapes: collapse;
}
#DayHeaderTbl {
	border-collapes: collapse;
}
#DayHeaderTbl>thead>tr>th{
	width:102px;
	height:20px;
	background-color:lightgray;
}
#DayContainer {
	display:inline-block;
	border:1px solid red;
}
#DayContainerTbl{
	border-collapes: collapse;
	width:100px;
	border:1px solid black;
}
#date{

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
					<thead>
						<td class="date" align="right">dd</td>
					</thead>
					<tbody id="">
						
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
