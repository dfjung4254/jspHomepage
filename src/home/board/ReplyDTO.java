package home.board;

public class ReplyDTO {
	
	//member variables
	private int board_no;
	private String writer;
	private String writer_id;
	private String writer_ip;
	private String contents;
	private int line_number;
	private int isReply;
	
	//constructor
	public ReplyDTO() {
		
	}
	
	//setter - getter
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getLine_number() {
		return line_number;
	}

	public void setLine_number(int line_number) {
		this.line_number = line_number;
	}

	public int getIsReply() {
		return isReply;
	}

	public void setIsReply(int isReply) {
		this.isReply = isReply;
	}
	
	

}
