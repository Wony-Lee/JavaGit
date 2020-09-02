package Board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.BoardVO;
import common.controller.AbstractAction;
import youhu.parsistence.BoardDAOMyBatis;

public class BoardViewAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 게시글 번호 받아오기
		
		String bidx = req.getParameter("bidx");
		
		// 유효성 체크
		if(bidx==null||bidx.trim().isEmpty())
		{
			this.setViewPage("boardList.do");
			this.setRedirect(true);
			return;
		}
		
		BoardVO bvo = new BoardVO();
		BoardDAOMyBatis dao = new BoardDAOMyBatis();
		
		bvo = dao.boardInfo(bidx.trim());
		req.setAttribute("bvo", bvo);
		this.setViewPage("FreeBoard/BoardView.jsp");
		this.setRedirect(false);

	}

}
