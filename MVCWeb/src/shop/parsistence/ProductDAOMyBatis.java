package shop.parsistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import shop.domain.CategoryVO;
import shop.domain.ProductVO;

public class ProductDAOMyBatis extends DAOMyBatisBase{

	private final String NS="common.mapper.ProductMapper";
	private SqlSession ses;
	
	/**pspec 별로 상품 정보 가져오는 메소드 (HIT, NEW상품, ....)*/
	public List<ProductVO> selectByPspec(String pspec){
		try {
			ses=this.getSqlSessionFactory().openSession();		
			List<ProductVO> arr=ses.selectList(NS+".selectByPspec", pspec);
												//네임 스페이스.아이디, 파라미터
			return arr;
		} finally {
			close(ses);
		}
	} // ---------------------

	public List<CategoryVO> getUpCategoryList() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			List<CategoryVO> cList=ses.selectList(NS+".getUpCategoryList");
			
			return cList;
		} finally {
			close(ses);
		}
	}

	public List<CategoryVO> getDownCategoryList(String upCode) {
		try {
			ses=this.getSqlSessionFactory().openSession();
			List<CategoryVO> dList = ses.selectList(NS+".getDownCategoryList", upCode);
			return dList;
		} finally {
			close(ses);
		}
	} // ---------------------

	public int productInsert(ProductVO item) {
		try {
			// mybatis는 자동 커밋이 아님. 수동으로 처리해야 함.
			ses=this.getSqlSessionFactory().openSession();
			int n = ses.insert(NS+".productInsert", item);
			if(n>0) ses.commit(); // 트랜잭션 처리
			else ses.rollback(); 
			
			return n;
		} finally {
			close(ses);
		}
		
	} // ---------------------

	public int getProductCount() {
		try {
			ses=this.getSqlSessionFactory().openSession();
			int count = ses.selectOne(NS+".getProductCount");
			
			return count;
		}finally {
			close(ses);
		}
		
	} // ---------------------

	public List<ProductVO> getProductList() {
		
		try {
			ses=this.getSqlSessionFactory().openSession();
			List<ProductVO> arr = ses.selectList(NS+".getProductList");
			
			return arr;
		}finally {
			close(ses);
		}
	} // ---------------------

	/** 상품번호로 상품정보 가져오는 메소드 */
	public ProductVO productInfo(String pnum)
	{
		try {
			ses=this.getSqlSessionFactory().openSession();
			ProductVO prod = ses.selectOne(NS+".productInfo",pnum);
			
			return prod;
		}
		finally {
			close(ses);
		}
	} // ---------------------

	public int productDelete(String pnum) {
		try {
			// auto commit 하려면 openSession() 메소드에 true값을 매개변수로 전달하자.
			ses = this.getSqlSessionFactory().openSession(true);
			int n = ses.delete(NS+".productDelete", pnum);
			return n;
		}finally {
			close(ses);
		}
	} // --------------------
}
