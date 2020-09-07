package Review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Review.model.ReviewVO;
import common.controller.AbstractAction;
import youhu.parsistence.ReviewDAOMyBatis;

public class ReviewListAction extends AbstractAction {

	ReviewDAOMyBatis dao = new ReviewDAOMyBatis();
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		int totalCount = dao.getReviewCount();
		
		List<ReviewVO> arr = dao.getReviewList();
		
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("ReviewList", arr);
		this.setViewPage("./Review/ReviewList.jsp");
		this.setRedirect(false);
	}

}
