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
		alert("�α����� �����ϼ���");
		location.href = "board.jsp?page=1";
	</script>
	<%
	return;
}

//session id.name == writer -->check
String writer_id = b_dao.getValue("no", board_no, "writer_id");
if(!(login_id.equals(writer_id)) && !(login_id.equals("dfjung4254"))){
	//�α��λ���ڿ� ���ۼ��ڰ� ����ġ �Ǵ� �����ڰ���(dfjung4254)�� �ƴ� ��
	System.out.println("����ġ - �ۼ��� : "+writer_id+" �α��ΰ���id : "+login_id);
	%>
	<script type="text/javascript">
	 	alert("�ش���� �ۼ��� �Ǵ� �����ڸ� ���������մϴ�");
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
		alert("�����Ǿ����ϴ�");
		location.href = "board.jsp?page=1";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("��������!");
		location.href = "board_view.jsp?no=<%=no%>";
	</script>
	<%
}

%>