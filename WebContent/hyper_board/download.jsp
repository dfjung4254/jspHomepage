<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%

request.setCharacterEncoding("EUC-KR");

String file_name = request.getParameter("file_name");
String file_path = request.getRealPath("/upload");

FileInputStream fis = null;
OutputStream os = null;
File file = null;
boolean skip = false;
String client = "";



try{
	
	try{
		
		file = new File(file_path, file_name);
		fis = new FileInputStream(file);
		
	}catch(FileNotFoundException fe){
		skip = true;
	}

	client = request.getHeader("User-Agent");
	
	response.reset();
	response.setContentType("application/octet-steram");
	response.setHeader("Content-Description", "JSP Generated Data");
	
	if(!skip){
		
		// IE
		if(client.indexOf("MSIE") != -1){
			response.setHeader("Content-Disposition", "attachment; filename="+new String(file_name.getBytes("KSC5601"),"ISO8859_1"));
		}else{
			//한글파일명 처리
			file_name = new String(file_name.getBytes("EUC-KR"), "iso-8859-1");
			
			response.setHeader("Content-Disposition", "attachment; filename=\""+file_name+"\"");
			response.setHeader("Content-Type", "application/octet-stream; charset=EUC-KR");
		}
		
		response.setHeader("Content-Length", ""+file.length());
		
		os = response.getOutputStream();
		byte b[] = new byte[(int)file.length()];
		int leng = 0;
		
		while((leng = fis.read(b)) > 0){
			os.write(b,0,leng);
		}
		
	}else{
		response.setContentType("text/html;charset=EUC-KR");
	}
	
	fis.close();
	os.close();
	
}catch(Exception e){
	e.printStackTrace();
}

%>