<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<jsp:useBean id="dto" class="home.member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
int res = 0;
boolean isChecked = dao.checkDuplication(dto);
if(isChecked){
	%>
	<script type="text/javascript">
		alert("id가 이미 존재합니다!");
		history.back();
	</script>
	<%
	return;
}else{
	res = dao.newMembership(dto);
}


if(res>0){
	%>
	
		<script type="text/javascript">
		
			alert("회원가입 성공!");
			location.href="login.jsp";
		
		</script>
	
	<%
}else{
	%>
	
		<script type="text/javascript">
		
			alert("회원가입 실패!");
			history.back();
		
		</script>
	
	<%
}

%>