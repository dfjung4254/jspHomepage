package home.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	//member variables
	static DataSource ds;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	//constructor
	public BoardDAO() {
		
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//methods
	public int newContents(String writer, String title, String contents, String email, String writer_id) {
		int ret = 0;
		String sql = "insert into board (writer, title, contents, email, date, views, writer_id)"
				+ "value (?,?,?,?,now(),0,?);";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, title);
			ps.setString(3, contents);
			ps.setString(4, email);
			ps.setString(5,  writer_id);
			ret = ps.executeUpdate();
			
			con.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
	public int getMaxRow() {
		int ret = 1;
		String sql = "select count(*) as 'num' from board;";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
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
	
	public ArrayList <BoardDTO> getList(int board_page, int maxRow){
		ArrayList <BoardDTO> list = new ArrayList <BoardDTO> ();
		int limit = 0;
		int index = 10;
		if(maxRow>10*board_page) {
			limit = maxRow-10*board_page;
		}else {
			index = maxRow-(board_page-1)*10;
		}
		String sql = "select * from board LIMIT "+limit+", "+index+";";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNo(rs.getInt("no"));
				board.setWriter(rs.getString("writer"));
				board.setDate(rs.getDate("date"));
				board.setViews(rs.getInt("views"));
				board.setTitle(rs.getString("title"));
				board.setContents(rs.getString("contents"));
				board.setEmail(rs.getString("email"));
				board.setWriter_id(rs.getString("writer_id"));
				list.add(board);
			}
			
			con.close();
			ps.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(list.get(0).getTitle());
		return list;
	}
	
	public BoardDTO getContents(int no) {
		BoardDTO contents = new BoardDTO();
		String sql = "select * from board where no='"+no+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				contents.setContents(rs.getString("contents"));
				contents.setDate(rs.getDate("date"));
				contents.setEmail(rs.getString("email"));
				contents.setNo(rs.getInt("no"));
				contents.setTitle(rs.getString("title"));
				contents.setViews(rs.getInt("views"));
				contents.setWriter(rs.getString("writer"));
				contents.setWriter_id(rs.getString("writer_id"));
			}
			
			con.close();
			ps.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return contents;
	}

	public int deleteContents(String no) {
		int ret = 0;
		String sql = "delete from board where no='"+no+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ret = ps.executeUpdate();
			
			con.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
	public String getValue(String valueType, String value, String returnType) {
		String ret = "";
		String sql = "select * from board where "+valueType+"='"+value+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ret = rs.getString(returnType);
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
	
	public int updateContents(int no, String title, String contents, String email) {
		int ret = 0;
		String sql = "update board set title='"+title+"', contents='"+contents+"', email='"+email+"' where no='"+no+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
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
