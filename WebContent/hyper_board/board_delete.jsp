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

//login==writer 체크
if(writer_id.trim().equals(login_id) || login_id.equals("dfjung4254")){
	//delete 권한 o
	
	int ret = 0;
	
	if(dao.checkAnswer(list_index)){
		//지울글의 답글 존재 -> delete가 아니라 update로 title - 삭제된게시글입니다 / 접근처리(list에서 하이퍼링크x, 주소로 들어갔을때도 title로 체크)
		System.out.println("삭제업데이트함");
		ret = dao.deleteContents_update(no, list_indexLevel);
	}else{
		//답글이 존재하지 않을경우 그냥 삭제.
		System.out.println("완전삭제함");
		ret = dao.deleteContents(no, list_index);
	}
	
	
	
	if(ret > 0){
		%>
		<script type="text/javascript">
			alert("삭제성공!");
			location.href="board_list.jsp?page=1";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("삭제실패, 관리자에게 문의하세요");
			location.href="board_view.jsp?no=<%= no %>";
		</script>
		<%
	}
	
}else{
	//delete 권한 x
	%>
	<script type="text/javascript">
		alert("작성자나 관리자만 삭제가능합니다");
		location.href="board_view.jsp?no=<%= no %>";
	</script>
	<%
}

%>