package sec03.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class JsonServlet2
 */
@WebServlet("/json3")
public class JsonServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//배열을 저장할 totalObject를 선언합니다.
		JSONObject totalObject = new JSONObject();
		// memberInfo JSON 객체를 저장할 membersArray 배열을 선언합니다.
		JSONArray membersArray = new JSONArray();
		// 회원 한명의 정보가 들어갈 memberinfo json 객체를 선언합니다.
		JSONObject memberInfo = new JSONObject();
		// 회원 정보를 name/value 쌍으로 저장합니다.
		memberInfo.put("name", "박지성");
		memberInfo.put("age", "25");
		memberInfo.put("gender", "남자");
		memberInfo.put("nickname", "날센돌이");
		membersArray.add(memberInfo);
		
		memberInfo = new JSONObject();
		memberInfo.put("name", "김연아");
		memberInfo.put("age", "21");
		memberInfo.put("gender", "여자");
		memberInfo.put("nickname", "칼치");
		membersArray.add(memberInfo);
		// 회원 정보를 저장한 배열을 배열 이름 members로 totalObject에 저장합니다.
		totalObject.put("members", membersArray);
		
		JSONArray bookArray = new JSONArray();
		JSONObject bookInfo = new JSONObject();
		bookInfo.put("title", "초보자를 위한 자바 프로그래밍");
		bookInfo.put("writer", "이승찬");
		bookInfo.put("price", "12000");
		bookInfo.put("genre", "IT");
		bookInfo.put("image", "http://localhost:8080/pro16/image/Val.png");
		bookArray.add(bookInfo);
		
		// totalObject에 members라는 name으로 membersArray를 value로 저장합니다.
		totalObject.put("books", bookArray);
		
		String jsonInfo = totalObject.toJSONString();
		System.out.println(jsonInfo);
		out.print(jsonInfo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
