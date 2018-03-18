<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
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
		
		if(index == ""){
			%>
			
			<script type = "text/javascript">
			alert("카테고리를 선택하십시오");
			</script>
			
			<%
			return;
		}
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("드라이버 등록 성공");
		}catch(Exception e){
			System.out.println("드라이버 등록 실패");
		}
		String url = "jdbc:mysql://13.125.191.119:3306/jkh_homepage";
		String user = "jkh";
		String pass = "rmsghk4254";
		String sql = "select * from booklist where "+index+" like '%"+index_name+"%';";
		Connection con = DriverManager.getConnection(url,user,pass);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()){
			String name = rs.getString("name");
			String publisher = rs.getString("publisher");
			String writer = rs.getString("writer");
			int price = rs.getInt("price");
			Date day = rs.getDate("day");
			
			%>
			<tr>
				<td class="cell-left"><%out.println(name); %></td>
				<td class="cell"><%out.println(publisher); %></td>
				<td class="cell"><%out.println(writer); %></td>
				<td class="cell"><%out.println(price); %></td>
				<td class="cell-right"><%out.println(day); %></td>
			</tr>
			<%
		}
		%>
		</table>
	</div>

<%@ include file = "book_bottom.jsp" %>