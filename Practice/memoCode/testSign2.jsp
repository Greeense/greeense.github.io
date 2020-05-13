<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String signVal = request.getParameter("signVal");
	String checkBox = request.getParameter("checkBox");
	String textVal = request.getParameter("textVal");

%>

<!DOCTYPE html>
<html style="margin:0;height:100%">
	<head>
		<meta charset="utf-8">
		<title>Crownix HTML5 Viewer</title>
		<script src="../js/jquery-1.11.0.min.js"></script>
		<script src="../js/crownix-viewer.storage.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../css/crownix-viewer.min.css">
	</head>
	<body style="margin:0;height:100%">
	<div id="crownix-viewer" style="position:absolute;width:100%;height:100%"></div>
	<script>
	var viewer;
	
	var submitIcon = {
				index : 17, 
				id : 'submit',
				svg : '<svg height="30px" width="30px" xmlns="http://www.w3.org/2000/svg" class="crownix-toolbar-icon-svg" focusable="false"><defs><style>.cls-1{fill:rgb(255, 255, 255) !important;stroke: transparent;}.cls-2{fill:rgb(11, 114, 255) !important;stroke: transparent;}</style></defs><rect class="cls-1" x="10.36" y="5.65" width="11" height="1"></rect><rect class="cls-1" x="6.43" y="8.39" width="15" height="1"></rect><rect class="cls-1" x="6.43" y="11.16" width="15" height="1"></rect><path class="cls-1" d="M651.26,499.89h-.57v-1.13a1.66,1.66,0,0,0-1.68-1.65h-19.8a1.67,1.67,0,0,0-1.68,1.65V512.1h1.23V498.76a.44.44,0,0,1,.45-.42H649a.44.44,0,0,1,.45.42V512.1h1.23v-11h.57a.41.41,0,0,1,.41.42V512.1h1.23V501.54A1.64,1.64,0,0,0,651.26,499.89Z" transform="translate(-625.22 -497.11)"></path><rect rx="2.03" height="15" width="30" y="15" class="cls-1"></rect><path class="cls-2" d="M633.48,517.29a5,5,0,0,0,2.11,4.39l-.68.86a4.69,4.69,0,0,1-2-2.8,5.08,5.08,0,0,1-2,3l-.71-.87a5.35,5.35,0,0,0,2.16-4.63v-.74h-1.83v-1h4.68v1h-1.71Zm2.48-2.65h1.11v9.66H636v-5.25h-1.52v-1H636Zm3.21-.2v10.35h-1.12V514.44Z" transform="translate(-625.22 -497.11)"></path><path class="cls-2" d="M646.16,519.84v.8h2.92v2.41h-5.89v.78h6.19v.88H642v-2.48h5.91v-.72H642v-.87h3v-.8H640.9V519h9.35v.89Zm-4.83-2.15c2-.11,3.31-.68,3.54-1.5h-3v-.88H645v-.91h1.18v.91h3.16v.88h-3.06c.23.82,1.52,1.39,3.53,1.5l-.32.89c-1.83-.13-3.25-.63-3.91-1.51-.65.88-2,1.38-3.89,1.51Z" transform="translate(-625.22 -497.11)"></path></svg>',
				title : '제출',
				separator : true,
				
				handler : function(e) {
					viewer.submit('http://localhost:8080/InfoTalkServer7/service', 'ds', 6006, '');
				}
			};

	window.onload = function(){
		viewer = new m2soft.crownix.Viewer('http://localhost:8080/ReportingServer7/service', 'crownix-viewer');
		
		viewer.openFile('sampleSign.mrd', '/rfn [sample.txt] /rformmode [2]',{formField : {readonly :true}});
		viewer.addToolbarItem(submitIcon); // 제출 버튼 툴바 생성

		alert('<%=textVal%>');

		viewer.bind('report-finished', function(){
				viewer.getForm('form1').get('sign1').setValue('<%=signVal%>');

				if('<%=checkBox%>' === '1')
				viewer.getForm('form1').get('checkBox1').setSelected(true);
				
				viewer.getForm('form1').get('textField1').setValue('<%=textVal%>');
		});
	};
	</script>
	</body>
</html>