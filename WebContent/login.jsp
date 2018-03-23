<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "top.jsp" %>
<%@ include file = "subMenu.jsp" %>
	<div align = "center">
		<h1> L O G I N </h1>
		<form>
			<div class = "container">
				<div class = "row">
					 I D <input type = "text" name="id" value="">
				</div>
				<div class = "row">
					PW <input type = "password" name="passwd" value="">
				</div>
				<div class = "checkmain">
					<input class = "check" type = "checkbox">아이디 기억
					<input class = "btnSmall" type = "submit" value = "ID찾기">
					<input class = "btnSmall" type = "submit" value = "PW찾기">
				</div>
				<div class = "button" >
					<input type = "submit" value = "로그인">
					<input type = "submit" value = "회원가입">
				</div>
			</div>
		</form>
	</div>
<%@ include file = "bottom.jsp" %>