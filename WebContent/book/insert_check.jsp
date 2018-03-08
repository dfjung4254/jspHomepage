<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String publisher = request.getParameter("publisher");
	String writer = request.getParameter("writer");
	String price = request.getParameter("price");
	if(name == null || publisher == null || writer == null || price == null ||
			name.trim().equals("") || publisher.trim().equals("") || writer.trim().equals("")
			|| price.trim().equals("")){
		%>
		
		<script type = "text/javascript">
			alert("목록을 모두 작성하십시오.");
			history.back();
		</script>
		
		<%
		return;
	}
	
%>