package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.BoardDAO;
import board.model.BoardVO;
import common.base.CommonUtil;
import common.controller.AbstractAction;

/*
수정시

1) 파일을 업로드 하는 경우
	1_1) 예전에 업로드한 파일이 있을 경우 ==> 예전 파일 삭제 처리후
					새로운 파일 업로드 처리
	1_2) 예전에 업로드한 파일이 없는 경우	
		=> 새로운 파일 업로드 처리

2) 업로드 하지 않는 경우 ==> 수정 처리 
 */

public class BoardEditEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 0. 파일 업로드 처리
		ServletContext app = req.getServletContext();
		String upDir=app.getRealPath("/Upload");
		MultipartRequest mr = null;
		try {
			mr=new MultipartRequest(req,upDir,10*1024*1024,"UTF-8",
					new DefaultFileRenamePolicy());
		}catch(IOException e)
		{ //multipart/form-data가 아니거나 업로드 용량 초과시 발생
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		// 1. 글번호, 작성자, 글내용, 비밀번호, 첨부파일명
		String idx = mr.getParameter("idx");
		String name = mr.getParameter("name");
		String pwd = mr.getParameter("pwd");
		String subject = mr.getParameter("subject");
		String content = mr.getParameter("content");
		
		String filename = mr.getFilesystemName("filename");
		String originFilename = mr.getOriginalFileName("filename");//원본파일명
		String old_filename=mr.getParameter("old_filename");
		if(filename!=null){
			//첨부파일이 있는 경우
			if(!old_filename.trim().isEmpty() && !old_filename.trim().isEmpty())
			{
				//예전에 첨부한 파일이 있을 경우 ==> 예전 파일 삭제 처리
				File oldFile = new File(upDir+File.separator+old_filename);
				if(oldFile.exists())
				{
					oldFile.delete();//삭제 처리
				}
			}
		}
		long filesize=0;
		if(filename!=null)
		{
			File file=mr.getFile("filename");
			filesize = file.length();
		}
		
		// 2. 유효성 체크(글번호, 작성자, 비번)
		if(idx==null||name==null||pwd==null||idx.trim().isEmpty()||
				name.trim().isEmpty()||pwd.trim().isEmpty())
		{
			this.setViewPage("edit.do");
			this.setRedirect(true);
			return;
		}
		// 3. BoardVO에 담아주기
		int idx_int = Integer.parseInt(idx.trim());
		BoardVO board = new BoardVO(idx_int,name,pwd,subject,content,null,0,filename,originFilename,filesize);
		// 4. BoardDAO 생성해서 updateBoard(board)
		BoardDAO dao = new BoardDAO();
		int n = dao.updateBoard(board);
		// 5. 실행 결과 메시지 처리
		String str=(n>0)?"수정 성공":"수정 실패";
		String loc=(n>0)?"list.do":"javascript:history.back()";
		
		this.setViewPage(CommonUtil.addMsgLoc(req, str, loc));
		this.setRedirect(false);
	}

}
