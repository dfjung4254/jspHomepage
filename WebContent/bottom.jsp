<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
</td>
			</tr>
			<tr height = "20%">
				<td colspan = "2" align = "right" style="padding:10px;vertical-align:bottom;font-size:10pt;">
				
				�����ڱ���:
				
				<%
				
				String admin = (String)session.getAttribute("id");
				if(admin == null || admin.trim().equals("")){
					//admin����
					%>
					ȸ������
					<%
				}else if(admin.equals("dfjung4254")){
					//�Ϲ�
					%>
					<a href="<%=request.getContextPath() %>/admin_member.jsp">ȸ������</a>
					<%
				}else{
					%>
					ȸ������
					<%
				}
				
				%>

				
				</td>
			</tr>
		</table>
	
	</div>

</body>

</html>