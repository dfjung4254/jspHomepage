<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

int no = Integer.parseInt(request.getParameter("no"));

%>

<script type="text/javascript">
	if(confirm("삭제하시겠습니까??")){
		
	}else{
		return;
	}
</script>

<%

int ret = dao.memberDelete(no);

if(ret > 0){
	%>
	
	<script type="text/javascript">
		alert("삭제성공!");
		location.href = "admin_member.jsp";
	</script>
	
	<%
}else{
	%>
	
	<script type="text/javascript">
		alert("삭제실패!");
		location.href = "admin_member.jsp";
	</script>
	
	<%
}

%>