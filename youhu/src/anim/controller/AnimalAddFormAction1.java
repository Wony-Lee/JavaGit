package anim.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import youhu.parsistence.AnimalDAOMyBatis;

public class AnimalAddFormAction1 extends AbstractAction {

	AnimalDAOMyBatis dao=new AnimalDAOMyBatis();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		this.setViewPage("/Animal/anim1Input.jsp");
		this.setRedirect(false);
	}

}
