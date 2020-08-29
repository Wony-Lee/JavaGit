package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;


public class LoginAction extends AbstractAction {


	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		this.setViewPage("Join/login2.jsp");
		this.setRedirect(false);

	}
   


}
