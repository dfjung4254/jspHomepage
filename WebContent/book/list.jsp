<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, home.book.BookDTO" %>
<jsp:useBean id = "dao" class = "home.book.BookDAO"/>
<!-- ���� ����Ʈ �������� list.jsp -->
<%@ page import = "java.sql.*" %>
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<div style = "letter-spacing:0.2em;font-size:20pt;font-family:�������;font-weight:bold;color:deeppink;margin-bottom:15px;">
			���� ����Ʈ
		</div>
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">�̸�</td>
				<td class="row">���ǻ�</td>
				<td class="row">������</td>
				<td class="row">����</td>
				<td class="row-right">�����</td>
			</tr>
			<%
			
			ArrayList <BookDTO> bookList = dao.makeList();
			
			for(int i = 0; i < bookList.size(); i++){
				
				%>
				<tr>
					<td class="cell-left"><%=bookList.get(i).getName() %></td>
					<td class="cell"><%=bookList.get(i).getWriter() %></td>
					<td class="cell"><%=bookList.get(i).getPublisher() %></td>
					<td class="cell"><%=bookList.get(i).getPrice() %></td>
					<td class="cell-right"><%=bookList.get(i).getDay() %></td>
				</tr>
				<%
				
			}

			
			%>
		</table>
	</div>
<%@ include file = "book_bottom.jsp" %>