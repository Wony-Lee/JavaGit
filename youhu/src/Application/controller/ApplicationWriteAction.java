package Application.controller;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.ApplicationDAOMyBatis;

public class ApplicationWriteAction extends AbstractAction{
	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res)throws Exception
	{
		ServletContext sc = req.getServletContext();
		String name = req.getParameter("name");
		int sex = Integer.parseInt(req.getParameter("sex"));
		String birth = req.getParameter("birth");
		String tel = req.getParameter("tel");
		String post = req.getParameter("post");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String contents = req.getParameter("contents");
		Timestamp wdate = new Timestamp(System.currentTimeMillis());
		String midx = req.getParameter("midx");
		String down_cg = req.getParameter("down_cg");
		
		if(name==null||tel==null||addr1==null||addr2==null||name.trim().isEmpty()||
				addr1.trim().isEmpty()||addr2.trim().isEmpty()) {
			this.setViewPage("appWrite.do");
			//this.setRedirect(true);
			return;
		}
		int member = Integer.parseInt(midx);
	
		ApplicationVO appInsert = new ApplicationVO(0,name,sex,birth,tel,post,addr1,addr2,contents,wdate,member,0);
		ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
		int n = dao.applicationInsert(appInsert);
		
		String msg = (n>0)?"등록 성공":"등록 실패";
		String loc = (n>0)?"appList.do":"javascript:history.back()";
		
		
		String viewPage=CommonUtil.addMsgLoc(req, msg, loc);
		this.setViewPage(viewPage);
		this.setRedirect(false);
	}
}
