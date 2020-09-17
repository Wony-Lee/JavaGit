package anim.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import anim.model.AnimalVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.AnimalDAOMyBatis;

public class AnimalUpdateAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//1. ���ε��� ���丮 ������ ������
		ServletContext app=req.getServletContext();
		String upDir=app.getRealPath("/images");
		System.out.println(upDir);
		
		//2_1. ���̹������ϵ� ���ε� ó��->cos.jar
		MultipartRequest mr
		=new MultipartRequest(req,upDir,10*1024*1024,"UTF-8",
				new DefaultFileRenamePolicy());
		
		//3. ����ڰ� �Է��� �� �ޱ�
		String name=mr.getParameter("name");
		String title=mr.getParameter("title");
		String image=mr.getFilesystemName("image");
		String color=mr.getParameter("color");
		String sex=mr.getParameter("sex");
		String weight=mr.getParameter("weight");
		String trans=mr.getParameter("trans");
		String addr=mr.getParameter("addr");
		String indate=mr.getParameter("indate");
		int astate=Integer.parseInt(mr.getParameter("astate"));
		String center=mr.getParameter("center");
		String protect=mr.getParameter("protect");
		String tel=mr.getParameter("tel");
		String form=mr.getParameter("form");
		
		//4. AnimalVO�� ����ֱ�
		AnimalVO item=new AnimalVO(null, name, title, image, color, sex, weight, trans, addr, indate
				, astate, center, protect, tel, null, form);
		
		AnimalDAOMyBatis dao=new AnimalDAOMyBatis();
		int n=dao.animInsert(item);
		String msg=(n>0)? "��� ����":"��� ����";
		String loc=(n>0)? "animSecure.do":"javascript:history.back()";
		
		String viewPage=CommonUtil.addMsgLoc(req, msg, loc);
		this.setViewPage(viewPage);
		this.setRedirect(false);
	}

}
