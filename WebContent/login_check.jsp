<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String memorizeId = request.getParameter("memorizeId");

if(memorizeId == null || memorizeId.trim().equals("")){
	//아이디기억 미체크
	Cookie[] cks = request.getCookies();
	for(int i = 0; i < cks.length; i++){
		if(cks[i].getName().equals("memorizeId")){
			cks[i].setMaxAge(0);
			response.addCookie(cks[i]);
		}
	}
}else if(memorizeId.equals("memorizeId")){
	//아이디기억 체크
	Cookie ck = new Cookie("memorizeId", id);
	ck.setMaxAge(60*60*24);
	response.addCookie(ck);
}

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