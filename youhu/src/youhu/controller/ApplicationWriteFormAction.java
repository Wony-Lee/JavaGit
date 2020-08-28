package youhu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import common.controller.AbstractAction;
import youhu.parsistence.ApplicationDAOMyBatis;

public class ApplicationWriteFormAction extends AbstractAction {

	ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		this.setViewPage("Application/ApplicationWrite.jsp");
		this.setRedirect(false);

	}

}
