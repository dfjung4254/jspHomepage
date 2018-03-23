<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id = "dao" class = "home.book.BookDAO"/>
<jsp:useBean id = "dto" class = "home.book.BookDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%

if(dto.getName() == null || dto.getPublisher() == null || dto.getWriter() == null ||
		dto.getName().trim().equals("") || dto.getPublisher().trim().equals("") || dto.getWriter().trim().equals("")
	){
	%>
	
	<script type = "text/javascript">
		alert("목록을 모두 작성하십시오.");
		history.back();
	</script>
	
	<%
	return;
}

boolean isAdd = dao.addList(dto);

if(isAdd){
	%>
	<script type="text/javascript">
		alert("도서등록 성공");
		location.href = "list.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("도서등록 실패");
		location.href = "index.jsp";
	</script>
	<%
}


%>