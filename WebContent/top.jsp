<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>JKH �� Ȩ�������Դϴ�</title>
	<link rel = "stylesheet" type = "text/css" href = "<%=request.getContextPath() %>/style.css?ver=1">
	
	<script type="text/javascript">
		function open_member_check(){
			window.name = "mainWindow";
			window.open("<%=request.getContextPath() %>/member/member_check.jsp", "member", "width=500, height=300, resizable=no, left=600, top=300");
		}
		function member_delete(num){
			if(confirm("���� �����Ͻðڽ��ϱ�??")){
				location.href = "admin_memberDelete.jsp?no="+num;
			}
			
		}
		function onUpdate(){
			if(confirm("�����Ͻðڽ��ϱ�?")){
				document.updateMember.submit();
			}
		}
		function delConfirm(num){
			if(confirm("���� �����Ͻðڽ��ϱ�??")){
				location.href = "board_delete.jsp?no="+num;
			}
		}
		function updateCheck(){
			if(confirm("�����Ͻðڽ��ϱ�??")){
				document.board_update.submit();
			}
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
					<%
					
					String id = (String)session.getAttribute("id");
					if(id == null || id.trim().equals("")){
						%>
						<a href = "<%=request.getContextPath() %>/login.jsp">LOGIN</a> | 
						<a href = "javascript:open_member_check()">MEMBER</a> | 
						<%
					}else{
						%>
						<a href = "<%=request.getContextPath() %>/logout.jsp">LOGOUT</a> |
						<a href = "<%=request.getContextPath() %>/admin_memberUpdate.jsp?id=<%= id %>">MYPAGE</a> |
						<%
					}
					%>
					<a href = "<%=request.getContextPath() %>/hyper_board/board_list.jsp?page=1">BOARD</a> | 
					<a href = "<%=request.getContextPath() %>/intro.jsp">INTRO</a>
					</menu>
					</td>
				</tr>
			<tr>