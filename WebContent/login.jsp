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
						System.out.println("��Ű�߰� : "+memId);
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
					<input class = "check" type = "checkbox" name="memorizeId" value="memorizeId">���̵� ���
					<input class = "btnSmall" type = "button" value = "IDã��">
					<input class = "btnSmall" type = "button" value = "PWã��">
				</div>
				<div class = "button" >
					<input type = "submit" value = "�α���">
					<input type = "button" value = "ȸ������" onclick="javascript:open_member_check()">
				</div>
			</div>
		</form>
	</div>
<%@ include file = "bottom.jsp" %>