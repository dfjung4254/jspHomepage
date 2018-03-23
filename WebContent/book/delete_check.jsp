<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "dao" class = "home.book.BookDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

String names[] = request.getParameterValues("check");

boolean isDel = dao.deleteList(names);

if(isDel){
	%>
	<script type = "text/javascript">
		alert("선택 삭제완료!");
		location.href = "list.jsp";
	</script>
	<%	
}else{
	%>
	<script type = "text/javascript">
		alert("선택 삭제 실패!");
		location.href = "delete.jsp";
	</script>
	<%
}
%>

