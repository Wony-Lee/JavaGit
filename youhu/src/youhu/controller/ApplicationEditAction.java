package youhu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.ApplicationDAOMyBatis;

public class ApplicationEditAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String aidx = req.getParameter("midx");
		String midx = req.getParameter("midx");
		
		if(aidx==null||midx==null||aidx.trim().isEmpty()||midx.trim().isEmpty())
		{
			this.setViewPage("edit.do");
			this.setRedirect(true);
			return;
		}
		int member = Integer.parseInt(midx);
		ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
		ApplicationVO avo = dao.AppInfo(midx);
		if(avo==null) {
			String viewPage=CommonUtil.addMsgBack(req, "해당 글이 존재하지 않습니다.");
			this.setViewPage(viewPage);
			this.setRedirect(false);
			return;
		}
		
		this.setRedirect(true);
		this.setViewPage("appList.do");
	}

}
