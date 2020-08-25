package youhu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import common.controller.AbstractAction;
import youhu.parsistence.ApplicationDAOMyBatis;

public class ApplicationListAction extends AbstractAction {

	ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 총 게시글 가져오기
		int totalCount = dao.getAppCount();
		
		List<ApplicationVO> arr = dao.getAppList();
		
		req.setAttribute("totalCount",totalCount);
		req.setAttribute("AppList", arr);
		this.setViewPage("../Application/ApplicationList.jsp");
		this.setRedirect(false);
	}

}
