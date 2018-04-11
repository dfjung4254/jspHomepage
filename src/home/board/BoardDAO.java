package home.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	//member variables
	static DataSource ds;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
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
	public ArrayList <BoardDTO> getList(int page_no){
		ArrayList <BoardDTO> list = new ArrayList <BoardDTO>();
		int maxSet = page_no*10;
		int minSet = page_no*10-11;
		String sql = "select * from board where list_index < ? and list_index > ?;";
		
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, maxSet);
			ps.setInt(2, minSet);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO contents = new BoardDTO();
				contents.setNo(rs.getInt("no"));
				contents.setWriter(rs.getString("writer"));
				contents.setWriter_id(rs.getString("writer_id"));
				contents.setWriter_ip(rs.getString("writer_ip"));
				contents.setTitle(rs.getString("title"));
				contents.setContents(rs.getString("contents"));
				contents.setEmail(rs.getString("email"));
				contents.setViews(rs.getInt("views"));
				contents.setList_index(rs.getInt("list_index"));
				contents.setList_indexLevel(rs.getInt("list_indexLevel"));
				contents.setDate(rs.getString("date"));
				
				
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
	
	public int getCount() {
		int ret = 0;
		String sql = "select count(*) as num from board;";
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
	
	public int insertContents(String writer, String writer_id, String writer_ip, String title, String contents, String email, int list_index, int list_indexLevel) {
		int ret = 0;
		
		String sql = "insert into board (writer, writer_id, writer_ip, title, contents, email, views, list_index, list_indexLevel, date)"
				+ " values (?, ?, ?, ?, ?, ?, 0, ?, ?, now());";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement("update board SET list_index=list_index+1 where list_index>="+list_index+";");
			ps.executeUpdate();
			
			ps = con.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, writer_id);
			ps.setString(3, writer_ip);
			ps.setString(4, title);
			ps.setString(5, contents);
			ps.setString(6, email);
			ps.setInt(7, list_index);
			ps.setInt(8, list_indexLevel);
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
