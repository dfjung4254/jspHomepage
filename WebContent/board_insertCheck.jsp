<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.board.BoardDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

String writer = request.getParameter("name");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
String email = request.getParameter("email");
String writer_id = request.getParameter("id");

//유효성검사
if(title == null || title.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("제목을 적어주세요!");
		history.back();
	</script>
	<%
}else if(contents == null || contents.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("내용을 적어주세요!");
		history.back();
	</script>
	<%
}

int ret = dao.newContents(writer, title, contents, email, writer_id);

if(ret > 0){
	%>
	<script type="text/javascript">
		alert("게시물을 등록하였습니다");
		location.href = "board.jsp?page=1";
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
		alert("게시물 등록 실패!");
		location.href = "board.jsp?page=1";
	</script>
	<%
}

%>

