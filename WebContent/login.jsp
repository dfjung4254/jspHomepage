<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "top.jsp" %>
<%@ include file = "subMenu.jsp" %>
	<div align = "center">
		<h1> L O G I N </h1>
		<form>
			<div class = "container">
				<div class = "row">
					 I D <input style="background-color:black;border:1px solid white;"type = "text" name="id" value="">
				</div>
				<div class = "row">
					PW <input style="background-color:black;border:1px solid white;" type = "password" name="passwd" value="">
				</div>
				<div class = "checkmain">
					<input class = "check" type = "checkbox">���̵� ���
					<input class = "btnSmall" type = "submit" value = "IDã��">
					<input class = "btnSmall" type = "submit" value = "PWã��">
				</div>
				<div class = "button" >
					<input type = "submit" value = "�α���">
					<input type = "submit" value = "ȸ������">
				</div>
			</div>
		</form>
	</div>
<%@ include file = "bottom.jsp" %>