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
		alert("����� ��� �ۼ��Ͻʽÿ�.");
		history.back();
	</script>
	
	<%
	return;
}

boolean isAdd = dao.addList(dto);

if(isAdd){
	%>
	<script type="text/javascript">
		alert("������� ����");
		location.href = "list.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("������� ����");
		location.href = "index.jsp";
	</script>
	<%
}


%>