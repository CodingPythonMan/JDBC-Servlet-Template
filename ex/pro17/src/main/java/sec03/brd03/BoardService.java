package sec03.brd03;

import java.util.List;

public class BoardService {

	BoardDAO boardDAO;

	public BoardService() {
		// 생성자 호출 시 BoardDAO 객체를 생성합니다.
		boardDAO = new BoardDAO();
	}
	
	public List<ArticleVO> listArticles(){
		
		List<ArticleVO> articlesList = boardDAO.selectAllArticles();
		
		return articlesList;
	}
	
	public int addArticle(ArticleVO article) {
		
		return boardDAO.insertNewArticle(article);
		
	}
}
