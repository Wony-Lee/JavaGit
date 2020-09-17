package anim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import anim.model.AnimalVO;
import common.controller.AbstractAction;
import youhu.parsistence.AnimalDAOMyBatis;

public class animSecureAction extends AbstractAction{
	
	AnimalDAOMyBatis pdao=new AnimalDAOMyBatis();
	
	public void execute(HttpServletRequest req, HttpServletResponse res )
	throws Exception{
		System.out.println("IndexAction�� execute()...");
		req.setAttribute("msg", "YOUHU�� Ȩ�������Դϴ�.");
		
		List<AnimalVO> dogList=pdao.selectByFormS("1");//��
		List<AnimalVO> catList=pdao.selectByFormS("2");//�����
		List<AnimalVO> gitaList=pdao.selectByFormS("3");//��Ÿ
		
		req.setAttribute("form1", "��");
		req.setAttribute("DOGList", dogList);
		
		req.setAttribute("form2", "�����");
		req.setAttribute("CATList", catList);
		
		req.setAttribute("form3", "��Ÿ");
		req.setAttribute("GITAList", gitaList);

		this.setViewPage("/Animal/animSecure.jsp");//�������� ����
		this.setRedirect(false);//�̵������ forward�̵����� ����
	}

}
