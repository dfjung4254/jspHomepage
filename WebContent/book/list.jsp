<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, home.book.BookDTO" %>
<jsp:useBean id = "dao" class = "home.book.BookDAO"/>
<!-- 도서 리스트 페이지임 list.jsp -->
<%@ page import = "java.sql.*" %>
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<div style = "letter-spacing:0.2em;font-size:20pt;font-family:나눔고딕;font-weight:bold;color:deeppink;margin-bottom:15px;">
			도서 리스트
		</div>
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">이름</td>
				<td class="row">출판사</td>
				<td class="row">지은이</td>
				<td class="row">가격</td>
				<td class="row-right">등록일</td>
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