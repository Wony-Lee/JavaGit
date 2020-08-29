package join.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import user.model.MemberVO;
import youhu.parsistence.MemberDAO;


public class UserListAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		MemberDAO dao=new MemberDAO();
		
		List<MemberVO> userList=dao.listMember();
		
		req.setAttribute("userList", userList);
		this.setViewPage("Join/members.jsp");
		this.setRedirect(false);
	}

}
