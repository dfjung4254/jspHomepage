<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "top.jsp" %>
<%@ include file = "subMenu.jsp" %>

<script type="text/javascript">

	function checkInfo(){
		if(membership.id.value == ""){
			alert("아이디를 입력하세요.");
			membership.id.focus();
			return;
		}else if(membership.passwd.value == ""){
			alert("비밀번호를 입력하세요.");
			membership.passwd.focus();
			return;
		}
		
		document.membership.submit();
		
	}

</script>

<%

	request.setCharacterEncoding("EUC-KR");
	
	String name = request.getParameter("name");
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
%>
	<div align = "center">
		<h1>MEMBERSHIP APLICATION</h1>
		<form name="membership" method="post" action="member_input.jsp">
		<div class = "member-container">
			<div class = "member-tr">
				<div class = "member-td">이름</div>	<div class = "member-td"><input name = "name" style="color:gray;" class = "member-input" type = "text" value=<%=name%> readonly></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">아이디</div>	<div class = "member-td"><input name = "id" class = "member-input" type = "text"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">비밀번호</div>	<div class = "member-td"><input name = "passwd" class = "member-input" type = "password"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">주민등록번호</div>	<div class = "member-td"><input name = "ssn1" style="color:gray;" class = "member-input2" type = "text" value="<%=ssn1%>" readonly> - <input name = "ssn2" style="color:gray;" class = "member-input2" type = "password" value="<%=ssn2%>" readonly></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">전화번호</div>	<div class = "member-td"><input name = "hp1" class = "member-input3" type = "text" maxlength="3"> - <input name = "hp2" class = "member-input3" type = "text" maxlength="4"> - <input name = "hp3" class = "member-input3" type = "text" maxlength="4"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">이메일</div>	<div class = "member-td"><input name = "email" class = "member-input" type = "text"></div>
			</div>
		</div>
		<div style = "margin-top:10px">
			<input type = "button" value = "가입" class = "member-btn" onclick = "javascript:checkInfo()"><input type = "reset" value = "취소" class = "member-btn">
		</div>
		</form>
	</div>
<%@ include file = "bottom.jsp" %>
