package youhu.parsistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Review.model.ReviewVO;
import common.base.DAOMyBatisBase;

public class ReviewDAOMyBatis extends DAOMyBatisBase{
	
	private final String NS = "common.mapper.ReviewMapper";
	private SqlSession ses;
	
	// 게시글을 입력
	public int reviewInsert(ReviewVO reviewInsert) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.insert(NS+".reviewInsert", reviewInsert);
			if(n>0) ses.commit();
			else ses.rollback();
			return n;
		} finally {
			close(ses);
		}
	}
	
	// 게시글을 얻어옴
	public List<ReviewVO> getReviewList(){
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<ReviewVO> arr = ses.selectList(NS+".getReviewList");
			
			return arr;
		} finally {
			close(ses);
		}
	}
	
	// 게시글을 뿌려줌
	public int getReviewCount() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int count = ses.selectOne(NS+".getReviewCount");
			
			return count;
		} finally {
			close(ses);
		}
	}
	
	public ReviewVO reviewInfo(String ridx) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			ReviewVO rvo = ses.selectOne(NS+".reviewInfo", ridx);
			
			return rvo;
			
		} finally {
			close(ses);
		}
	}
}
