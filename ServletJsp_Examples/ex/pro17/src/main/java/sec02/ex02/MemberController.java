package sec02.ex02;

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
// 브라우저 요청시 두단계로 요청이 이루어집니다.
@WebServlet("/member/*")
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
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action: " + action);
		
		// 최초 요청이거나 action 값이 /memberList.do 면 회원 목록을 출력합니다.
		if(action == null || action.equals("/listMembers.do"))
		{
			List<MemberVO> membersList = memberDAO.listMembers();
			request.setAttribute("membersList", membersList);
			nextPage = "/test03/listMembers.jsp";
		}else if(action.equals("/addMember.do")) {
			String id= request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVO memberVO = new MemberVO(id, pwd, name, email);
			memberDAO.addMember(memberVO);
			// 회원 등록 후 다시 회원 목록을 출력합니다.
			nextPage = "/member/listMembers.do";
			// action 값이 /memberForm.do면 회원 가입창을 화면에 출력합니다.
		}else if(action.equals("/memberForm.do")) {
			// test02 폴더의 memberForm.jsp로 포워딩합니다.
			nextPage = "/test02/memberForm.jsp";
			// 그 외 다른 action 값은 회원 목록을 출력합니다.
		}// 회원 수정창 요청 시 ID로 회원 정보를 조회한 후 수정창으로 포워딩합니다.
		else if(action.equals("/modMemberForm.do")) {
			String id = request.getParameter("id");
			// 회원 정보 수정창을 요청하면서 전송된 ID를 이용해 수정전 회원정보를 조회합니다.
			MemberVO memInfo = memberDAO.findMember(id);
			// request에 바인딩하여 회원 정보 수정창에 수정하기 전 회원정보를 전달합니다.
			request.setAttribute("memInfo", memInfo);
			nextPage = "/test03/modMemberForm.jsp";
		}// 테이블의 회원정보를 수정합니다.
		else if(action.equals("/modMember.do")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberVO memberVO = new MemberVO(id,pwd,name,email);
			memberDAO.modMember(memberVO);
			// 회원 목록창으로 수정작업 완료 메세지를 전달합니다.
			request.setAttribute("msg", "modified");
			nextPage = "/member/listMembers.do";
		}// 회원 ID를 SQL문으로 전달해 테이블의 회원정보를 삭제합니다.
		else if(action.equals("/delMember.do")) {
			// 삭제할 ID를 받아옵니다.
			String id = request.getParameter("id");
			memberDAO.delMember(id);
			request.setAttribute("msg", "deleted");
			nextPage = "/member/listMembers.do";
		}
		else {
			// 요청에 대해 회원 정보를 조회합니다.
			List<MemberVO> membersList = memberDAO.listMembers();
			// 조회한 회원정보를 request에 바인딩합니다.
			request.setAttribute("membersList", membersList);
			nextPage = "/test03/listMembers.jsp";
		}
		// 컨트롤러에서 표시하고자 하는 JSP로 포워딩합니다.
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
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
