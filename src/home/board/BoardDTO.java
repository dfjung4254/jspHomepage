package home.board;

import java.util.Date;

public class BoardDTO {
	
	//member variables
	private int no;
	private String writer;
	private String writer_id;
	private String writer_ip;
	private String title;
	private String contents;
	private String email;
	private int views;
	private int list_index;
	private int list_indexLevel;
	private String date;
	
	//constructor
	public BoardDTO() {
		
	}
	//methods(setter / getter)
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getWriter_ip() {
		return writer_ip;
	}

	public void setWriter_ip(String writer_ip) {
		this.writer_ip = writer_ip;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getList_index() {
		return list_index;
	}

	public void setList_index(int list_index) {
		this.list_index = list_index;
	}

	public int getList_indexLevel() {
		return list_indexLevel;
	}

	public void setList_indexLevel(int list_indexLevel) {
		this.list_indexLevel = list_indexLevel;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
}
