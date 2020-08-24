package user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import user.domain.UserVO;
import user.persistence.UserDAO;

public class LoginEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 아이디와 비밀번호 값 받아오기.
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		// 2. 유효성 체크
		if (userid == null || pwd == null || userid.trim().isEmpty() || pwd.trim().isEmpty()) {
			this.setViewPage("signin.do");
			this.setRedirect(true);
			return;
		}

		// 3. UserDAO의 loginCheck(아이디, 비번) 메소드 호출하여 UserVO 받기
		UserDAO dao = new UserDAO();
		try {
			UserVO user = dao.loginCheck(userid, pwd);
			// 4. 예외 처리 try catch로 하기
			// 5. UserVO가 null이 아니라면 ==> 회원 인증받은 것이므로
			// 세션에 해당 VO 객체를 저장. "loginUser"라는 키값으로
			if (user != null) {
				HttpSession ses = req.getSession();
				ses.setAttribute("loginUser", user);
			}
		} catch (Exception e) {
			String msg = e.getMessage();
			this.setRedirect(false);
			this.setViewPage(CommonUtil.addMsgBack(req, msg));
			return;
		}
		this.setRedirect(true);
		this.setViewPage("index.do");
	}

}
