package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.MemberVO;

public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberVO> listMembers(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		try{
			con = dataFactory.getConnection();
			String query = "select * from t_member";
			System.out.println(query);
			
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String nickName = rs.getString("nickName");
				String email = rs.getString("email");
				String route = rs.getString("route");
				String homePhone = rs.getString("homePhone");
				String phone = rs.getString("phone");
				Date birthday = rs.getDate("birthday");
				String postNum = rs.getString("postNum");
				String address = rs.getString("address");
				char kakaoMessage = rs.getString("kakaoMessage").charAt(0);
				char mailing = rs.getString("mailing").charAt(0);
				char smsReceiving = rs.getString("smsReceiving").charAt(0);
				char infoOpen = rs.getString("infoOpen").charAt(0);
				
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setNickName(nickName);
				vo.setEmail(email);
				vo.setRoute(route);
				vo.setHomePhone(homePhone);
				vo.setPhone(phone);
				vo.setBirthday(birthday);
				vo.setPostNum(postNum);
				vo.setAddress(address);
				vo.setKakaoMessage(kakaoMessage);
				vo.setMailing(mailing);
				vo.setSmsReceiving(smsReceiving);
				vo.setInfoOpen(infoOpen);
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
			con = dataFactory.getConnection();
			String id = memberVO.getId();
			String pwd = memberVO.getPwd();
			String name = memberVO.getName();
			String nickName = memberVO.getNickName();
			String email = memberVO.getEmail();
			String route = memberVO.getRoute();
			String homePhone = memberVO.getHomePhone();
			String phone = memberVO.getPhone();
			Date birthday = memberVO.getBirthday();
			String postNum = memberVO.getPostNum();
			String address = memberVO.getAddress();
			char kakaoMessage = memberVO.getKakaoMessage();
			char mailing = memberVO.getMailing();
			char smsReceiving = memberVO.getSmsReceiving();
			char infoOpen = memberVO.getInfoOpen();
			
			String query = "insert into join_member";
			query+= " (id,pwd,name,nickName,email,route,homePhone,phone,birthday,"
					+ "postNum,address,kakaoMessage,mailing,smsReceiving,infoOpen)";
			query+= " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			System.out.println("prepareStatement: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, nickName);
			pstmt.setString(5, email);
			pstmt.setString(6, route);
			pstmt.setString(7, homePhone);
			pstmt.setString(8, phone);
			pstmt.setDate(9, birthday);
			pstmt.setString(10, postNum);
			pstmt.setString(11, address);
			pstmt.setString(12, Character.toString(kakaoMessage));
			pstmt.setString(13, Character.toString(mailing));
			pstmt.setString(14, Character.toString(smsReceiving));
			pstmt.setString(15, Character.toString(infoOpen));
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delMember(String id) {
		try {
			con = dataFactory.getConnection();
			
			String query = "delete from t_member" + " where id=?";
			System.out.println("prepareStatement:" + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
