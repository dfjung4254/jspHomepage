<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<%

request.setCharacterEncoding("EUC-KR");

String writer = request.getParameter("writer");
String writer_id = request.getParameter("writer_id");
String writer_ip = request.getParameter("writer_ip");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String email = request.getParameter("email");
int list_index = Integer.parseInt(request.getParameter("list_index"));
int list_indexLevel = Integer.parseInt(request.getParameter("list_indexLevel"));
int ret = dao.insertContents(writer, writer_id, writer_ip, title, contents, email, list_index, list_indexLevel);

if(ret >0){
	%>
	<script type="text/javascript">
		alert("글이 등록되었습니다.");
		location.href="board_list.jsp?page=1";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("글 등록 실패! 관리자에게 문의하세요");
		history.back();
	</script>
	<%
}

%>