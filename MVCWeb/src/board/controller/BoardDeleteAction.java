package board.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardVO;
import common.controller.AbstractAction;

public class BoardDeleteAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//1. 삭제할 글 번호와 비번 받기
		String idx = req.getParameter("idx");
		String pwd = req.getParameter("pwd");
		//2. 유효성체크
		if(idx==null||pwd==null||idx.trim().isEmpty()||pwd.trim().isEmpty())
		{
			this.setViewPage("list.do");
			this.setRedirect(false);
			return;
		}
		//3. BoardDAO 생성해서 viewBoard(idx)==>BoardVO받기
		//		사용자가 입력한 pwd와 BoardVO의 pwd값이 같으면 삭제 처리 메소드 호출
		//		deleteBoard(idx)
		BoardDAO dao = new BoardDAO();
		BoardVO dbVo = new BoardVO();
		dbVo = dao.viewBoard(Integer.parseInt(idx.trim()));
		if(dbVo.getPwd().equals(pwd))
		{
			if(dbVo.getFilesize()>0)
			{
				//삭제 처리
				ServletContext app = req.getServletContext();
				String upDir = app.getRealPath("/Upload");
				String path = upDir+File.separator+dbVo.getFilename();
				System.out.println(path);
				File file = new File(path);
				if(file.exists())
				{
					boolean a = file.delete();
					System.out.println("첨부파일 삭제 여부 : "+a);
				}
			} // ------------------
			// DB에서 해당 글 삭제 처리
			int n = dao.deleteBoard(Integer.parseInt(idx.trim()));
			String str=(n>0)?"삭제 성공":"삭제 실패";
			String loc=(n>0)?"list.do":"javascript:history.back()";
			req.setAttribute("message", str);
			req.setAttribute("loc", loc);
			// 업로드한 파일이 있다면 서버의 Upload디렉토리에서 해당 파일을 삭제 처리한다.
			//dao.deleteBoard(Integer.parseInt(idx));
		}else {
			req.setAttribute("message", "비밀번호가 일치하지 않아요");
			req.setAttribute("loc", "javascript:history.back()");
		}
		//4. 그 결과 메시지와 이동경로("list.do")를 req에 저장한다.
		
		
		this.setViewPage("../msg.jsp");
		this.setRedirect(false);
		
	}

}
