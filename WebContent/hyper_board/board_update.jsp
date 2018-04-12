<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%@ include file="../subMenu.jsp" %>
<%
//세션 체크
request.setCharacterEncoding("EUC-KR");



//login check
if(id==null || id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("로그인을 해주세요");
		location.href="../login.jsp";
	</script>
	<%
}

//login_id == writer_id CHECK

%>
<!-- 아웃라인 구성 -->

<%@ include file="../bottom.jsp" %>