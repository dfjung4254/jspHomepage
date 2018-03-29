package home.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	//member Variables
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
//	String url;
//	String user;
//	String pass;
	
	static DataSource ds;
	static {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Constructor
	public MemberDAO() {
		
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			System.out.println("드라이버등록 성공");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			System.out.println("드라이버등록 실패");
//		}
		
//		url = "jdbc:mysql://13.125.191.119:3306/jkh_homepage";
//		user = "jkh";
//		pass = "rmsghk4254";
		
	}
	
	//Methods
	public boolean checkMember(String name, String ssn1, String ssn2) {
		
		boolean ret = false;
		String sql = "select * from membership where name = '"+name+"' and ssn1 = '"+ssn1+"' and ssn2 = '"+ssn2+"';";
		try {
			con = ds.getConnection();
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
			con = ds.getConnection();
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
			con = ds.getConnection();
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
	
	public ArrayList <MemberDTO> newMemberList(){
		ArrayList <MemberDTO> list = new ArrayList <MemberDTO> ();
		String sql = "select * from membership;";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setEmail(rs.getString("email"));
				member.setHp1(rs.getString("hp1"));
				member.setHp2(rs.getString("hp2"));
				member.setHp3(rs.getString("hp3"));
				member.setJoindate(rs.getString("joindate"));
				list.add(member);
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
	
	public ArrayList <MemberDTO> newMemberList(int no){
		ArrayList <MemberDTO> list = new ArrayList <MemberDTO> ();
		String sql = "select * from membership where no='"+no+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setEmail(rs.getString("email"));
				member.setHp1(rs.getString("hp1"));
				member.setHp2(rs.getString("hp2"));
				member.setHp3(rs.getString("hp3"));
				member.setJoindate(rs.getString("joindate"));
				list.add(member);
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
	
	public ArrayList <MemberDTO> newMemberList(String id){
		ArrayList <MemberDTO> list = new ArrayList <MemberDTO> ();
		String sql = "select * from membership where id='"+id+"';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setEmail(rs.getString("email"));
				member.setHp1(rs.getString("hp1"));
				member.setHp2(rs.getString("hp2"));
				member.setHp3(rs.getString("hp3"));
				member.setJoindate(rs.getString("joindate"));
				list.add(member);
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
	
	public int memberDelete(int no) {
		String sql = "delete from membership where no='"+no+"';";
		int ret = 0;
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
	
	public int memberUpdate(MemberDTO dto) {
		System.out.println(dto.getNo());
		int ret = 0;
		String sql = "update membership set name='"+dto.getName()+"', ssn1='"+dto.getSsn1()+"', ssn2='"
				+dto.getSsn2()+"', email='"+dto.getEmail()+"', hp1='"+dto.getHp1()+"', hp2='"+dto.getHp2()+"', hp3='"
				+dto.getHp3()+"', passwd='"+dto.getPasswd()+"' where no='"+dto.getNo()+"';";
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
	
	public ArrayList <MemberDTO> getMemberList (String index, String value1){
		ArrayList <MemberDTO> list = new ArrayList <MemberDTO>();
		String sql = "select * from membership where "+index+" like '%"+value1+"%';";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setEmail(rs.getString("email"));
				member.setHp1(rs.getString("hp1"));
				member.setHp2(rs.getString("hp2"));
				member.setHp3(rs.getString("hp3"));
				member.setJoindate(rs.getString("joindate"));
				list.add(member);
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
	
	public ArrayList <MemberDTO> getMemberList (String index, String value1, String value2){
		ArrayList <MemberDTO> list = new ArrayList <MemberDTO>();
		String sql = "select * from membership where ("+index+"1 like '%"+value1+"%') and ("+index+"2 like '%"+value2+"%');";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setEmail(rs.getString("email"));
				member.setHp1(rs.getString("hp1"));
				member.setHp2(rs.getString("hp2"));
				member.setHp3(rs.getString("hp3"));
				member.setJoindate(rs.getString("joindate"));
				list.add(member);
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
	
	public ArrayList <MemberDTO> getMemberList (String index, String value1, String value2, String value3){
		ArrayList <MemberDTO> list = new ArrayList <MemberDTO>();
		String sql = "select * from membership where ("+index+"1 like '%"+value1+"%') and ("+index+"2 like '%"+value2+"%') and ("+index+"3 like '%"+value3+"%');";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setEmail(rs.getString("email"));
				member.setHp1(rs.getString("hp1"));
				member.setHp2(rs.getString("hp2"));
				member.setHp3(rs.getString("hp3"));
				member.setJoindate(rs.getString("joindate"));
				list.add(member);
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
	
	public boolean checkId(String id, String passwd) {
		boolean ret = false;
		String sql = "select * from membership where (id = '"+id+"') and (passwd = '"+passwd+"');";
		try {
			con = ds.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ret = rs.next();
			if(ret) {
				System.out.println("로그인정보 DB 존재 -> ID : "+id+" PASSWD : "+passwd);
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
	
}
