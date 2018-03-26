<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "home.member.MemberDTO, java.util.ArrayList" %>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<!-- admin_member.jsp -->
<%@ include file = "top.jsp" %>
<%@ include file = "subMenu.jsp" %>
<%
request.setCharacterEncoding("EUC-KR");
int no = Integer.parseInt(request.getParameter("no"));

ArrayList <MemberDTO> dto = dao.newMemberList(no);

%>
	<div align = "center" style = "width:100%; height:450; overflow:auto;
	scrollbar-face-color:black;scrollbar-highlight-color:white;scrollbar-track-color:black;">
		<div style="margin-bottom:20px;margin-top:80px;letter-spacing:0.2em;font-family:돋움;font-size:14pt;">관리자 회원정보수정</div>
		<form name="updateMember" method="post" action="admin_memberUpdateCheck.jsp">
		<div style="display:table;width:500px;font-size:9pt;">
			<div style="display:table-row">
				<div style="display:table-cell;padding:5px;border-left:2px solid tomato;width:100px">NO</div>
				<div style="display:table-cell;padding:5px;border:0px solid tomato;">
					<input style="text-align:center;height:20;width:50;background-color:black;color:white;
					border-bottom:0px solid gray;border-top:0;border-left:0;border-right:0"
					name="no" type="text" value="<%=dto.get(0).getNo() %>" readOnly>
				</div>
			</div>
			<div style="display:table-row">
				<div style="display:table-cell;padding:5px;border-left:2px solid tomato;">ID</div>
				<div style="display:table-cell;padding:5px;border:0px solid tomato;">
					<input style="text-align:center;height:20;width:100;background-color:black;color:white;
					border-bottom:0px solid gray;border-top:0;border-left:0;border-right:0"
					name="id" type="text" value="<%=dto.get(0).getId() %>" readOnly>
				</div>
			</div>
			<div style="display:table-row">
				<div style="display:table-cell;padding:5px;border-left:2px solid tomato;">NAME</div>
				<div style="display:table-cell;padding:5px;border:0px solid tomato;">
					<input style="text-align:center;height:20;width:100;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0"
					name="name" type="text" value="<%=dto.get(0).getName() %>">
				</div>
			</div>
			<div style="display:table-row">
				<div style="display:table-cell;padding:5px;border-left:2px solid tomato;">SSN</div>
				<div style="display:table-cell;padding:5px;border:0px solid tomato;">
					<input style="text-align:center;height:20;width:100;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0" 
					maxlength="6" name="ssn1" type="text" value="<%=dto.get(0).getSsn1() %>"> - <input style="text-align:center;height:20;width:100;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0"
					maxlength="7" name="ssn2" type="text" value="<%=dto.get(0).getSsn2() %>">
				</div>
			</div>
			<div style="display:table-row">
				<div style="display:table-cell;padding:5px;border-left:2px solid tomato;">EMAIL</div>
				<div style="display:table-cell;padding:5px;border:0px solid tomato;">
					<input style="text-align:center;height:20;width:200;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0"
					name="email" type="text" value="<%=dto.get(0).getEmail() %>">
				</div>
			</div>
			<div style="display:table-row">
				<div style="display:table-cell;padding:5px;border-left:2px solid tomato;">HP</div>
				<div style="display:table-cell;padding:5px;border:0px solid tomato;">
					<input style="text-align:center;height:20;width:80;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0"
					maxlength="3" name="hp1" type="text" value="<%=dto.get(0).getHp1() %>"> - <input style="text-align:center;height:20;width:80;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0"
					maxlength="4" name="hp2" type="text" value="<%=dto.get(0).getHp2() %>"> - <input style="text-align:center;height:20;width:80;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0"
					maxlength="4" name="hp3" type="text" value="<%=dto.get(0).getHp3() %>">
				</div>
			</div>
			<div style="display:table-row">
				<div style="display:table-cell;padding:5px;border-left:2px solid tomato;">PASSWD</div>
				<div style="display:table-cell;padding:5px;border:0px solid tomato;">
					<input style="text-align:center;height:20;width:120;background-color:black;color:white;
					border-bottom:1px solid gray;border-top:0;border-left:0;border-right:0"
					name="passwd" type="text" value="<%=dto.get(0).getPasswd() %>">
				</div>
			</div>
		</div>
		<div style="margin-top:30px;">
			<input style="margin-right:10px;background-color:black;border:1px solid white;color:white;" type="button" value="수정" onclick="javascript:onUpdate()">
			<input style="background-color:black;border:1px solid white;color:white;" type="button" value="취소" onclick="location.href='admin_member.jsp'">
		</div>
		</form>
	</div>
<%@ include file = "bottom.jsp" %>