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

//��ȿ���˻�
if(title == null || title.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("������ �����ּ���!");
		history.back();
	</script>
	<%
	return;
}else if(contents == null || contents.trim().equals("")){
	%>
	<script type="text/javascript">
		alert("������ �����ּ���!");
		history.back();
	</script>
	<%
	return;
}

int ret = dao.newContents(writer, title, contents, email, writer_id);

if(ret > 0){
	%>
	<script type="text/javascript">
		alert("�Խù��� ����Ͽ����ϴ�");
		location.href = "board.jsp?page=1";
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
		alert("�Խù� ��� ����!");
		location.href = "board.jsp?page=1";
	</script>
	<%
}

%>

