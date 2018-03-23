package home.member;

import java.sql.*;

public class MemberDAO {
	
	//member Variables
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url;
	String user;
	String pass;
	
	//Constructor
	public MemberDAO() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("드라이버등록 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("드라이버등록 실패");
		}
		
		url = "jdbc:mysql://13.125.191.119:3306/jkh_homepage";
		user = "jkh";
		pass = "rmsghk4254";
		
	}
	
	//Methods
	public boolean checkMember(String name, String ssn1, String ssn2) {
		
		boolean ret = false;
		String sql = "select * from membership where name = '"+name+"' and ssn1 = '"+ssn1+"' and ssn2 = '"+ssn2+"';";
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ret = rs.next();
			
			con.close();
			ps.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
	public boolean isNumber(String num){
		if(!(num.length() == 6 || num.length() == 7)) {
			System.out.println("입력길이오류");
			return false;
		}
		for(int i = 0; i < num.length(); i++){
			char ch = num.charAt(i);
			if(ch < '0' || ch > '9'){
				System.out.println("숫자가 아님");
				return false;
			}
		}
		return true;
	}
	
	public int newMembership(MemberDTO info) {
		String sql = "insert into membership (name, id, passwd, ssn1, ssn2";
		int res = 0;
		if(!info.getHp1().trim().equals("")) {
			sql += ", hp1";
		}
		if(!info.getHp2().trim().equals("")) {
			sql += ", hp2";
		}
		if(!info.getHp3().trim().equals("")) {
			sql += ", hp3";
		}
		if(!info.getEmail().trim().equals("")) {
			sql += ", email";
		}
		sql += ", joindate) value ('"+info.getName()+"', '"+info.getId()+"', '"+info.getPasswd()
		+"', '"+info.getSsn1()+"', '"+info.getSsn2()+"'";
		if(!info.getHp1().trim().equals("")) {
			sql += ", '"+info.getHp1()+"'";
		}
		if(!info.getHp2().trim().equals("")) {
			sql += ", '"+info.getHp2()+"'";
		}
		if(!info.getHp3().trim().equals("")) {
			sql += ", '"+info.getHp3()+"'";
		}
		if(!info.getEmail().trim().equals("")) {
			sql += ", '"+info.getEmail()+"'";
		}
		sql += ", curTime());";
		
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			res = ps.executeUpdate();
			
			con.close();
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public boolean checkDuplication(MemberDTO info) {
		String sql = "select * from membership where id = '"+info.getId()+"';";
		boolean ret = false;
		try {
			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ret = rs.next();
			
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
