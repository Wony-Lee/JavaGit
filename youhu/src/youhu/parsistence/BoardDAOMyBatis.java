package youhu.parsistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Board.model.BoardVO;
import common.base.DAOMyBatisBase;

public class BoardDAOMyBatis extends DAOMyBatisBase{

	private final String NS = "common.mapper.BoardMapper";
	private SqlSession ses;
	
	//게시글을 저장
	public int boardInsert(BoardVO boardInsert) {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int n = ses.insert(NS+".boardInsert", boardInsert);
			if(n>0) ses.commit();
			else ses.rollback();
			return n;
		} finally {
			close(ses);
		}
	}
	
	//게시글 얻어옴
	public List<BoardVO> getBoardList(){
	
	try {
		ses = this.getSqlSessionFactory().openSession();
		List<BoardVO> arr = ses.selectList(NS+".getBoardList");
		
		return arr;
		}finally {
			close(ses);
		}
	}
	
	// 리스트에 게시글을 뿌려줌
	public int getBoardCount() {
		try {
			ses = this.getSqlSessionFactory().openSession();
			int count = ses.selectOne(NS+".getBoardCount");
		
			return count;
		} finally {
			close(ses);
		}
	}
	
	public BoardVO boardInfo(String bidx) {
		try {
			ses=this.getSqlSessionFactory().openSession();
			BoardVO avo = ses.selectOne(NS+".boardInfo", bidx);
			return avo;
		} finally {
			close(ses);
		}
	}
}
