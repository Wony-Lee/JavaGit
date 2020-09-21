package Application.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import anim.model.AnimalVO;
import common.controller.AbstractAction;
import youhu.parsistence.AnimalDAOMyBatis;
import youhu.parsistence.ApplicationDAOMyBatis;

public class MainAction extends AbstractAction {
	
	
	ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
	AnimalDAOMyBatis adao = new AnimalDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		List<ApplicationVO> arr = dao.getAppList();
		List<AnimalVO> dogList = adao.selectByFormA("1");
		List<AnimalVO> catList = adao.selectByFormA("2");
		
		req.setAttribute("dogList", dogList);
		req.setAttribute("catList", catList);
		req.setAttribute("appList", arr);
		
		this.setViewPage("main.jsp");
		this.setRedirect(false);

	}

}
