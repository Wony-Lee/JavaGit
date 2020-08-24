package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import user.domain.UserVO;

/**
 * Servlet Filter implementation class AdminCheckFilter
 */
@WebFilter("/admin/*")
public class AdminCheckFilter extends LoginCheckFilter {

  
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("Admin Login Check...");
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession ses = req.getSession();
		
		UserVO user=(UserVO)ses.getAttribute("loginUser");
		if(user==null)
		{
			super.doFilter(request, response, chain);
			return;
		}
		if(!user.getUserid().equals("admin")&&!user.getUserid().equals("admin2"))
		{
			
			String msg="관리자만 사용가능 반박시 죽임";
			String loc= req.getContextPath()+"/signin.do";
			String viewPage = CommonUtil.addMsgLoc(req, msg, loc);
			RequestDispatcher disp = req.getRequestDispatcher("/"+viewPage);
			disp.forward(req, response);
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
