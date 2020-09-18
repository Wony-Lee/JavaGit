package info.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractAction;
import info.model.infoVO;
import youhu.parsistence.infoDAO;


public class conditionAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session=req.getSession();
		String findType=req.getParameter("findType");
		String years=req.getParameter("years");
			
		session.setAttribute("findType", findType);
		session.setAttribute("years", years);
		
		infoDAO dao=new infoDAO();
		
		//������ ��ȸ
		List<infoVO> doglist=dao.selectByDog(years);
		List<infoVO> catlist=dao.selectByCat(years);
		List<infoVO> etclist=dao.selectByEtc(years);
		
		//��ġ���� ��ȸ
		List<infoVO> alist=dao.selectByArea(years);
		
		req.setAttribute("findType", findType);
		req.setAttribute("years", years);
		
		this.setViewPage("/info/presentCondition.jsp");
		this.setRedirect(false);
	}

}
