package home.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReplyDAO {

	//member variables
	static DataSource ds;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//constructor
	public ReplyDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//methods
	public ArrayList <ReplyDTO> getList(int board_no){
		ArrayList <ReplyDTO> list = new ArrayList <ReplyDTO>();
		String sql = "select * from board_reply where board_no=? order by line_number";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ReplyDTO contents = new ReplyDTO();
				contents.setBoard_no(rs.getInt("board_no"));
				contents.setWriter(rs.getString("writer"));
				contents.setWriter_id(rs.getString("writer_id"));
				contents.setWriter_ip(rs.getString("writer_ip"));
				contents.setContents(rs.getString("contents"));
				contents.setLine_number(rs.getInt("line_number"));
				contents.setIsReply(rs.getInt("isReply"));
				
				list.add(contents);
			}
			
			con.close();
			ps.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
}
