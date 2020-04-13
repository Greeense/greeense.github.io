<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
	#test1 {
		border: 2px solid orange;
		width:50px;
		height:50px;
	}
	#test2 {
		border: 2px solid orange;	
		width:50px;
		height:50px;
	}
</style>
</head>
<body>
	<div id="test1" class="test"></div>
	<div id="test2" class="test"></div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('.test').mouseover(function(){
			$('.test').css('border','2px solid red');
		}).mouseout(function(){
			$('.test.').css('border','2px solid orange');
		});
		
		$('.test').mousedown(function(){
			$('.test').css('border','2px solid pink');
		}).mouseup(function(){
			$('.test.').css('border','2px solid orange');
		});
	});
	

</script>
</html>