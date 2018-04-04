<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO" />
<%@ include file="top.jsp" %>
<%@ include file="subMenu.jsp" %>
<%
	String member_name = "";
	String member_email = "";
	String member_id = (String)session.getAttribute("id");
	if(member_id == null || member_id.trim().equals("")){
		//��α��λ���(��������)
		%>
		
		<script type="text/javascript">
			alert("�α����� ���� ���ּ���");
			location.href = "login.jsp";
		</script>
		
		<%
	}else{
		//�α��λ���(id�̿� ��������� �����;���)
		member_name = dao.getValue("id", member_id, "name");
		member_email = dao.getValue("id", member_id, "email");
	}
	
	

%>
	<div align="center" style = "margin-top:15px;width:100%; height:450;">
	<div style="font-size:20pt;font-family:consolas;color:skyblue;">NEW ARTICLE</div>
		<div style="padding-top:10px;margin-top:15px;width:550px;height:380px;border-top:1px solid gold;border-bottom:1px solid gold;">
			<form name="board_insert" method="post" action="board_insertCheck.jsp">
			<div style="display:table;width:550px;font-size:10pt;font-family:����;margin-top:5px;">
				<div style="display:table-row">
					<div style="display:table-cell;width:120px;border-right:1px dotted white;">
					�ۼ���
					</div>
					<div style="display:table-cell">
						<input type="text" name="name" value="<%=member_name %>" readOnly style="color:white;font-size:10pt;text-align:center;width:300px;background-color:black;border-bottom:1px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:����;margin-top:10px;">
				<div style="display:table-row">
					<div style="display:table-cell;width:120px;border-right:1px dotted white;">
					����
					</div>
					<div style="display:table-cell">
						<input type="text" name="title" style="color:white;font-size:10pt;padding-left:5px;width:300px;background-color:black;border:1px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:����;margin-top:10px;">
				<div style="display:table-row;padding-bottom:5px;">
					<div style="display:table-cell;border-bottom:1px solid gray;width:120px;">
					����
					</div>
					<div style="display:table-cell;border-bottom:1px solid gray;">
						<input type="text" disabled style="font-size:10pt;text-align:center;width:300px;background-color:black;border:0px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:����;margin-top:10px;">
				<div style="display:table-row">
					<div style="display:table-cell;padding-bottom:10px;border-bottom:1px solid gray;">
						<textarea name="contents" style="overflow:auto;
						scrollbar-face-color:black;scrollbar-highlight-color:white;
						scrollbar-track-color:black;width:500px;height:180px;
						background-color:black;color:white;border:1px solid white;padding:8px;font-size:10pt;
						font-family:����;" ></textarea>
					</div>
				</div>
			</div>
			<div style="display:table;width:550px;font-size:10pt;font-family:����;margin-top:10px;">
				<div style="display:table-row">
					<div style="display:table-cell;width:120px;border-right:1px dotted white;">
					�̸���
					</div>
					<div style="display:table-cell">
						<input type="text" name="email" value="<%=member_email %>" style="color:white;font-size:10pt;padding-left:5px;width:300px;background-color:black;border:1px solid white;">
					</div>
				</div>
			</div>
			<div style="display:table;width:250px;font-size:10pt;font-family:����;margin-top:20px;">
				<div style="display:table-row">
					<div style="display:table-cell">
						<input type="submit" value="�Ϸ�" style="color:white;background-color:black;border:1px solid gold">
					</div>
					<div style="display:table-cell">
						<input type="button" value="���" style="color:white;background-color:black;border:1px solid gold" onclick="history.back()">
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
<%@ include file="bottom.jsp" %>