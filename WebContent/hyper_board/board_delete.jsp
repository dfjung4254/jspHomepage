<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<%

request.setCharacterEncoding("EUC-KR");

int no = Integer.parseInt(request.getParameter("no"));
String writer_id = dao.getValue("no", String.valueOf(no), "writer_id");
int list_index = Integer.parseInt(dao.getValue("no", String.valueOf(no), "list_index"));
int list_indexLevel = Integer.parseInt(dao.getValue("no", String.valueOf(no), "list_indexLevel"));
String login_id = (String)session.getAttribute("id");

//login==writer üũ
if(writer_id.trim().equals(login_id) || login_id.equals("dfjung4254")){
	//delete ���� o
	
	int ret = 0;
	
	if(dao.checkAnswer(list_index)){
		//������� ��� ���� -> delete�� �ƴ϶� update�� title - �����ȰԽñ��Դϴ� / ����ó��(list���� �����۸�ũx, �ּҷ� �������� title�� üũ)
		System.out.println("����������Ʈ��");
		ret = dao.deleteContents_update(no, list_indexLevel);
	}else{
		//����� �������� ������� �׳� ����.
		System.out.println("����������");
		ret = dao.deleteContents(no, list_index);
	}
	
	
	
	if(ret > 0){
		%>
		<script type="text/javascript">
			alert("��������!");
			location.href="board_list.jsp?page=1";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("��������, �����ڿ��� �����ϼ���");
			location.href="board_view.jsp?no=<%= no %>";
		</script>
		<%
	}
	
}else{
	//delete ���� x
	%>
	<script type="text/javascript">
		alert("�ۼ��ڳ� �����ڸ� ���������մϴ�");
		location.href="board_view.jsp?no=<%= no %>";
	</script>
	<%
}

%>