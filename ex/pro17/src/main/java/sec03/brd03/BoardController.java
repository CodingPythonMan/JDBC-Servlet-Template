package sec03.brd03;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

/**
 * Servlet implementation class BoardController
 */
//@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 글에 첨부한 이미지 저장 위치를 상수로 선언합니다.
	private static String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	BoardService boardService;
	ArticleVO articleVO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException{
    	// 서블릿 초기화 시 BoardSErvice 객체를 생성합니다.
    	boardService = new BoardService();
    	articleVO = new ArticleVO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String nextPage ="";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// 요청명을 가져옵니다.
		String action = request.getPathInfo();
		System.out.println("action: " + action);
		try {
			List<ArticleVO> articlesList = new ArrayList<ArticleVO>();
			if(action == null) {
				// 전체글을 조회합니다.
				articlesList = boardService.listArticles();
				// 조회된 글 목록을 articlesList로 바인딩한 후 listArticles.jsp로 포워딩 합니다.
				request.setAttribute("articleList", articlesList);
				nextPage = "/board02/listArticles.jsp";
			}else if(action.equals("/listArticles.do")) {
				articlesList = boardService.listArticles();
				// 조회된 글 목록을 articlesList로 바인딩한 후 listArticles로 포워딩합니다.
				request.setAttribute("articlesList", articlesList);
				nextPage ="/board02/listArticles.jsp";
			}
			// action 값 /articleForm.do로 요청 시 글쓰기창이 나타납니다.
			else if(action.equals("/articleForm.do")) {
				nextPage = "/board02/articleForm.jsp";
				// /addArticle.do로 요청 시 새 글 추가 작업을 수행합니다.
			}else if(action.equals("/addArticle.do")) {
				int articleNO = 0;
				
				// 파일 업로드 기능을 사용하기 위해 upload()로 요청을 전달합니다.
				Map<String, String> articleMap = upload(request, response);
				// articleMap에 저장된 글 정보를 다시 가져옵니다.
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String imageFileName = articleMap.get("imageFileName");
				
				// 새 글의 부모글 번호를 0으로 설정합니다.
				articleVO.setParentNO(0);
				articleVO.setId("hong");
				articleVO.setTitle(title);
				articleVO.setContent(content);
				// 글쓰기창에서 입력된 정보를 ArticleVO객체에 설정한 후 addArticle로 전달합니다. 	
				articleVO.setImageFileName(imageFileName);
				// 테이블에 새 글을 추가한 후 새 글에 대한 글 번호를 가져옵니다.
				articleNO = boardService.addArticle(articleVO);
				// 파일을 첨부한 경우에만 수행합니다.
				if(imageFileName != null && imageFileName.length() != 0) {
					// temp 폴더에 임시로 업로드 된 파일 객체를 생성합니다.
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					// CURR_IMAGE_REPO_PATH 의 경로 하위에 글 번호로 폴더를 생성합니다.
					File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
					destDir.mkdirs();
					// temp 폴더의 파일을 글 번호를 이름으로 하는 폴더로 이동시킵니다.
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
				// 새 글 등록 메시지를 나타낸 후 자바스크립트 location 객체의 href 속성을 이용해 글 목록을 요청합니다.
				PrintWriter pw = response.getWriter();
				pw.print("<script>" + " alert('새글을 추가했습니다.');"
				+ " location.href='" + request.getContextPath() + "/board/listArticles.do';" + "</script>");
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Map<String, String> articleMap = new HashMap<String, String>();
		String encoding = "utf-8";
		// 글 이미지 저장 폴더에 대해 파일 객체를 생성합니다.
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		// 이미지 크기 결정이었죠?
		factory.setSizeThreshold(1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List items = upload.parseRequest(request);
			for(int i=0; i < items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					// 파일 업로드로 같이 전송된 새 글 관련 매개변수를 Map에 (key, value)로 저장한 후 반환하고, 새글과 관련된 title, content를 Map에 저장합니다.
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				}else {
					System.out.println("파라미터 이름:" + fileItem.getFieldName());
					System.out.println("파일이름:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
					
					// 업로드한 파일이 존재하는 경우 업로드한 파일의 파일 이름으로 저장소에 업로드합니다.
					if(fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
					
						
						String fileName = fileItem.getName().substring(idx + 1);
						articleMap.put(fileItem.getFieldName(), fileName);
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
						fileItem.write(uploadFile);
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return articleMap;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

}
