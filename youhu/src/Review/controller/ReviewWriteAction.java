package Review.controller;

import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Review.model.ReviewVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;
import youhu.parsistence.ReviewDAOMyBatis;

public class ReviewWriteAction extends AbstractAction{
	
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/images");
		
		MultipartRequest mr = new MultipartRequest(req, upDir, 10*1024*1024, "UTF-8",
				new DefaultFileRenamePolicy());
		
		String subject = mr.getParameter("subject");
		String name = mr.getParameter("name");
		String content = mr.getParameter("content");
		Timestamp indate = new Timestamp(System.currentTimeMillis());
		String image1 = mr.getFilesystemName("image1");
		String center = mr.getParameter("center");
		String downcg_code = mr.getParameter("downcg_code");
		String midx = mr.getParameter("midx");
		
		System.out.println("sub====>"+subject);
		System.out.println("name===>"+name);
		System.out.println("content===>"+content);
		System.out.println("image1===>"+image1);
		System.out.println("center===>"+center);
		System.out.println("down===>"+downcg_code);
		System.out.println("midx===>"+midx);
		
		int dc_int = Integer.parseInt(downcg_code);
		int midx_int = Integer.parseInt(midx);
		
		ReviewVO item = new ReviewVO(0,subject,name,content,indate,image1,center,0,midx_int);
		ReviewDAOMyBatis dao = new ReviewDAOMyBatis();
		int n = dao.reviewInsert(item);
		
		String msg = (n>0)?"등록 성공":"등록 실패";
		String loc = (n>0)?"ReviewList.do":"javascript:history.back()";
		
		String viewPage = CommonUtil.addMsgLoc(req, msg, loc);
		this.setViewPage(viewPage);
		this.setRedirect(false);
	}
}
