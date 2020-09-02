package Board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.BoardVO;
import common.controller.AbstractAction;
import youhu.parsistence.BoardDAOMyBatis;

public class BoardListAction extends AbstractAction {

	BoardDAOMyBatis dao = new BoardDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		int totalCount = dao.getBoardCount();
		
		List<BoardVO> arr = dao.getBoardList();
				
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("boardList", arr);
		this.setViewPage("./FreeBoard/BoardList.jsp");
		this.setRedirect(false);
	}

}
