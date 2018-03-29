<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String memorizeId = request.getParameter("memorizeId");

if(memorizeId == null || memorizeId.trim().equals("")){
	//���̵��� ��üũ
	Cookie[] cks = request.getCookies();
	for(int i = 0; i < cks.length; i++){
		if(cks[i].getName().equals("memorizeId")){
			cks[i].setMaxAge(0);
			response.addCookie(cks[i]);
		}
	}
}else if(memorizeId.equals("memorizeId")){
	//���̵��� üũ
	Cookie ck = new Cookie("memorizeId", id);
	ck.setMaxAge(60*60*24);
	response.addCookie(ck);
}

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