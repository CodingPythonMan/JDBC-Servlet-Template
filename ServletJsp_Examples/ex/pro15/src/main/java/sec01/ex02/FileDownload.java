package sec01.ex02;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownload
 */
@WebServlet("/download.do")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String file_repo="C:\\file_repo";
		// 매개변수로 전송된 파일 이름을 읽어옵니다.
		String fileName=(String)request.getParameter("fileName");
		System.out.println("fileName=" + fileName);
		//response에서 OutputStream 객체를 가져옵니다.
		OutputStream out = response.getOutputStream();
		String downFile=file_repo+"\\"+fileName;
		File f=new File(downFile);
		// 파일을 다운로드 할 수 있습니다.
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("content-disposition", "attachment; fileName=" + fileName);
		FileInputStream in = new FileInputStream(f);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count=in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0 ,count);
		}
		in.close();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
