<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
</td>
			</tr>
			<tr height = "20%">
				<td colspan = "2" align = "right" style="padding:10px;vertical-align:bottom;font-size:10pt;">
				
				관리자권한:
				
				<%
				
				String admin = (String)session.getAttribute("id");
				if(admin == null || admin.trim().equals("")){
					//admin계정
					%>
					회원관리
					<%
				}else if(admin.equals("dfjung4254")){
					//일반
					%>
					<a href="<%=request.getContextPath() %>/admin_member.jsp">회원관리</a>
					<%
				}else{
					%>
					회원관리
					<%
				}
				
				%>

				
				</td>
			</tr>
		</table>
	
	</div>

</body>

</html>