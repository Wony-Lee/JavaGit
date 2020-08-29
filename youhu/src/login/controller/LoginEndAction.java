package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import common.exception.NotUserException;
import user.model.MemberVO;
import youhu.parsistence.MemberDAO;

public class LoginEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String userid=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		System.out.println(userid+"/"+pwd);
		if(userid==null||pwd==null||userid.trim().isEmpty()||pwd.trim().isEmpty()) {
			this.setViewPage("login.do");
			this.setRedirect(true);
			return;
		}
		
		
		MemberDAO dao=new MemberDAO();
		try {
			MemberVO user=dao.loginCheck(userid, pwd);
		
	
		if(user!=null) {
			HttpSession ses=req.getSession();
			ses.setAttribute("loginUser", user);
			
		}
		
		}catch(NotUserException e) {
			String msg=e.getMessage();
			req.setAttribute("message",msg);
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgBack(req, msg));
			return;
		}

		this.setViewPage("main.do");
		this.setRedirect(true);
	}

}
