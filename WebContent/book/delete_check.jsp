<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*"%>

<%

request.setCharacterEncoding("EUC-KR");

String names[] = request.getParameterValues("check");

try{
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("드라이버등록 성공");
}catch(Exception e){
	System.out.println("드라이버등록 실패");
}

String url = "jdbc:mysql://13.125.191.119:3306/jkh_homepage";
String user = "jkh";
String pass = "rmsghk4254";
String sql = "delete from booklist where";

for(int i = 0; i < names.length; i++){
	if(i == 0){
		sql += " name = '"+names[i]+"'";
	}else{
		sql += " or name = '"+names[i]+"'";
	}
	
}
sql+=";";

Connection con = DriverManager.getConnection(url,user,pass);
PreparedStatement ps = con.prepareStatement(sql);
int res = ps.executeUpdate();

if(res > 0){
	System.out.println("데이터 삭제성공");
	%>
	<script type="text/javascript">
		alert("선택 삭제완료!");
		location.href = "list.jsp";
	</script>
	<%
}else{
	System.out.println("데이터 삭제실패");
	%>
	<script type="text/javascript">
		alert("선택 삭제실패!");
		location.href("delete.jsp");
	</script>
	<%
	
}

%>