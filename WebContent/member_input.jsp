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
		alert("id�� �̹� �����մϴ�!");
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
		
			alert("ȸ������ ����!");
			location.href="login.jsp";
		
		</script>
	
	<%
}else{
	%>
	
		<script type="text/javascript">
		
			alert("ȸ������ ����!");
			history.back();
		
		</script>
	
	<%
}

%>