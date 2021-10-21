package join;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class joinTest
 */
@WebServlet("/joinTest")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
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
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		String email = request.getParameter("email");
		String route = request.getParameter("route");
		String homePhone = request.getParameter("homePhone");
		String phone = request.getParameter("phone");
		String birthday = request.getParameter("birthday");
		String address = request.getParameter("address");
		String kakaoMessage = request.getParameter("kakaoMessage");
		String mailing = request.getParameter("mailing");
		String smsReceiving = request.getParameter("smsReceiving");
		String infoOpen = request.getParameter("infoOpen");
		
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
		System.out.println("정보공개\t: " + infoOpen);
		
		if(id == null || (id.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("아이디를 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		if(pwd == null || (pwd.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("비밀번호를 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		if(name == null || (name.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("이름을 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		if(nickName == null || (nickName.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("닉네임을 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		if(email == null || (email.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("이메일을 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		if(phone == null || (phone.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("휴대폰 번호를 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		if(birthday == null || (birthday.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("생일을 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		if(address == null || (address.length()==0)) {
			out.print("<html>");
			out.print("<body>");
			out.print("주소를 입력하세요!!!");
			out.print("<br>");
			out.print("<a href='http://localhost:8080/login/join.html'>"
					+ "회원가입 창으로 이동 </a>");
			out.print("</body>");
			out.print("</html>");
		}
		
		out.print("<html>");
		out.print("<body>");
		out.print("<h2>" + id + "님!! 회원가입을 축하합니다.<h2>");
		out.print("<h4>자유롭게 사이트를 이용해주세요.</h4>");
		out.print("</body>");
		out.print("</html>");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
