<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 도서등록 페이지 insert.jsp -->
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<form name = "insert" method = "post" action = "insert_check.jsp">
		<table style = "width:300px;">
			<tr>
				<td colspan = "2" style = "border-top:2px solid tomato;text-align:center;
				border-bottom:2px solid red;font-family:돋움;font-size:14pt;
				letter-spacing:0.2em;vertical-align:middle;padding:10px;">
				도서등록페이지
				</td>
			</tr>
			<tr style = "background-color:skyblue;font-size:10pt;font-family:돋움;">
				<td style = "padding:5px;">도서명</td>
				<td style = "text-align:center;"><input type = "text" name = "name"></td>
			</tr>
			<tr style = "background-color:skyblue;font-size:10pt;font-family:돋움;">
				<td style = "padding:5px;">출판사</td>
				<td style = "text-align:center;"><input type = "text" name = "publisher"></td>
			</tr>
			<tr style = "background-color:skyblue;font-size:10pt;font-family:돋움;">
				<td style = "padding:5px;">지은이</td>
				<td style = "text-align:center;"><input type = "text" name = "writer"></td>
			</tr>
			<tr style = "background-color:skyblue;font-size:10pt;font-family:돋움;">
				<td style = "padding:5px;">판매가</td>
				<td style = "text-align:center;"><input type = "text" name = "price"></td>
			</tr>
			<tr style = "background-color:tomato;text-align:center;vertical-align:middle;">
				<td colspan = "2" style = "font-size:8pt;vertical-align:middle;">
					<br>
					<input type = "submit" value = "등록">
					<input type = "reset" value = "취소">
				</td>
			</tr>
		</table>
		</form>
	</div>

<%@ include file = "book_bottom.jsp" %>