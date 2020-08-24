package shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import shop.parsistence.CartDAOMyBatis;

public class CartDeleteAction extends AbstractAction {

	CartDAOMyBatis dao = new CartDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 장바구니 번호 받기
		String cartNum = req.getParameter("cartNum");
		if(cartNum==null||cartNum.isEmpty()) {
			this.setViewPage(CommonUtil.addMsgBack(req, "잘못 들어온 경로 입니다."));
			this.setRedirect(false);
			return;
		}
		
		int n = dao.deleteCart(cartNum);
		
		this.setRedirect(true);
		this.setViewPage("cart.do");
	}

}
