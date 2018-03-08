<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
    
<%
	

	request.setCharacterEncoding("EUC-KR");

	String name = request.getParameter("name");
	String publisher = request.getParameter("publisher");
	String writer = request.getParameter("writer");
	String price = request.getParameter("price");
	if(name == null || publisher == null || writer == null || price == null ||
			name.trim().equals("") || publisher.trim().equals("") || writer.trim().equals("")
			|| price.trim().equals("")){
		%>
		
		<script type = "text/javascript">
			alert("목록을 모두 작성하십시오.");
			history.back();
		</script>
		
		<%
		return;
	}
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 등록 성공");
	}catch(ClassNotFoundException e){
		System.err.println("드라이버 등록 실패");
	}

	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user = "jkh";
	String pass = "rmsghk4254";
	String sql = "insert into booklist values(?,?,?,?,sysdate)";
	Connection con = DriverManager.getConnection(url,user,pass);
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, writer);
	ps.setString(3, publisher);
	ps.setInt(4, Integer.parseInt(price));
	int res = ps.executeUpdate();
	if(res > 0){
		System.out.printf("DB 새 도서등록 : %s, %s, %s, %d", name, writer, publisher, Integer.parseInt(price));
		%>
		<script type="text/javascript">
			alert("도서등록 성공");
			location.href = "list.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("도서등록 실패");
			location.href = "index.jsp";
		</script>
		<%
	}
	
	
%>