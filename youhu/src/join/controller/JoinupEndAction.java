package join.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import user.model.MemberVO;
import youhu.parsistence.MemberDAO;

public class JoinupEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		req.setCharacterEncoding("UTF-8");
		String name=req.getParameter("name");
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String sex=req.getParameter("sex");
		String post2=req.getParameter("post");
		String addr1=req.getParameter("addr1");
		String addr2=req.getParameter("addr2");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		int mstatez=0;
		
		System.out.println(name+"/"+id+"/"+pwd+"/"+tel+"/"+post2+"/"+sex+"/"+addr1+"/"+addr2+"/"+email);
		if(name==null||id==null||pwd==null||tel==null||name.trim().isEmpty()
				||id.trim().isEmpty()||pwd.trim().isEmpty()
				||tel.trim().isEmpty()) {
			this.setViewPage("Join.do");
			//this.setRedirect(true);
			return;
		}
		int gen = Integer.parseInt(sex);
			MemberVO mv=new MemberVO(0,name,id,pwd,gen,post2,addr1,addr2,tel,email,mstatez);
			
			MemberDAO md=new MemberDAO();
			int n= md.insertMember(mv);
			String msg=(n>0)? "회원가입 되었습니다.":"회원가입 실패!";
			String loc=(n>0)? "login.do":"javascript:history.back()";
			
			String view=CommonUtil.addMsgLoc(req, msg, loc);
			this.setViewPage(view);
			this.setRedirect(false);
		}
		

	}

	

