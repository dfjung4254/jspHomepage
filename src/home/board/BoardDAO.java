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
		String sql = "select * from board where list_index < ? and list_index > ? order by list_index;";
		
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
	
	public BoardDTO getContents(int no) {
		BoardDTO contents = new BoardDTO();
		String sql = "select * from board where no=?;";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
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
	
	public void plusViewCounts(int no) {
		String sql = "update board set views=views+1 where no=?";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			con.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getValue(String valueType, String value, String getType) {
		String ret = "";
		String sql = "select * from board where "+valueType+"='"+value+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				if(getType.equals("no") || getType.equals("views") || getType.equals("list_index") || getType.equals("list_indexLevel")) {
					ret = String.valueOf(rs.getInt(getType));
				}else {
					ret = rs.getString(getType);
				}
			}
			
			con.close();
			ps.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("DB 불러온 값 : "+ret);
		return ret;
	}
	
	public int deleteContents(int no, int list_index) {
		int ret = 0;
		
		String sql = "delete from board where no=?;";
		try {
			con = ds.getConnection();
			//list_index 1씩 감소
			ps = con.prepareStatement("update board set list_index=list_index-1 where list_index>?;");
			ps.setInt(1, list_index);
			ps.executeUpdate();
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ret = ps.executeUpdate();
			
			con.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}
	
	public int deleteContents_update(int no, int list_indexLevel) {
		int ret = 0;
		String title = "삭제된게시글입니다";
		String sql = "update board SET title='"+title+"' where no="+no+";";
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
	
	public boolean checkAnswer(int list_index) {
		boolean ret = false;
		int list_indexLevel = 0;
		int list_searchLevel = 0;
		String sql = "select list_indexLevel from board where list_index='"+list_index+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				list_indexLevel = rs.getInt("list_indexLevel");
			}
			
			ps = con.prepareStatement("select list_indexLevel from board where list_index='"+(list_index+1)+"';");
			rs = ps.executeQuery();
			while(rs.next()) {
				list_searchLevel = rs.getInt("list_indexLevel");
			}
			if(list_indexLevel < list_searchLevel) {
				//답글존재
				ret = true;
			}else {
				//답글존재x
				ret = false;
			}
			
			System.out.println(ret);
			System.out.println(list_indexLevel);
			System.out.println(list_searchLevel);
			
			con.close();
			ps.close();
			rs.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}

}
