package info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class infoAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//System.out.println("Center�Ұ� ������");
		
		this.setViewPage("/info/infosample.jsp"); 
		this.setRedirect(false); 
	}

}
