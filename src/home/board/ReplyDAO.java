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
	
	public int countReply(int board_no) {
		int ret = 0;
		String sql = "select count(*) as num from board_reply where board_no=?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ret = rs.getInt("num");
			}
			
			con.close();
			ps.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
	public int insultReply(ReplyDTO contents) {
		int ret = 0;
		String sql = "insert into board_reply (board_no, writer, writer_id, writer_ip, contents, line_number, isReply) "
				+"values (?, ?, ?, ?, ?, ?, ?);";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, contents.getBoard_no());
			ps.setString(2, contents.getWriter());
			ps.setString(3, contents.getWriter_id());
			ps.setString(4, contents.getWriter_ip());
			ps.setString(5, contents.getContents());
			ps.setInt(6, contents.getLine_number());
			ps.setInt(7, contents.getIsReply());
			ret = ps.executeUpdate();
			
			con.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
}
