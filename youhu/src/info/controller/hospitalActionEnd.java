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
		req.setAttribute("data", data);
		this.setViewPage("hospitalResult.jsp"); 
		this.setRedirect(false); 
	}

}

