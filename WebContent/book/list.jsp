<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ���� ����Ʈ �������� list.jsp -->
<%@ page import = "java.sql.*" %>
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<h1>���� ����Ʈ</h1>
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">�̸�</td>
				<td class="row">���ǻ�</td>
				<td class="row">������</td>
				<td class="row">����</td>
				<td class="row-right">�����</td>
			</tr>
			<%
			 
			request.setCharacterEncoding("EUC-KR");
				
			try{
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("����̹� ��� ����");
			}catch(Exception e){
				System.out.println("����̹� ��� ����");
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