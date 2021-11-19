package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import crypt.BCrypt;
import crypt.SHA256;
import model.MemberVO;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		 return instance;
	}
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List listMembers() {
		List list = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = "select * from member1 ";
			System.out.println("prepareStatement: " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String id=rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPasswd(passwd);
				vo.setName(name);
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void addMember(MemberVO memberVO) {
		try {
			//SHA-256를 사용하는 SHA256 클래스의 객체를 얻어낸다.
			SHA256 sha = SHA256.getInsatnce();
			
			Connection con = dataFactory.getConnection();
			String id=memberVO.getId();
			String pwd = memberVO.getPasswd();
			String name= memberVO.getName();
			
			//SHA-256방식으로 암호화된 값을 다시 BCrypt클래스의
			//hashpw()메소드를 사용해서 bcrypt방식으로 암호화
			//BCrypt.gensalt()메소드는 salt값을 난수를 사용해 생성
			String bcPass = BCrypt.hashpw(pwd, BCrypt.gensalt());
			
			String query = "insert into member1";
			query += " (id, passwd, name)";
			query += " values(?,?,?)";
			System.out.println("prepareStatement: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, bcPass);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int loginMember(MemberVO memberVO) {
		ResultSet rs = null;
		int x = -1;
		try {
			//SHA-256를 사용하는 SHA256클래스의 객체를 얻어낸다.
			SHA256 sha = SHA256.getInsatnce();
			Connection con = dataFactory.getConnection();
			String id = memberVO.getId();
			String password = memberVO.getPasswd();
			
			pstmt = con.prepareStatement("select passwd from member1 where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {// 해당 아이디가 있으면 수행
				String hashedPassword = rs.getString("passwd");
				//암호화 패스워드 인증
				boolean checkPw = BCrypt.checkpw(password, hashedPassword);
				
				if(checkPw) {
					x=1; // 인증 성공
				}else {
					x=0; // 비밀번호 틀림
				}
				
			}else {//해당 아이디 없으면 수행
				x=-1; // 아이디 없음
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException ex) {
					
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException ex) {
					
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException ex) {	
				}
			}
		}
		return x;
	}
}
