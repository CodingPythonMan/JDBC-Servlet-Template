package mail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 * Servlet implementation class SMTPMailSend
 */
@WebServlet("/sendmail")
public class SMTPMailSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SMTPMailSend() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long beginTime = System.currentTimeMillis();
		//SimpleEmail 클래스를 인스턴스화 하여 simpleEmail 객체를 생성한다.
		SimpleEmail simpleEmail = new SimpleEmail();
		
		//Smtp 서버 연결 설정.(구글 아이디, 패스워드)
		simpleEmail.setHostName("smtp.gmail.com");
		simpleEmail.setSmtpPort(465);
		simpleEmail.setAuthentication("jeneximoon", "religious!97");
		
		request.setCharacterEncoding("utf-8");
		String fromEmail = request.getParameter("fromEmail");
		String fromName = request.getParameter("fromName");
		String toEmail = request.getParameter("toEmail");
		String toName = request.getParameter("toName");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		String rt="Failure";
		try {
			//Smtp SSL, TLS 설정
			simpleEmail.setSSL(true);
			simpleEmail.setTLS(true);
			//받는 사람 설정
			simpleEmail.addTo(toEmail, toName, "utf-8");
			//보내는 사람 설정
			simpleEmail.setFrom(fromEmail, fromName, "utf-8");
			//제목 설정
			simpleEmail.setSubject(subject);
			//본문 설정
			simpleEmail.setMsg(content);
			rt=simpleEmail.send();
			
			System.out.println("메일 전송 완료");
			
			response.sendRedirect("mailForm.jsp");
		}catch(EmailException e) {
			System.out.println("Error:" +e);
		}finally {
			long execTime = System.currentTimeMillis() - beginTime;
			System.out.println("exec time : " + execTime + "ms");
			System.out.println("RT Msg : " + rt);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
