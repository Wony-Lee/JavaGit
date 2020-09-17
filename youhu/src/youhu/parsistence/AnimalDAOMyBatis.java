package youhu.parsistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import anim.model.AnimalVO;
import common.base.DAOMyBatisBase;

public class AnimalDAOMyBatis extends DAOMyBatisBase{
	
	private final String NS="common.mapper.AnimalMapper";
	private SqlSession ses;
	
	/**form(����)���� ���� ���� �������� �޼ҵ� (0:��, 1:�����, 2:��Ÿ)*/
	public List<AnimalVO> selectByFormS(String form) {
		try {
			ses=this.getSqlSessionFactory().openSession();
			List<AnimalVO> arr=ses.selectList(NS+".selectByFormS", form);
			return arr;
		}finally {
			close(ses);
		}
	}//-----------------------------------------------

	/**form(����)���� ���� ���� �������� �޼ҵ� (0:��, 1:�����, 2:��Ÿ)*/
	public List<AnimalVO> selectByFormA(String form) {
		try {
			ses=this.getSqlSessionFactory().openSession();
			List<AnimalVO> arr=ses.selectList(NS+".selectByFormA", form);
			return arr;
		}finally {
			close(ses);
		}
	}//-----------------------------------------------
	public int animInsert(AnimalVO anim) {
		try {
			ses=this.getSqlSessionFactory().openSession();
			int n=ses.insert(NS+".animInsert", anim);
			if(n>0) ses.commit();
			else ses.rollback();
			return n;
		} finally {
			close(ses);
		}
	}//-----------------------------------------------

	public int animDelete(String iidx) {
		try {
			//auto commit �Ϸ��� openSession()�޼ҵ忡 true���� �Ű������� ��������.
			ses=this.getSqlSessionFactory().openSession(true);
			int n=ses.delete(NS+".animDelete", iidx);
			return n;
		} finally {
			close(ses);
		}
	}//-----------------------------------------------
	
	public int animUpdate(String iidx) {
		try {
			ses=this.getSqlSessionFactory().openSession(true);
			int n=ses.update(NS+".animUpdate", iidx);
			return n;
		} finally {
			close(ses);
		}
	}//-----------------------------------------------
	
	/**��Ϲ�ȣ (iidx)�� �ֿϵ��� ��ϵ� ���� �������� �޼ҵ�*/
	public AnimalVO animInfo(String iidx) {
		try {
			ses=this.getSqlSessionFactory().openSession();
			AnimalVO anim=ses.selectOne(NS+".animInfo", iidx);
			return anim;
		} finally {
			close(ses);
		}
	}//-----------------------------------------------
	
}////////////////////////////////////
