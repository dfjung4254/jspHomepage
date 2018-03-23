<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

String name = request.getParameter("name");
String ssn1 = request.getParameter("ssn1");
String ssn2 = request.getParameter("ssn2");

boolean isCorrect = true;


if(name == null|| name.trim().equals("")|| ssn1 == null||ssn1.trim().equals("")||ssn2 == null||
	ssn2.trim().equals("")){
	isCorrect = false;
}else if(dao.isNumber(ssn1) == false|| dao.isNumber(ssn2) == false){
	isCorrect = false;
}

if(!isCorrect){
	%>
	
	<script type="text/javascript">
		alert("양식을 제대로 입력해주세요");
		history.back();
	</script>
	<%
	return;
}

boolean isMember = dao.checkMember(name, ssn1, ssn2);

if(isMember){
	%>
	
	<script type="text/javascript">
		alert("이미 가입하신 아이디가 있습니다");
		history.back(); // 수정해야함.
	</script>
	
	<%
}else{
	%>
	
	<form name="memberInfo" action="../member.jsp" method="post" target="mainWindow">
	<input type="hidden" name="name" value="<%=name%>"/>
	<input type="hidden" name="ssn1" value="<%=ssn1%>"/>
	<input type="hidden" name="ssn2" value="<%=ssn2%>"/>
	</form>
	
	<script type="text/javascript">
		alert("회원가입이 가능합니다"); 
		document.memberInfo.submit();
		self.close();
	</script>
	<%
}

%>
