<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, home.book.BookDTO"  %>
<jsp:useBean id="dao" class = "home.book.BookDAO"/>
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
		<input type = "submit" value = "선택삭제">
		</form>
	</div>

<%@ include file = "book_bottom.jsp" %>