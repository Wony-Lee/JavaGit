package Application.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.ApplicationDAOMyBatis;

public class ApplicationEditAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
			
		String aidx = req.getParameter("aidx");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String sex = req.getParameter("sex");
		String tel = req.getParameter("tel");
		String post = req.getParameter("post");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String contents = req.getParameter("contents");
	

		if(aidx==null||name==null||tel==null||post==null||
				aidx.trim().isEmpty()||name.trim().isEmpty()
				||tel.trim().isEmpty()||post.trim().isEmpty()) {
			
			this.setViewPage("appEdit.do");
			this.setRedirect(true);
			return;
		}
		
		int aidx_int = Integer.parseInt(aidx.trim());
		int gen = Integer.parseInt(sex);
		ApplicationVO avo = new ApplicationVO(aidx_int,name,gen,birth,tel,post,addr1,addr2,contents);
		
		ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
		
		int n = dao.applicationUpdate(avo);
		
		String msg = (n>0)?"수정 성공":"수정 실패";
		String loc = (n>0)?"appList.do":"javascript:history.back()";
		
		this.setViewPage(CommonUtil.addMsgLoc(req, msg, loc));
		this.setRedirect(false);
	}

}
