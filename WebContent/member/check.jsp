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
		alert("����� ����� �Է����ּ���");
		history.back();
	</script>
	<%
	return;
}

boolean isMember = dao.checkMember(name, ssn1, ssn2);

if(isMember){
	%>
	
	<script type="text/javascript">
		alert("�̹� �����Ͻ� ���̵� �ֽ��ϴ�");
		history.back(); // �����ؾ���.
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
		alert("ȸ�������� �����մϴ�"); 
		document.memberInfo.submit();
		self.close();
	</script>
	<%
}

%>
