<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

session.invalidate();

%>
<script type="text/javascript">
	alert("로그아웃되었습니다");
	location.href = "index.jsp";
</script>