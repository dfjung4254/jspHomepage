<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="dto" class="home.board.BoardDTO" />
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<jsp:setProperty name="dto" property="*" />
<%

int ret = dao.updateContents(dto);

if(ret > 0){
	%>
	<script type="text/javascript">
		alert("�� ���� �Ϸ�!");
		location.href="board_view.jsp?no=<%= dto.getNo() %>";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("�� ���� ����, �����ڿ��� �����ϼ���");
		history.back();
	</script>
	<%
}

%>