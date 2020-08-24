package shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.base.CommonUtil;
import common.controller.AbstractAction;
import shop.domain.CartVO;
import shop.parsistence.CartDAOMyBatis;

public class CartEditAction extends AbstractAction {

	CartDAOMyBatis dao = new CartDAOMyBatis();

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 장바구니 번호, 수량 받기
		String cartNum = req.getParameter("cartNum");
		String oqty = req.getParameter("oqty");
		// 수량이 0 일 경우는 해당 상품 삭제처리
		if (cartNum == null || oqty == null) {
			this.setRedirect(true);
			this.setViewPage("cart.do");
			return;
		}
		System.out.println("=====>"+oqty);
		int oqty_int = Integer.parseInt(oqty.trim());
		
		if (oqty_int == 0) {
			dao.deleteCart(cartNum);

		} else if (oqty_int < 0) {
			// 수량이 양수일 경우는 해당 상품의 수량을 수정처리
			String msg = "수량은 양수로";
			this.setViewPage(CommonUtil.addMsgBack(req, msg));
			this.setRedirect(false);
			return;
		} else {
			// 수량이 음수일 경우는 "수량은 양수여야 해요"
			CartVO cvo = new CartVO();
			cvo.setCartNum(cartNum);
			cvo.setOqty(oqty_int);
			dao.editCart(cvo);
		}
		this.setRedirect(true);
		this.setViewPage("cart.do");

	}

}
