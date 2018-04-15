<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.File, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<jsp:useBean id="dao" class="home.board.BoardDAO" />
<%

request.setCharacterEncoding("EUC-KR");
String saveDir = request.getRealPath("/upload");
int maxSize = 1024*1024*100;
String encType = "EUC-KR";

MultipartRequest m_request = new MultipartRequest(request, saveDir, maxSize, encType, new DefaultFileRenamePolicy());

String writer = m_request.getParameter("writer");
String writer_id = m_request.getParameter("writer_id");
String writer_ip = m_request.getParameter("writer_ip");
String title = m_request.getParameter("title");
String contents = m_request.getParameter("contents");
String email = m_request.getParameter("email");
int list_index = Integer.parseInt(m_request.getParameter("list_index"));
int list_indexLevel = Integer.parseInt(m_request.getParameter("list_indexLevel"));
String file_name = m_request.getFilesystemName("file");
File file = m_request.getFile("file");

System.out.println("uplodaded file : "+file_name);
System.out.println(saveDir);

int ret = dao.insertContents(writer, writer_id, writer_ip, title, contents, email, list_index, list_indexLevel, file_name);

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