package user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import user.domain.UserVO;
import user.persistence.UserDAO;

public class SignupEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		//1. 사용자가 입력한 값 받기
		String name = req.getParameter("name");
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		String post = req.getParameter("post");
		String addr1 = req.getParameter("addr");
		String addr2 = req.getParameter("addr");
		
		int mileage = 1000;
		int mstate = 0;
		//2. 유효성 체크
		if(name==null||userid==null||pwd==null||
				name.trim().isEmpty()||userid.trim().isEmpty()||pwd.trim().isEmpty())
		{
			this.setViewPage("signup.do");
			this.setRedirect(true);
			return;
		}
		//3. UserVO객체 생성해서 1번에서 받은 값 담아주기
		UserVO user = new UserVO(0,name,userid,pwd,hp1,hp2,hp3,post,addr1,addr2,null,mileage, mstate);
		
		
		//4. UserDAO 생성해서 createUser()호출하기
		UserDAO dao = new UserDAO();
		int n = dao.createUser(user);
		
		//5. 그 결과 메시지 및 이동 경로 처리
		String msg=(n>0)? "회원가입 성공":"회원가입 실패";
		String loc=(n>0)? "index.do":"javascript:history.back()";
		
		String view = CommonUtil.addMsgLoc(req, msg, loc);
		
		this.setViewPage(view);
		this.setRedirect(false);

	}

}
