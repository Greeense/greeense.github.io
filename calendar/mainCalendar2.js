 /* select year or restday */
let yearListBox = document.querySelector("#menubar_year_list");
let restdayListBox = document.querySelector("#menubar_restday_list");
let restday_select = document.querySelector("#restday_select");
let yearList = document.querySelectorAll(".year_list");
let restdayList = document.querySelectorAll(".restday_list");

// day date setting
var date = new Date(); //(로컬기준)현재 날짜 가져오기
var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); //utc 표준시 도달
var kstGap = 9 * 60 * 60 * 1000; //한국 kst 기준 시간 더하기
var today = new Date(utc+kstGap); //한국 시간 기준 오늘해당 date객체만들기
var thisTime = new Date(today.getFullYear(), today.getMonth(), today.getDate());
var currentYear = thisTime.getFullYear();
var currentMonth = thisTime.getMonth();
var currentDate = thisTime.getDate();

var year;
var month;
var num;
init();

//yearList  restDayList setting
year_select.addEventListener('click',function(){
	yearListShow();
})

restday_select.addEventListener('click',function(){
	restdayListShow();
})

for(const yearList_list of yearList) {
	yearList_list.addEventListener('click',function(e){
		console.log(yearList_list.innerHTML);
		yearListShow();
		year_select.innerHTML = yearList_list.innerHTML;
		var selected_yeaer = year_select.innerHTML;
		yearListSelect(selected_yeaer);
	})
}
for(const restday_list of restdayList) {
	restday_list.addEventListener('click',function(e){
		console.log(restday_list.innerHTML);
		restdayListShow();
		restday_select.innerHTML = restday_list.innerHTML;
	})
}
	
function yearListShow(){	
	yearList.forEach(yearList=>{
		yearList.style.display = ((yearList.style.display !='block')? 'block' : 'none');
		console.log(">> year Select : "+yearList.style.display);
	})
}
function restdayListShow(){
	restdayList.forEach(restdayList=>{
		restdayList.style.display = ((restdayList.style.display !='block')? 'block' : 'none');
		console.log(">> restday Select : "+restdayList.style.display);
	})
}

function yearListSelect(selected_yeaer){
	yearList.forEach(yearList=>{
		console.log("yearListSelect");
		NextrenderCalendar(selected_yeaer,1,1);
	})
}

//새로고침시 바로 실행 함수
function init(){
	console.log("init");		
	// year_list setting
	var list = document.querySelectorAll(".year_list");
	console.log("year set : "+currentYear);
	year_select.innerHTML = currentYear;
	var i=0;
	list.forEach(list=>{		
		list.innerHTML = currentYear + i;
		i++;
	})	
	var body = document.querySelector('body');
	//calendar setting	
	console.log("thisTime : "+thisTime);
	year = currentYear;
	month = currentMonth+1;
	num = 1;
	renderCalendar();  //이번달 달력
	for(var i=(month+1);i<=12;i++){
		NextrenderCalendar(year,i,num);//다음달력
		num++;
	}
}

function renderCalendar(){  
	console.log("redner..."+year+ "  " + month);
	
	
    // 이번 달의 마지막날 날짜와 요일 구하기
    var endDay = new Date(year, month, 0); //0431
    var nextDate = endDay.getDate();  //31
    //오늘
    var today = new Date(utc+kstGap); //0416
    var todayDate = today.getDate(); //16
    var todayMonth = today.getMonth()+1; //04
    
    //이번달 일 정리
	var calendar_date1 = document.querySelector('.calendar_date1');
	//이번달 요일 정리
	var calendar_date2 = document.querySelector('.calendar_date2');
	var dayList = ['일','월','화','수','목','금','토'];
	//이번달 내용 정리
	var calendar_content = document.querySelector('.calendar_content');
	
    //이번달 연휴 달력그리기
    console.log("month : "+month+" ; todayMonth : "+todayMonth);
	for (var i = todayDate; i <= nextDate; i++) {
		var writeDay = new Date(year+"-"+month+"-"+i).getDay();
	
	   	if(writeDay==6 || writeDay==0){  //토욜 일욜
			calendar_date1.innerHTML = calendar_date1.innerHTML + '<span class="calendar_part_text WEEKEND">'+month+'월 '+ i +'일</div>';
			calendar_date2.innerHTML = calendar_date2.innerHTML + '<span class="calendar_part_text WEEKEND">'+dayList[writeDay]+'</div>';
			calendar_content.innerHTML = calendar_content.innerHTML + '<span class="calendar_part_text WEEKEND"> </div>';
		}
	}
	
    
}

function NextrenderCalendar(year, month, num){  
	console.log("redner..."+year+ "  " + month);
	
    // 이번 달의 마지막날 날짜와 요일 구하기
    var endDay = new Date(year, month, 0); //0431
    var nextDate = endDay.getDate();  //31
    
	var dayList = ['일','월','화','수','목','금','토'];
	//새 calendarpart 그리기
	var new_calendar_part = document.createElement('div');
	new_calendar_part.id = 'calendar_part'+num;
	new_calendar_part.className = 'calendar_part';
	var new_calendar_date1 = document.createElement('div');
	new_calendar_date1.classList.add('calendar_date1');
	new_calendar_date1.classList.add('calendar_date1_'+num);
	var new_calendar_date2 = document.createElement('div');
	new_calendar_date2.classList.add('calendar_date2');
	new_calendar_date2.classList.add('calendar_date2_'+num);
	var new_calendar_content = document.createElement('div');
	new_calendar_content.classList.add('calendar_content');
	new_calendar_content.classList.add('calendar_content_'+num);
	
	document.body.appendChild(new_calendar_part);
	document.getElementById('calendar_part'+num).appendChild(new_calendar_date1);
	document.getElementById('calendar_part'+num).appendChild(new_calendar_date2);
    document.getElementById('calendar_part'+num).appendChild(new_calendar_content);
    
    
	var calender_date1 = document.querySelector('.calendar_date1_'+num);
	console.log("calender_date1     :     "+calender_date1.innerHTML);
	var calender_date2 = document.querySelector('.calendar_date2_'+num);
	var calender_content = document.querySelector('.calendar_content_'+num);
	
	for (var i = 1; i <= nextDate; i++) {
		
		var writeDay = new Date(year+"-"+month+"-"+i).getDay();

       	if(writeDay==6 || writeDay==0){  //토욜 일욜
       		
			calender_date1.innerHTML = calender_date1.innerHTML + '<span class="calendar_part_text WEEKEND">'+month+'월 '+ i +'일</div>';
			calender_date2.innerHTML = calender_date2.innerHTML + '<span class="calendar_part_text WEEKEND">'+dayList[writeDay]+'</div>';
			calender_content.innerHTML = calender_content.innerHTML + '<span class="calendar_part_text WEEKEND"> </div>';
      	}		
    }
    
}

function restDayset(){
	//공휴일
    var solarHoildays = ["01-01","03-01","05-05","06-06","07-17","08-15","10-03","12-25"];
    var lunaHoildays = ["01-01","01-02","04-08","08-14","08-15","0816"];
    var setlunaTosolar = [];      
}