package youhu.parsistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Application.model.ApplicationVO;
import common.base.DAOMyBatisBase;

public class ApplicationDAOMyBatis extends DAOMyBatisBase{
	
	//네임스페이스 지정. SampleMapper.xml에 지정된 namespace값과 동일해야 함
	private final String NS = "common.mapper.ApplicationMapper";
	private SqlSession ses;
	
	//게시글을 저장
	public int applicationInsert(ApplicationVO appInsert) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.insert(NS+".applicationInsert", appInsert);
			if(n>0) ses.commit();
			else ses.rollback();
			return n;
		} finally {
			close(ses);
		}
	}
	
	
	// 게시글 수정
	public int applicationUpdate(ApplicationVO appUpdate) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.update(NS+",applicationUpdate", appUpdate);
			if(n>0) ses.commit();
			else ses.rollback();
			
			return n;
		} finally {
			close(ses);
		}
	}
	
	//게시글을 얻어옴
	public List<ApplicationVO> getAppList(){
		try {
			ses=this.getSqlSessionFactory().openSession();
			List<ApplicationVO> arr = ses.selectList(NS+".getAppList");
			
			return arr;
		} finally {
			close(ses);
		}
	}
	
	/*
	 * //리스트에 게시글을 뿌려줌 public int getAppCount() { try { ses =
	 * this.getSqlSessionFactory().openSession(); int count =
	 * ses.selectOne(NS+".getAppCount");
	 * 
	 * return count; } finally { close(ses); } }
	 */
	
	public ApplicationVO AppInfo(String midx)
	{
		try {
			ses = this.getSqlSessionFactory().openSession();
			ApplicationVO avo = ses.selectOne(NS+".AppInfo", midx);
			return avo;
		} finally {
			close(ses);
		}
	}
}
