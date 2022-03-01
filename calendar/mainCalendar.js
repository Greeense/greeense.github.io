/**
 * 
 */

var yearTextInput = document.querySelector("#yearTextInput");
var monthTextInput = document.querySelector("#monthTextInput");

var itemList = document.querySelector("#dropBox-year-itemList");
var item = document.querySelectorAll(".dropBox-year-item");

yearTextInput.addEventListener('click',showItemList);
monthTextInput.addEventListener('click',showItemList);

var month_button_back = document.querySelector("#month_button_back");
var month_button_next = document.querySelector("#month_button_next");

month_button_back.addEventListener('click',month_button_back_click);
month_button_next.addEventListener('click',month_button_next_click);

function showItemList() {
	console.log("yearItemSelected -- click");
	if(itemList.style.display=="none" || itemList.style.display==""){
		//연도 선택창 팝업 활성화
		itemList.style.display="block";
	}else if(itemList.style.display="block"){
		//연도 선택창 팝업 비활성화
		itemList.style.display="none";
	}
	ItemClick();
	
}

function ItemClick() {
	item.forEach(item=>{
		var innerValue = item.innerHTML;
		function changeValue() {
			itemListSelected.innerHTML = innerValue;
			itemList.style.display="none";	
		}
		item.addEventListener("click",changeValue);
	})
}

function month_button_back_click () {
	console.log("month_button_back  click");
	
}
function month_button_next_click () {
	console.log("month_button_next  click");
}


function drawCalendar() {
		
	//test--화면실행 시 바로 실행
	var monthValue = monthTextInput.innerHTML;
	var yearValue = yearTextInput.innerHTML;
	//alert("monthTextInput ; "+monthValue+"\n yearTextInput :"+yearValue);
	
	$.ajax({
		type : "POST",
		url : "http://localhost:8080/calendar/drawCalendar.jsp",
		data : {
			year : yearValue,
			month : monthValue
		},
		success : function(event){
			console.log("ajax ---> success");
		},
		fail : function(event){
			console.log("ajax ---> fail");
		}
	});	
	
	//draw calendar
	calendarInit();
}

function calendarInit() {

    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    // 달력에서 표기하는 날짜 객체
  
    
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    // kst 기준 현재시간
    // console.log(thisMonth);

    // 캘린더 렌더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.date')
        calendar.innerHTML = '';
        
        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate -1].classList.add('today');
        }
    }

    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
}