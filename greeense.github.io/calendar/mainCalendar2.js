 /* select year or restday */
let yearListBox = document.querySelector("#menubar_year_list");
let restdayListBox = document.querySelector("#menubar_restday_list");
let restday_select = document.querySelector("#restday_select");
let yearList = document.querySelectorAll(".year_list");
let restdayList = document.querySelectorAll(".restday_list");

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
	})
}
for(const restday_list of restdayList) {
	restday_list.addEventListener('click',function(e){
		console.log(restday_list.innerHTML);
		restdayListShow();
		restday_select.innerHTML = restday_list.innerHTML;
	})
}
init();
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

function init(){
	console.log("init");
	//날짜 정보 가져오기
	var date = new Date(); //(로컬기준)현재 날짜 가져오기
	var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); //utc 표준시 도달
	var kstGap = 9 * 60 * 60 * 1000; //한국 kst 기준 시간 더하기
	var today = new Date(utc+kstGap); //한국 시간 기준 오늘해당 date객체만들기
	
	var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	var currentYear = thisMonth.getFullYear();
	var currentMonth = thisMonth.getMonth();
	var currentDate = thisMonth.getDate();
	
	year_setting(currentYear);
}

function year_setting(currentYear){
	console.log("year set : "+currentYear);
	year_select.innerHTML = currentYear;
	for(var i=0;i<5;i++){
		const li = document.createElement("li");
		li.setAttribute('class','year_list');
		li.innerHTML = currentYear+i;
		yearListBox.appendChild(li);
		console.log(i);
	}	
}