package home.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url;
	String user;
	String pass;
	
	public BookDAO() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("드라이버등록 성공");
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버등록 실패");
		}
		url = "jdbc:mysql://13.125.191.119:3306/jkh_homepage";
		user = "jkh";
		pass = "rmsghk4254";
		
	}
	
	public ArrayList <BookDTO> makeList(){
		ArrayList <BookDTO> list = new ArrayList<BookDTO>();
		String sql = "select * from booklist;";
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				BookDTO tmp = new BookDTO();
				tmp.setName(rs.getString("name"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setPublisher(rs.getString("publisher"));
				tmp.setPrice(rs.getInt("price"));
				tmp.setDay(rs.getDate("day"));
				list.add(tmp);
				
			}
			
			con.close();
			ps.close();
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean addList(BookDTO book) {
		boolean ret = addList(book.getName(), book.getWriter(), book.getPublisher(), book.getPrice());
		
		return ret;
	}
	
	public boolean addList(String name, String writer, String publisher, int price) {
		
		String sql = "insert into booklist values (?, ?, ?, ?, curTime())";
		boolean ret = false;
		
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, writer);
			ps.setString(3, publisher);
			ps.setInt(4, price);
			int res = ps.executeUpdate();
			if(res >0) {
				ret = true;
			}else {
				ret = false;
			}
			
			con.close();
			ps.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
		
	}
	
	public boolean deleteList(String[] names) {
		boolean ret = false;
		String sql = "delete from booklist where";
		for(int i = 0; i < names.length; i++) {
			if(i == 0) {
				sql += " name = '"+names[i]+"'";
			}else {
				sql += " or name = '"+names[i]+"'";
			}
		}
		sql += ";";
		
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			int rs = ps.executeUpdate();
			if(rs > 0) {
				ret = true;
			}else {
				ret = false;
			}
			
			con.close();
			ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
	public ArrayList <BookDTO> searchList(String index, String name){
		ArrayList <BookDTO> list = new ArrayList <BookDTO>();
		String sql = "select * from booklist where "+index+" like '%"+name+"%';";
		
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BookDTO tmp = new BookDTO();
				tmp.setName(rs.getString("name"));
				tmp.setPublisher(rs.getString("publisher"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setPrice(rs.getInt("price"));
				tmp.setDay(rs.getDate("day"));
				list.add(tmp);
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
