<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="home.member.MemberDAO"/>
<%

request.setCharacterEncoding("EUC-KR");

int no = Integer.parseInt(request.getParameter("no"));

%>

<script type="text/javascript">
	if(confirm("�����Ͻðڽ��ϱ�??")){
		
	}else{
		return;
	}
</script>

<%

int ret = dao.memberDelete(no);

if(ret > 0){
	%>
	
	<script type="text/javascript">
		alert("��������!");
		location.href = "admin_member.jsp";
	</script>
	
	<%
}else{
	%>
	
	<script type="text/javascript">
		alert("��������!");
		location.href = "admin_member.jsp";
	</script>
	
	<%
}

%>