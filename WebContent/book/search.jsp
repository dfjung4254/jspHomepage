<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, home.book.BookDTO" %>
<jsp:useBean id = "dao" class = "home.book.BookDAO"/>
<!-- 도서검색 페이지 search.jsp -->
<%@ include file = "book_top.jsp" %>

	<div align = "center">
		<div style = "letter-spacing:0.2em;font-size:20pt;font-family:나눔고딕;font-weight:bold;color:deeppink;margin-bottom:15px;">
			도서검색
		</div>
		<form name="search" method="post" action="search.jsp">
			<div style = "width:500px;border-bottom:2px solid black;padding:5px;">
				<div align="left" style = "margin-left:30px;">
					<select name="typeSelect" onChange = "makeForm(this.value);">
						<option value="">카테고리</option>
						<option value="name">이름</option>
						<option value="publisher">출판사</option>
						<option value="writer">지은이</option>
						<option value="price">가격</option>
					</select>
					<div id="change" style="width:300px;display:inline-block;font-family:나눔고딕;font-size:10pt;">
					
					</div>
					<script type = "text/javascript">
					var outer = document.getElementById("change");
						function makeForm(value){
							var m_value;
							switch(value){
							case "name":
								m_value = "도서명을입력하시오";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "publisher":
								m_value = "출판사명을입력하시오";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "writer":
								m_value = "저자명을입력하시오";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "price":
								m_value = "가격을입력하시오";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "":
								outer.innerHTML = "";
								break;
							}
						}
						
					</script>
					
					<input id = "button" type="submit" value="검색" style = "float:right;display:inline;margin-right:30px;">
				</div>
			</div>
		</form>
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">이름</td>
				<td class="row">출판사</td>
				<td class="row">지은이</td>
				<td class="row">가격</td>
				<td class="row-right">등록일</td>
			</tr>
		
		<%
		
		request.setCharacterEncoding("EUC-KR");
		String index = request.getParameter("typeSelect");
		String index_name = request.getParameter("s_value");
		
		ArrayList <BookDTO> searchList = dao.searchList(index, index_name);
		
		if(index == ""){
			%>
			
			<script type = "text/javascript">
			alert("카테고리를 선택하십시오");
			</script>
			
			<%
			return;
		}
		
		if(searchList.isEmpty() &&  index != null){
			System.out.println("검색목록 없음");
			%>
			<tr>
				<td colspan=5 class = "cell">검색하신 키워드 (<%=index_name %>)는 목록에 없습니다! </td>
			</tr>
			<%
		}else if(index == null){
			System.out.println("첫방문");
			%>
			<tr>
				<td colspan=5 class = "cell">카테고리를 선택하고 검색어를 입력하십시오</td>
			</tr>
			<%
		}else{
			System.out.println("검색목록 존재");
			for(int i = 0; i < searchList.size(); i++){
		
			%>
			<tr>
				<td class="cell-left"><%=searchList.get(i).getName()%></td>
				<td class="cell"><%=searchList.get(i).getWriter() %></td>
				<td class="cell"><%=searchList.get(i).getPublisher() %></td>
				<td class="cell"><%=searchList.get(i).getPrice() %></td>
				<td class="cell-right"><%=searchList.get(i).getDay() %></td>
			</tr>
			<%
			}
		}
		%>
		</table>
	</div>

<%@ include file = "book_bottom.jsp" %>