<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>JKH �� Ȩ�������Դϴ�</title>
	<link rel = "stylesheet" type = "text/css" href = "style.css?ver=1">
	
	<script type="text/javascript">
		function open_member_check(){
			window.name = "mainWindow";
			window.open("member/member_check.jsp", "member", "width=500, height=300, resizable=no, left=600, top=300");
		}
	</script>
	
</head>

<body>

	<div align = "center" vertical-align = "middle">
			<table  class = "main" width = "800" height = "600">
				<tr height = "5%">
					<td colspan = "2" align = "center">
					<menu>
					<a href = "<%=request.getContextPath() %>/index.jsp">MAIN</a> | 
					<a href = "<%=request.getContextPath() %>/login.jsp">LOGIN</a> | 
					<a href = "javascript:open_member_check()">MEMBER</a> | 
					<a href = "<%=request.getContextPath() %>/board.jsp">BOARD</a> | 
					<a href = "<%=request.getContextPath() %>/intro.jsp">INTRO</a>
					</menu>
					</td>
				</tr>
			<tr>