<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 쓰기 좋은 날</title>
</head>
<style>
 @import url("css/calendar.css");
</style>
<script>

window.onload = function() {
	drawCalendar();
}
</script>
<script src="jquery-3.6.0.min.js"></script>
<script src="mainCalendar.js" defer></script>

<body>
	<div id="div_title">
		<p><span style="color:#5F5F5F; font-weight:bold;">어떤 날 쉬면 알차게 쉴 수 있을까요?</span>
		<span style="font-weight:bolder; font-size:20pt; color:#166C4D;">연차쓰기 딱 좋은 날</span>
		<span style="color:#5F5F5F; font-weight:bold;">을 추천해드려요!</span></p>
	</div>
	
	<div id="div_subtitle">
		<div id="dropBox-year">
			<div id="div_subtitle_text">
				<span style="color:#5F5F5F; font-weight:bold; font-size:10pt">몇 개의 연차를 쓰실 계획이신가요?&nbsp;</span>
			</div>
			<div class="div_btn_day">
				<input type="button" class="btn_day" id="1day" name="1day" value="1일"></input>
				<input type="button" class="btn_day" id="2day" name="2day" value="2일"></input>
				<input type="button" class="btn_day" id="3day" name="3day" value="3일"></input>
				<input type="button" class="btn_day" id="4day" name="4day" value="4일"></input>
			</div>	
		</div>
	</div>
	
	<div id="div_calendar_toolbar">
		<input type="button" id="month_button_back" class="month_button" value='<'></input>
		<div id="div_calendar_toolbar_text">
			<div id="yearTextInput" class="dropBox-year-item-selected"></div>
			<span id="yearText" style="font-size:30px">년</span>
			<div id="monthTextInput" class="dropBox-year-item-selected"></div>
			<span id="monthText" style="font-size:30px">월</span>
		</div>
		<input type="button" id="month_button_next" class="month_button" value=">"></input>
		<ul id="dropBox-year-itemList">
			<li class="dropBox-year-item">1</li>
			<li class="dropBox-year-item">2</li>
			<li class="dropBox-year-item">3</li>
			<li class="dropBox-year-item">4</li>
			<li class="dropBox-year-item">5</li>
		</ul>		
	</div>
	
	<div id="div_calendar">
		<div id="table_calendar">
			<div id="calendar_wrap1">				
				<div class="weekday" id="Mon">MON</div>
				<div class="weekday" id="Tue">TUE</div>
				<div class="weekday" id="Wed">WED</div>
				<div class="weekday" id="Thu">THU</div>
				<div class="weekday" id="Fri">FRI</div>
				<div class="weekday" id="Sat">SAT</div>
				<div class="weekday" id="Sun">SUN</div>		
			</div>
			<div class="date">
			</div>	
		</div>
		
	</div>	
</body>
</html>