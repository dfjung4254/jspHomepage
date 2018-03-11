<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "top.jsp" %>
<%@ include file = "subMenu.jsp" %>
	<div align = "center">
		<h1>MEMBERSHIP APLICATION</h1>
		<div class = "member-container">
			<div class = "member-tr">
				<div class = "member-td">아아</div>	<div class = "member-td"><input class = "member-input" type = "text"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">아이디</div>	<div class = "member-td"><input class = "member-input" type = "text"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">비밀번호</div>	<div class = "member-td"><input class = "member-input" type = "password"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">주민등록번호</div>	<div class = "member-td"><input class = "member-input" type = "text"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">이메일</div>	<div class = "member-td"><input class = "member-input" type = "text"></div>
			</div>
			<div class = "member-tr">
				<div class = "member-td">연락처</div>	<div class = "member-td"><input class = "member-input" type = "text"></div>
			</div>
		</div>
		<div style = "margin-top:10px">
			<input type = "submit" value = "가입" class = "member-btn"><input type = "submit" value = "취소" class = "member-btn">
		</div>
	</div>
<%@ include file = "bottom.jsp" %>
