<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!-- �����˻� ������ search.jsp -->
<%@ include file = "book_top.jsp" %>

	<div align = "center">
		<div style = "letter-spacing:0.2em;font-size:20pt;font-family:�������;font-weight:bold;color:deeppink;margin-bottom:15px;">
			�����˻�
		</div>
		<form name="search" method="post" action="search.jsp">
			<div style = "width:500px;border-bottom:2px solid black;padding:5px;">
				<div align="left" style = "margin-left:30px;">
					<select name="typeSelect" onChange = "makeForm(this.value);">
						<option value="">ī�װ�</option>
						<option value="name">�̸�</option>
						<option value="publisher">���ǻ�</option>
						<option value="writer">������</option>
						<option value="price">����</option>
					</select>
					<div id="change" style="width:300px;display:inline-block;font-family:�������;font-size:10pt;">
					
					</div>
					<script type = "text/javascript">
					var outer = document.getElementById("change");
						function makeForm(value){
							var m_value;
							switch(value){
							case "name":
								m_value = "���������Է��Ͻÿ�";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "publisher":
								m_value = "���ǻ�����Է��Ͻÿ�";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "writer":
								m_value = "���ڸ����Է��Ͻÿ�";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "price":
								m_value = "�������Է��Ͻÿ�";
								outer.innerHTML = "<input name = s_value type = text placeholder = "+m_value+" style = width:300px;color:gray;font-size:9pt;>";
								break;
							case "":
								outer.innerHTML = "";
								break;
							}
						}
						
					</script>
					
					<input id = "button" type="submit" value="�˻�" style = "float:right;display:inline;margin-right:30px;">
				</div>
			</div>
		</form>
		<table style="width:600px;border-top:2px dotted tomato;border-bottom:2px dotted tomato;">
			<tr>
				<td class="row-left">�̸�</td>
				<td class="row">���ǻ�</td>
				<td class="row">������</td>
				<td class="row">����</td>
				<td class="row-right">�����</td>
			</tr>
		
		<%
		
		request.setCharacterEncoding("EUC-KR");
		String index = request.getParameter("typeSelect");
		String index_name = request.getParameter("s_value");
		
		if(index == ""){
			%>
			
			<script type = "text/javascript">
			alert("ī�װ��� �����Ͻʽÿ�");
			</script>
			
			<%
			return;
		}
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("����̹� ��� ����");
		}catch(Exception e){
			System.out.println("����̹� ��� ����");
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