package info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import info.model.hospitalProxy;

public class hospitalActionEnd extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String wrkp_nm=req.getParameter("wrkp_nm");
		String keyword=req.getParameter("query");
		System.out.println(keyword+"<<<<");
		hospitalProxy hospital=new hospitalProxy();
		String data="";
		if(wrkp_nm==null){
			wrkp_nm="";
			String start=req.getParameter("start");
			
			if(start==null||start.trim().isEmpty()){
				start="1"; 
			}	
			String display="10";	
			String sort="sim";	
			data=hospital.getData(keyword);
		}
		
		
		int i=data.indexOf("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		int len="<?xml version=\"1.0\" encoding=\"UTF-8\"?>".length();
		System.out.println("len="+len);
		if(i!=-1) {
			data=data.substring(len);
		}
		System.out.println(data);
		req.setAttribute("data", data);
		this.setViewPage("/info/hospitalResult.jsp"); 
		this.setRedirect(false); 
	}

}

