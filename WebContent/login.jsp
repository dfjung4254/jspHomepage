<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "top.jsp" %>
<%@ include file = "subMenu.jsp" %>
	<div align = "center">
		<h1> L O G I N </h1>
		<form name="login" method="post" action="login_check.jsp">
			<div class = "container">
				<div class = "row">
				<%
				String memId = "";
				Cookie[] cks = request.getCookies();
				for(int i = 0; i < cks.length; i++){
					if(cks[i].getName().equals("memorizeId")){
						memId = cks[i].getValue();
						System.out.println("쿠키발견 : "+memId);
					}
				}
				if(memId == null || memId.trim().equals("")){
					%>
					I D <input style="background-color:black;border:1px solid white;color:white;"type = "text" name="id" value="">
					<%
				}else{
					%>
					I D <input style="background-color:black;border:1px solid white;color:white;"type = "text" name="id" value="<%= memId %>">
					<%
				}
				
				%>
					
				</div>
				<div class = "row">
					PW <input style="background-color:black;border:1px solid white;color:white;" type = "password" name="passwd" value="">
				</div>
				<div class = "checkmain">
					<input class = "check" type = "checkbox" name="memorizeId" value="memorizeId">아이디 기억
					<input class = "btnSmall" type = "button" value = "ID찾기">
					<input class = "btnSmall" type = "button" value = "PW찾기">
				</div>
				<div class = "button" >
					<input type = "submit" value = "로그인">
					<input type = "button" value = "회원가입" onclick="javascript:open_member_check()">
				</div>
			</div>
		</form>
	</div>
<%@ include file = "bottom.jsp" %>