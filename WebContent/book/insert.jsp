<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- ������� ������ insert.jsp -->
<%@ include file = "book_top.jsp" %>
	<div align = "center">
		<form name = "insert" method = "post" action = "insert_check.jsp">
		<table style = "width:300px;">
			<tr>
				<td colspan = "2" style = "border-top:2px solid tomato;text-align:center;
				border-bottom:2px solid red;font-family:�������;font-size:15pt;font-weight:bold;
				letter-spacing:0.2em;vertical-align:middle;padding:10px;background-color:lightcyan;color:deeppink">
				�������������
				</td>
			</tr>
			<tr style = "background-color:mistyrose;font-size:10pt;font-family:����;">
				<td style = "padding:5px;">������</td>
				<td style = "text-align:center;"><input type = "text" name = "name"></td>
			</tr>
			<tr style = "background-color:antiquewhite;font-size:10pt;font-family:����;">
				<td style = "padding:5px;">���ǻ�</td>
				<td style = "text-align:center;"><input type = "text" name = "publisher"></td>
			</tr>
			<tr style = "background-color:linen;font-size:10pt;font-family:����;">
				<td style = "padding:5px;">������</td>
				<td style = "text-align:center;"><input type = "text" name = "writer"></td>
			</tr>
			<tr style = "background-color:papayawhip;font-size:10pt;font-family:����;">
				<td style = "padding:5px;">�ǸŰ�</td>
				<td style = "text-align:center;"><input type = "text" name = "price"></td>
			</tr>
			<tr style = "background-color:tomato;text-align:center;vertical-align:middle;">
				<td colspan = "2" style = "font-size:8pt;vertical-align:middle;">
					<br>
					<input type = "submit" value = "���">
					<input type = "reset" value = "���">
				</td>
			</tr>
		</table>
		</form>
	</div>

<%@ include file = "book_bottom.jsp" %>