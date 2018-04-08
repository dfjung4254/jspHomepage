<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<%

request.setCharacterEncoding("EUC-KR");

String board_no = request.getParameter("no");
String writer_id = request.getParameter("writer_id");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String email = request.getParameter("email");

int ret = dao.updateContents(Integer.parseInt(board_no) , title, contents, email);

if(ret > 0){
	%>
	<script type="text/javascript">
		alert("수정되었습니다!");
		location.href = "board_view.jsp?no="+<%= board_no%>;
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("수정실패!");
		location.href = "board_view.jsp?no="+<%= board_no%>;
	</script>
	<%
}

%>