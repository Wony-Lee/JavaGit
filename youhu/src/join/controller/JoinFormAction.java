package join.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;


public class JoinFormAction extends AbstractAction {
    
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		this.setViewPage("Join/Join.jsp");
		this.setRedirect(false);

	}

	}
 


