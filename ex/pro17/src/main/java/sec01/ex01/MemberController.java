package sec01.ex01;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/mem.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    MemberDAO memberDAO;   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		memberDAO = new MemberDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 요청에 대해 회원 정보를 조회합니다.
		List<MemberVO> membersList = memberDAO.listMembers();
		// 조회한 회원정보를 request에 바인딩합니다.
		request.setAttribute("membersList", membersList);
		// 컨트롤러에서 표시하고자 하는 JSP로 포워딩합니다.
		RequestDispatcher dispatch = request.getRequestDispatcher("/test01/listMembers.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
