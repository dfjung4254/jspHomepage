<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../top.jsp" %>
<%@ include file="../subMenu.jsp" %>
<%
//���� üũ
request.setCharacterEncoding("EUC-KR");



//login check
if(id==null || id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("�α����� ���ּ���");
		location.href="../login.jsp";
	</script>
	<%
}

//login_id == writer_id CHECK

%>
<!-- �ƿ����� ���� -->

<%@ include file="../bottom.jsp" %>