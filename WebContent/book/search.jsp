<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, home.book.BookDTO" %>
<jsp:useBean id = "dao" class = "home.book.BookDAO"/>
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
		
		ArrayList <BookDTO> searchList = dao.searchList(index, index_name);
		
		if(index == ""){
			%>
			
			<script type = "text/javascript">
			alert("ī�װ��� �����Ͻʽÿ�");
			</script>
			
			<%
			return;
		}
		
		if(searchList.isEmpty() &&  index != null){
			System.out.println("�˻���� ����");
			%>
			<tr>
				<td colspan=5 class = "cell">�˻��Ͻ� Ű���� (<%=index_name %>)�� ��Ͽ� �����ϴ�! </td>
			</tr>
			<%
		}else if(index == null){
			System.out.println("ù�湮");
			%>
			<tr>
				<td colspan=5 class = "cell">ī�װ��� �����ϰ� �˻�� �Է��Ͻʽÿ�</td>
			</tr>
			<%
		}else{
			System.out.println("�˻���� ����");
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