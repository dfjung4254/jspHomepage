<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>

<head>
	<title>회원가입여부</title>
	
	<script type="text/javascript">
		function close_window(){
			window.close();
		}
	</script>
	
	<link rel = "stylesheet" type = "text/css" href = "style.css?ver=1">
	
</head>

<body>
	<div style = "padding-top:30px;" align="center">
		<div style = "color:tomato;font-size:14pt;font-family:consolas;letter-spacing:0.2em;padding:10px;border-bottom:3px dotted skyblue;border-top:3px dotted skyblue;width:300px;">
			MEMBERSHIP CHECK
		</div>
		<form name="member_check" method="post" action="check.jsp">
		<table style = "margin-bottom:20px;border-top:1px solid tomato;border-bottom:1px solid tomato;margin-top:30px;width:400px;">
			
			<tr>
				<td style="font-family:돋움;font-size:10pt;padding-top:10px;padding-right:10px;width:120px;border-right:1px solid red;text-align:right;">
					이름
				</td>
				<td style="padding-top:10px;padding-left:10px;text-align:center;">
					<input class="input" type="text" name = "name">
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움;font-size:10pt;padding-top:10px;padding-right:10px;width:120px;border-right:1px solid red;text-align:right;">
					주민등록번호
				</td>
				<td style="padding-top:10px;padding-left:10px;text-align:center;">
					<input class="input" style="width:100px;" type="text" name = "ssn1" maxlength="6"> - <input class="input" style="width:100px;" type="password" name = "ssn2" maxlength="7">
				</td>
			</tr>
			<tr>
			</tr>
		</table>
		<input style = "margin-right:20px;" class="button" type="submit" value="확인"><input class="button" type="reset" value="취소" onclick="javascript:close_window()">
		</form>
	</div>
	</div>

</body>

</html>