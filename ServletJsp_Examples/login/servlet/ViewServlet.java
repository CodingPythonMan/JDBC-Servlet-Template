package join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/viewMembers")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List membersList = (List) request.getAttribute("membersList");
		out.print("<html><body>");
		out.print("<table border=1><tr align='center' bgcolor='lightgreen'>");
		out.print("<td>아이디</td><td>비밀번호</td><td>이름</td><td>닉네임</td><td>이메일</td>"
				+ "<td>가입경로</td><td>전화번호</td><td>휴대폰번호</td><td>생년월일</td><td>우편번호</td><td>주소</td>"
				+ "<td>카카오톡메세지</td><td>메일링서비스</td><td>SMS수신여부</td><td>정보공개</td><td>삭제</td></tr>");
		
		for(int i=0; i<membersList.size(); i++) {
			MemberVO memberVO = (MemberVO) membersList.get(i);
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
			out.println("<tr><td>" + id + "</td><td>" + pwd + "</td><td>" + name + "</td><td>"
						+ nickName + "</td><td>" + email + "</td><td>" + route + "</td><td>"
						+ homePhone + "</td><td>" + phone + "</td><td>" + birthday + "</td><td>"
						+ postNum + "</td><td>" + address + "</td><td>" + kakaoMessage + "</td><td>"
						+ mailing + "</td><td>" + smsReceiving + "</td><td>" + infoOpen + "</td><td>"
						+ "아직없음</td></tr>");
		}
		out.print("</table></body></html>");
		out.print("<a href='/login/join.html'>새 회원 등록하기</a>");
		/*
		System.out.println("아이디\t: " + id);
		System.out.println("비밀번호\t: " + pwd);
		System.out.println("이름\t: " + name);
		System.out.println("닉네임\t: " + nickName);
		System.out.println("이메일\t: " + email);
		System.out.println("가입경로\t: " + route);
		System.out.println("전화번호\t: " + homePhone);
		System.out.println("휴대폰번호\t: " + phone);
		System.out.println("생일\t: " + birthday);
		System.out.println("주소\t: " + address);
		System.out.println("카카오톡 메세지\t: " + kakaoMessage);
		System.out.println("메일링 서비스\t: " + smsReceiving);
		System.out.println("문자 수신\t: " + smsReceiving);
		System.out.println("정보공개\t: " + infoOpen);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
