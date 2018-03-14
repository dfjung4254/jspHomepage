<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 도서 리스트 페이지임 list.jsp -->
<%@ page import = "java.sql.*" %>
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<h1>도서 리스트</h1>
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">이름</td>
				<td class="row">출판사</td>
				<td class="row">지은이</td>
				<td class="row">가격</td>
				<td class="row-right">등록일</td>
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
					<td class="cell-right"><%out.println(day); %></td>
				</tr>
				<%
			}
			%>
		</table>
	</div>
<%@ include file = "book_bottom.jsp" %>