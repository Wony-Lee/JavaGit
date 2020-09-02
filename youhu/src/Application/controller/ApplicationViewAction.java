package Application.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import common.controller.AbstractAction;
import youhu.parsistence.ApplicationDAOMyBatis;

public class ApplicationViewAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		//1. 게시글 번호 받아오기
		String aidx = req.getParameter("aidx");
		//2. 유효성 체크
		if(aidx==null||aidx.trim().isEmpty()) {
			this.setViewPage("main.do");
			this.setRedirect(true);
			
			return;
		}
		
		//3. dao의 회원번호 가져오기
		ApplicationVO avo = new ApplicationVO();
		ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
		
		avo = dao.AppInfo(aidx.trim());
		//4. req에 저장하기
		req.setAttribute("avo", avo);
		this.setViewPage("Application/ApplicationView.jsp");
		this.setRedirect(false);
	}

}
