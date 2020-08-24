package shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import shop.domain.ProductVO;
import shop.parsistence.ProductDAOMyBatis;

public class ProductDetailAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 상품 번호 받아오기
		String pnum = req.getParameter("pnum");
		// 2. 유효성 체크
		if(pnum==null||pnum.trim().isEmpty())
		{
			this.setViewPage("index.do");
			this.setRedirect(true);
			return;
		}
		// 3. dao의 productInfo(상품번호) 호출하기
		ProductVO prod = new ProductVO();
		ProductDAOMyBatis pdao = new ProductDAOMyBatis();
		
		prod = pdao.productInfo(pnum.trim());
		
		// 4. req에 저장하기
		req.setAttribute("prod", prod);
		
		this.setViewPage("shop/productView.jsp");
		this.setRedirect(false);
	}

}
