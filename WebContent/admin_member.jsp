<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList, home.member.MemberDTO" %>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<!-- admin_member.jsp -->
<%@ include file = "top.jsp" %>
<%

if(!(id.trim().equals("dfjung4254"))){
	%>
	<script type="text/javascript">
		location.href = "index.jsp";
	</script>
	<%
}

%>
<%@ include file = "subMenu.jsp" %>
	<div align = "center" style = "width:100%; height:450; overflow:auto;
	scrollbar-face-color:black;scrollbar-highlight-color:white;scrollbar-track-color:black;">
		<div style="margin-bottom:20px;margin-top:30px;letter-spacing:0.2em;font-family:돋움;font-size:14pt;">관리자 회원관리</div>
		<div style="border-bottom:1px solid white;width:400px;height:30px;margin-bottom:20px;text-align:center">
			<form name="search" method="post" action="admin_member.jsp">
			<select name="category" style=";border:1px solid white;font-size:9pt;background-color:black;color:white;" onChange="makeForm(this.value)">
				<option value="">분류선택</option>
				<option value="name">NAME</option>
				<option value="id">ID</option>
				<option value="ssn">SSN</option>
				<option value="email">EMAIL</option>
				<option value="hp">HP</option>
			</select>
			<div id="change" style="display:inline-block;background-color:black;border:0px solid white;font-size:9pt;color:white;width:250px;"></div>
			<script type="text/javascript">
				var outer = document.getElementById("change");
				function makeForm(value){
					switch(value){
					case "name":
						outer.innerHTML = "<input type=text name=s_name placeholder=이름을입력하세요 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:250px;'>";
						break;
					case "id":
						outer.innerHTML = "<input type=text name=s_id placeholder=아이디를입력하세요 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:250px;'>";
						break;
					case "ssn":
						outer.innerHTML = "<input type=text name=s_ssn1 placeholder=주민번호앞자리 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:110px;'>	- <input type=text name=s_ssn2 placeholder=주민번호뒷자리 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:110px;'>";
						break;
					case "email":
						outer.innerHTML = "<input type=text name=s_email placeholder=이메일을입력하세요 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:250px;'>";
						break;
					case "hp":
						outer.innerHTML = "<input type=text name=s_hp1 placeholder=hp1 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:70px;'>	- <input type=text name=s_hp2 placeholder=hp2 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:70px;'> - <input type=text name=s_hp3 placeholder=hp3 style='background-color:black;border:1px solid white;text-align:center;font-size:9pt;color:white;width:70px;'>";
						break;
					default:
						outer.innerHTML = "";
						break;
					}
				}
			</script>
			<input style="background-color:black;border:1px solid white;font-size:9pt;color:white;" type="submit" value="검색">
			</form>
		</div>
		<div style = "display:table;width:580px;border:1px solid white;">
			<div style = "display:table-row;font-size:8pt;color:tomato">
				<div style = "display:table-cell;padding:5px;border:1px solid red;">NAME</div>
				<div style = "display:table-cell;padding:5px;border:1px solid red;">ID</div>
				<div style = "display:table-cell;padding:5px;border:1px solid red;">SSN</div>
				<div style = "display:table-cell;padding:5px;border:1px solid red;">EMAIL</div>
				<div style = "display:table-cell;padding:5px;border:1px solid red;">HP</div>
				<div style = "display:table-cell;padding:5px;border:1px solid red;">JOINDATE</div>
				<div style = "display:table-cell;padding:5px;border:1px solid red;">ALTER</div>
			</div>
			<%
			
			request.setCharacterEncoding("EUC-KR");
			String category = request.getParameter("category");
			System.out.println(category);
			String value1 = "";
			String value2 = "";
			String value3 = "";
			ArrayList <MemberDTO> list;
			if(category == null){
				list = dao.newMemberList();
			}else{
				switch(category){
				case "name":
					value1 = request.getParameter("s_name");
					list = dao.getMemberList(category, value1);
					break;
				case "id":
					value1 = request.getParameter("s_id");
					list = dao.getMemberList(category, value1);
					break;
				case "ssn":
					value1 = request.getParameter("s_ssn1");
					value2 = request.getParameter("s_ssn2");
					list = dao.getMemberList(category, value1, value2);
					break;
				case "email":
					value1 = request.getParameter("s_email");
					list = dao.getMemberList(category, value1);
					break;
				case "hp":
					value1 = request.getParameter("s_hp1");
					value2 = request.getParameter("s_hp2");
					value3 = request.getParameter("s_hp3");
					list = dao.getMemberList(category, value1, value2, value3);
					break;
				default:
					list = dao.newMemberList();
					break;
				}
			}
			
			
			for(int i = 0; i < list.size(); i++){
				%>
				<div style = "display:table-row;font-size:8pt;">
					<div style = "display:table-cell;padding:3px;border:1px solid red;"><%=list.get(i).getName() %></div>
					<div style = "display:table-cell;padding:3px;border:1px solid red;"><%=list.get(i).getId() %></div>
					<div style = "display:table-cell;padding:3px;border:1px solid red;"><%=list.get(i).getSsn1() %>-<%=list.get(i).getSsn2() %></div>
					<div style = "display:table-cell;padding:3px;border:1px solid red;"><%=list.get(i).getEmail() %></div>
					<div style = "display:table-cell;padding:3px;border:1px solid red;"><%=list.get(i).getHp1() %> <%=list.get(i).getHp2() %> <%=list.get(i).getHp3() %></div>
					<div style = "display:table-cell;padding:3px;border:1px solid red;"><%=list.get(i).getJoindate() %></div>
					<div style = "display:table-cell;padding:3px;border:1px solid red;">
					<a style="font-size:8pt" href="admin_memberUpdate.jsp?no=<%=list.get(i).getNo() %>">수정</a>
					|
					<a style="font-size:8pt" href="javascript:onClick=member_delete(<%=list.get(i).getNo()%>)">삭제</a>
					</div>
				</div>
				<%	
			}
			
			%>
			
		</div>
	</div>
<%@ include file = "bottom.jsp" %>