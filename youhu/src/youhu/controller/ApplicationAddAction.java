package youhu.controller;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Application.model.ApplicationVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.ApplicationDAOMyBatis;

public class ApplicationAddAction extends AbstractAction{
	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res)throws Exception
	{
		ServletContext sc = req.getServletContext();
		String name = req.getParameter("name");
		int sex = Integer.parseInt(req.getParameter("sex"));
		String birth = req.getParameter("birth");
		int tel = Integer.parseInt(req.getParameter("tel"));
		int post = Integer.parseInt(req.getParameter("post"));
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String contents = req.getParameter("contents");
		Timestamp wdate = new Timestamp(System.currentTimeMillis());
		
		ApplicationVO item = new ApplicationVO(0,name,sex,birth,tel,post,addr1,addr2,contents,wdate);
		ApplicationDAOMyBatis dao = new ApplicationDAOMyBatis();
		int n = dao.applicationInsert(item);
		
		String msg = (n>0)?"등록 성공":"등록 실패";
		String loc = (n>0)?"ApplicationList.jsp":"javascript:history.back()";
		
		String viewPage=CommonUtil.addMsgLoc(req, msg, loc);
		this.setViewPage(viewPage);
		this.setRedirect(false);
	}
}
