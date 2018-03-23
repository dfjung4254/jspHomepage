<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, home.book.BookDTO"  %>
<jsp:useBean id="dao" class = "home.book.BookDAO"/>
<!-- �������� ������ delete.jsp -->
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<div style = "letter-spacing:0.2em;font-size:20pt;font-family:�������;font-weight:bold;color:deeppink;margin-bottom:15px;">
			��������
		</div>
		<form name = "delete" method = "post" action = "delete_check.jsp">
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">�̸�</td>
				<td class="row">���ǻ�</td>
				<td class="row">������</td>
				<td class="row">����</td>
				<td class="row">�����</td>
				<td class="row-right">����</td>
			</tr>
			<%
			
			ArrayList <BookDTO> list = dao.makeList();
			
			for(int i = 0; i < list.size(); i++){
				%>
				<tr>
					<td class="cell-left"><%=list.get(i).getName() %></td>
					<td class="cell"><%=list.get(i).getWriter() %></td>
					<td class="cell"><%=list.get(i).getPublisher() %></td>
					<td class="cell"><%=list.get(i).getPrice() %></td>
					<td class="cell"><%=list.get(i).getDay() %></td>
					<td class="cell-right"><input name = "check" value = "<%=list.get(i).getName() %>"type="checkbox"></td>
				</tr>
				<%
			}
			
			%>
		</table>
		<br>
		<input type = "submit" value = "���û���">
		</form>
	</div>

<%@ include file = "book_bottom.jsp" %>