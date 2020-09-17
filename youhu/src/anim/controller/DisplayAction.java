package anim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import youhu.parsistence.AnimalDAOMyBatis;

public class DisplayAction extends AbstractAction {

	AnimalDAOMyBatis pdao=new AnimalDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/**List<AnimalVO> dogList=pdao.selectByForm("0");
		List<AnimalVO> catList=pdao.selectByForm("1");
		List<AnimalVO> gitaList=pdao.selectByForm("2");
		
		req.setAttribute("form1", "��");
		req.setAttribute("DOGList", dogList);
		
		req.setAttribute("form2", "�����");
		req.setAttribute("CATList", catList);
		
		req.setAttribute("form3", "��Ÿ");
		req.setAttribute("GITAList", gitaList);
		
		this.setViewPage("/form.jsp");
		this.setRedirect(false);*/
	}

}
