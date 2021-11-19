package sec01.ex01;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/upload.do")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String encoding= "utf-8";
		//업로드할 파일 경로를 지정합니다.
		File currentDirPath = new File("C:\\file_repo");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 파일 경로를 설정합니다.
		factory.setRepository(currentDirPath);
		// 최대 업로드 가능한 파일크기를 설정합니다.
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			// request 객체에서 매개변수를 List로 가져옵니다.
			List items = upload.parseRequest(request);
			for(int i=0; i<items.size(); i++) {
				// 파일 업로드창에서 업로드된 항목들을 하나씩 가져옵니다.
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					// 폼필드이면 전송된 매개변수 값을 출력합니다.
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
				}else {
					// 업로드한 파일이름으로 저장소에 파일을 업로드합니다.
					System.out.println("매개변수 이름:" + fileItem.getFieldName());
					System.out.println("파일이름:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
					// 폼필드가 아니면 파일 업로드 기능을 수행합니다.
					if(fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx==-1) {
							idx=fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx+1);
						// 업로드한 파일 이름을 가져옵니다.
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						fileItem.write(uploadFile);
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
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
