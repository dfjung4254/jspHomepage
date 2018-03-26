<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<jsp:useBean id="dto" class="home.member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%

int ret = dao.memberUpdate(dto);

if(ret > 0){
	%>
	
	<script type="text/javascript">
		alert("수정완료!");
		location.href = "admin_member.jsp";
	</script>
	
	<%
}else{
	%>
	
	<script type="text/javascript">
		alert("수정실패!");
		location.href = "admin_member.jsp";
	</script>
	
	<%
}

%>