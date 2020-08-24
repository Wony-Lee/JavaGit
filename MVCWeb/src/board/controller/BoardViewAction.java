package board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardVO;
import common.controller.AbstractAction;

public class BoardViewAction extends AbstractAction {

	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//1. 글번호 받기
		String idx = req.getParameter("idx");
		//2. 유효성 체크 => list.do로 redirect 이동
		if(idx==null|idx.trim().isEmpty())
		{
			this.setViewPage("list.do");
			this.setRedirect(true);
			
			return;
		}
		
		BoardDAO dao = new BoardDAO();
		// 조회수 증가
		boolean b=dao.updateReadnum(idx);
		//3. BoardDAO 생성 후 viewBoard(idx) 호출
		BoardVO board = dao.viewBoard(Integer.parseInt(idx.trim()));
		//4. ==> 반한된 BoardVO를 req에 저장
		req.setAttribute("board", board);
		this.setViewPage("boardView.jsp");
		this.setRedirect(false);
	}

}
