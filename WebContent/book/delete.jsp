<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*"  %>
<!-- 도서삭제 페이지 delete.jsp -->
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<div style = "letter-spacing:0.2em;font-size:20pt;font-family:나눔고딕;font-weight:bold;color:deeppink;margin-bottom:15px;">
			도서삭제
		</div>
		<form name = "delete" method = "post" action = "delete_check.jsp">
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">이름</td>
				<td class="row">출판사</td>
				<td class="row">지은이</td>
				<td class="row">가격</td>
				<td class="row">등록일</td>
				<td class="row-right">삭제</td>
			</tr>
			<%
			 
			request.setCharacterEncoding("EUC-KR");
				
			try{
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("드라이버 등록 성공");
			}catch(Exception e){
				System.out.println("드라이버 등록 실패");
			}
			String url = "jdbc:mysql://13.125.191.119:3306/jkh_homepage";
			String user = "jkh";
			String pass = "rmsghk4254";
			String sql = "select * from booklist;";
			Connection con = DriverManager.getConnection(url,user,pass);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()){
				String name = rs.getString("name");
				String publisher = rs.getString("publisher");
				String writer = rs.getString("writer");
				int price = rs.getInt("price");
				Date day = rs.getDate("day");
				
				%>
				<tr>
					<td class="cell-left"><%out.println(name); %></td>
					<td class="cell"><%out.println(publisher); %></td>
					<td class="cell"><%out.println(writer); %></td>
					<td class="cell"><%out.println(price); %></td>
					<td class="cell"><%out.println(day); %></td>
					<td class="cell-right"><input name = "check" value = "<%=name %>"type="checkbox"></td>
				</tr>
				<%
			}
			%>
		</table>
		<br>
		<input type = "submit" value = "선택삭제">
		</form>
	</div>

<%@ include file = "book_bottom.jsp" %>