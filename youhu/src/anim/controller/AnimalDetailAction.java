package anim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import anim.model.AnimalVO;
import common.controller.AbstractAction;
import youhu.parsistence.AnimalDAOMyBatis;

public class AnimalDetailAction extends AbstractAction {

	AnimalDAOMyBatis dao=new AnimalDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. ��ǰ ��ȣ �޾ƿ���
		String iidx=req.getParameter("iidx");
		// 2. ��ȿ�� üũ
		if(iidx==null||iidx.trim().isEmpty()) {
			this.setViewPage("Yuhuhu/index.do");
			this.setRedirect(true);
			return;
		}
		
		//3. dao�� productInfo(��ǰ��ȣ) ȣ���ϱ�
		AnimalVO anim=dao.animInfo(iidx.trim());
		
		//4. req�� �����ϱ�
		req.setAttribute("anim", anim);
		
		this.setViewPage("/Animal/animView.jsp");
		this.setRedirect(false);
	}

}
