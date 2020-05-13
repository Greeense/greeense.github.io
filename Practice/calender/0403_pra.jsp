<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>table practice</title>
<style type="text/css">

td {
	border:1px solid black;
	width:100px;
	height:30px;
}
th {
	border:1px solid black;
	width:100px;
	height:30px;
}
.date {
	border:1px solid blue;
}
.todo {
	border:1px solid red;
}
</style>
<script type="text/javascript">
	function makeCalendar(){
		var tbody = document.getElementById("table");
		var row1=tbody.insertRow(tbody.rows.length-1);
		var cnt  = 0;
		
		row1.setAttribute('class','date');
		var row2=tbody.insertRow(tbody.rows.length-2);
		row2.setAttribute('class','todo');
		for(var i=0;i<7;i++){
			var cell1 = row1.insertCell();
			cell1.innerHTML = "dd";
			var cell2 = row2.insertCell();
			cell2.innerHTML = "cc";
			
			cnt+=1;
			
			if(cnt%7==0){
				var row3=tbody.insertRow(tbody.rows.length-3);
				row3.setAttribute('class','date2');
				var row4=tbody.insertRow(tbody.rows.length-4);
				row4.setAttribute('class','todo2');
			}
			
		}
		
	}
</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>1</th>
				<th>2</th>
				<th>3</th>
				<th>4</th>
				<th>5</th>
				<th>6</th>
				<th>7</th>
			</tr>
		</thead>
		<tbody id="table">
			
		</tbody>
	</table>	
	<script>makeCalendar();</script>
</body>
</html>