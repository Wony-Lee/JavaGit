package shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import shop.domain.CartVO;
import shop.parsistence.CartDAOMyBatis;
import user.domain.UserVO;

public class CartAddAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 1. 상품번호,수량 받기
		String pnum = req.getParameter("pnum");
		String oqty = req.getParameter("oqty");
		
		// 2. 유효성 체크
		if(pnum==null||oqty==null||
				pnum.trim().isEmpty()||oqty.trim().isEmpty())
		{
			this.setRedirect(true);
			this.setViewPage("../index.do");
			return;
		}
		// 회원번호 알아내기
		HttpSession ses=req.getSession();
		UserVO loginUser=(UserVO)ses.getAttribute("loginUser");
		int idx = loginUser.getIdx();//회원번호
		int oqty_int = Integer.parseInt(oqty.trim());
		int pnum_int = Integer.parseInt(pnum.trim());
		CartVO cvo = new CartVO(null,oqty_int,idx,pnum_int);
		
		CartDAOMyBatis dao = new CartDAOMyBatis();
		//해당 상품이 해당 회원의 장바구니에 이미 담겨져있는지 체크하자
		// 1. 이미 담긴 상품이라면 => 수량만 추가
		int count = dao.selectCartByPnum(cvo);
		int n = 0;
		if(count>0) {
			n = dao.updateCartOqty(cvo);
		}else {
		// 2. 그렇지 않고 새로 담은 상품이라면 => cart테이블에 insert
			n = dao.addCart(cvo);
			
		}		
		/*
		String msg = (n>0)?"장바구니 담기 성공":"담기 실패";
		String loc = (n>0)?"cart.do":"javascript:history.back()";
		String view = CommonUtil.addMsgLoc(req, msg, loc);
		*/
		//String view = "../shop/cartList.jsp";
		
		String view="cart.do";
		
		this.setViewPage(view);
		this.setRedirect(true);
	}

}
