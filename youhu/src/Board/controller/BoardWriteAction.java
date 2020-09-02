package Board.controller;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Board.model.BoardVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.BoardDAOMyBatis;

public class BoardWriteAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ServletContext sc = req.getServletContext();
		
		String subject = req.getParameter("subject");
		String name = req.getParameter("name");
		Timestamp indate = new Timestamp(System.currentTimeMillis());
		String midx = req.getParameter("midx");
		String contents = req.getParameter("contents");
		String down_cg = req.getParameter("down_cg");
		
		if(subject==null||name==null||contents==null||
				subject.trim().isEmpty()||name.trim().isEmpty()||
				contents.trim().isEmpty()) 
		{
			this.setViewPage("boradWrite.do");
			return;
		}
		
		int member = Integer.parseInt(midx);

		BoardVO boardInsert = new BoardVO(0,subject,name,contents,indate,member,0);
		BoardDAOMyBatis dao = new BoardDAOMyBatis();
		int n = dao.boardInsert(boardInsert);
		
		String msg = (n>0)?"등록 성공":"등록 실패";
		String loc = (n>0)?"BoardList.do":"javascript:history.back()";
		
		String viewPage=CommonUtil.addMsgLoc(req, msg, loc);
		
		this.setViewPage(viewPage);
		this.setRedirect(false);
	}

}
