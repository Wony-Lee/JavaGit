package info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class hospitalAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		this.setViewPage("/info/sample.jsp"); 
		this.setRedirect(false); 
	}

}
