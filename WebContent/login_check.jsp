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
		alert("로그인성공!");
		location.href = "index.jsp";
	</script>
	
	<%
}else{
	%>
	
	<script type="text/javascript">
		alert("로그인실패! 아이디와 패스워드를확인하세요.");
		location.href = "login.jsp";
	</script>
	
	<%
}

%>