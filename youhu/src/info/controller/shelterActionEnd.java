package info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import info.model.ApiExplorer;

public class shelterActionEnd extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("UTF-8");
		String careNm=req.getParameter("careNm");
		String keyword=req.getParameter("query");
		System.out.println(keyword+"<<<<");
		ApiExplorer shelter=new ApiExplorer();
		String data="";
		if(careNm==null){
			careNm="";
			String start=req.getParameter("start");
			
			if(start==null||start.trim().isEmpty()){
				start="1"; 
			}	
			String display="10";	
			String sort="sim";	
			data=shelter.getData(keyword);
		}
		int i=data.indexOf("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>");
		int len="<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>".length();
		System.out.println("len="+len);
		if(i!=-1) {
			data=data.substring(len);
		}
		System.out.println(data);
		req.setAttribute("data", data);
		this.setViewPage("shelterResult.jsp"); 
		this.setRedirect(false); 
	}

}

