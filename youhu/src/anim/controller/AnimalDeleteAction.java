package anim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.AnimalDAOMyBatis;

public class AnimalDeleteAction extends AbstractAction {

	AnimalDAOMyBatis dao=new AnimalDAOMyBatis();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. ������ ��ǰ��ȣ �ޱ�
		String iidx=req.getParameter("iidx");
		// 2. ��ȿ�� üũ
		if(iidx==null||iidx.trim().isEmpty()) {
			this.setViewPage("/index.do");
			this.setRedirect(true);
			return;
		}
		int n=dao.animDelete(iidx.trim());
		String msg=(n>0)?"���� ����":"���� ����";
		String loc=(n>0)?"animSecure.do":"javascript:history.back()";
		String view=CommonUtil.addMsgLoc(req, msg, loc);
		this.setViewPage(view);
		this.setRedirect(false);
	}

}
