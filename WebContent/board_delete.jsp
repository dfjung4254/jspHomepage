<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO" />
<jsp:useBean id="b_dao" class="home.board.BoardDAO" />
<%

request.setCharacterEncoding("EUC-KR");

String board_no = request.getParameter("no");
String login_id = (String)session.getAttribute("id");
int no = Integer.parseInt(board_no);
//login check
if(login_id == null || login_id.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("로그인을 먼저하세요");
		location.href = "board.jsp?page=1";
	</script>
	<%
	return;
}

//session id.name == writer -->check
String writer_id = b_dao.getValue("no", board_no, "writer_id");
if(!(login_id.equals(writer_id)) && !(login_id.equals("dfjung4254"))){
	//로그인사용자와 글작성자가 불일치 또는 관리자계정(dfjung4254)이 아닐 시
	System.out.println("불일치 - 작성자 : "+writer_id+" 로그인계정id : "+login_id);
	%>
	<script type="text/javascript">
	 	alert("해당글의 작성자 또는 관리자만 삭제가능합니다");
	 	location.href = "board_view.jsp?no=<%= no%>"
	</script>
	<%
	return;
}

//delete Contents
int ret = b_dao.deleteContents(board_no);

if(ret>0){
	%>
	<script type="text/javascript">
		alert("삭제되었습니다");
		location.href = "board.jsp?page=1";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("삭제실패!");
		location.href = "board_view.jsp?no=<%=no%>";
	</script>
	<%
}

%>