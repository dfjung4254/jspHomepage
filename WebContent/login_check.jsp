<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

boolean isMember = dao.checkId(id, passwd);

if(isMember){
	
	session.setAttribute("id", id);
	
	%>
	
	<script type="text/javascript">
		alert("�α��μ���!");
		location.href = "index.jsp";
	</script>
	
	<%
}else{
	%>
	
	<script type="text/javascript">
		alert("�α��ν���! ���̵�� �н����带Ȯ���ϼ���.");
		location.href = "login.jsp";
	</script>
	
	<%
}

%>