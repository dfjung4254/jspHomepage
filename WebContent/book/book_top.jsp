<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

String id = (String)session.getAttribute("id");
if(id == null || id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("먼저 로그인을 하십시오");
		location.href = "../login.jsp";
	</script>
	<%
}

%>
<html>
<head>
	<title>도서등록 페이지</title>
	<link rel = "stylesheet" type = "text/css" href = "style.css?ver=1">
</head>

<body>
	<div align = "center">
		<div style = "width:850px;border-left:1px solid gray;border-right:1px solid gray;">
			<div style = "display:table-row;">
				<div style = "display:table-cell;background-color:lightpink;width:800px;height:40px;border-top:1px dotted black;border-bottom:1px dotted black;vertical-align:middle;padding-top:10px;padding-bottom:10px;word-spacing:30px;">
					<a href="../index.jsp">메인으로</a>
					<a href="insert.jsp">도서등록</a>
					<a href="list.jsp">도서보기</a>
					<a href="search.jsp">도서검색</a>
					<a href="delete.jsp">도서삭제</a>
					<a href="change.jsp">도서수정</a>
				</div>
			</div>
			<div style = "display:table-row;">
				<div style = "display:table-cell;width:800px;padding-top:30px;padding-bottom:30px;border-bottom:1px dotted black;vertical-align:middle;">
					<!-- main Image -->
					<img src = "../image/security.PNG">
				</div>
			</div>
			<div style = "display:table-row;">
				<div style = "display:table-cell;width:800px;height:10px;border-bottom:1px dotted black;vertical-align:middle;padding-right:10px;text-align:right;">
					VER 1.0
				</div>
			</div>
			<div style = "display:table-row;">
				<div align = "center" style = "display:table-cell;width:800px;border-bottom:1px solid gray;vertical-align:middle;padding:10px;text-align:center;">