package board.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.*;
import javax.sql.DataSource;

import common.base.DAOBase;
import common.base.DBUtil;

public class BoardDAO extends DAOBase {

	private DataSource ds;
	
	public BoardDAO() {
		// server.xml에 등록되어 있는 커넥션 풀을 룩업하자.
		try {
			Context ctx = new InitialContext();
			// 1. WAS서버를 찾자. (톰캣)
			Context ectx=(Context)ctx.lookup("java:comp/env"); // java:comp/env 톰캣 찾을 때 사용하는 프로토콜
			
			//2. 우리가 등록한 DataSource를 찾자. - resuorce name으로 룩업한다.
			//=> JNDI(Java Naming Directory Interface)
			ds = (DataSource)ectx.lookup("jdbc/myshop");
			System.out.println("DataSource Look Up Success!!");
			
		} catch (NamingException e) {
			System.out.println("데이터 소스 룩업 실패 :"+e);
			e.printStackTrace();
		}
	}

	public int insertBoard(BoardVO vo) throws SQLException {
		try {
			con=ds.getConnection();
			String sql = "insert into board(idx,name,pwd,subject,content,filename,originFilename,filesize,wdate)"
					+ " values( board_seq.nextval,?,?,?,?,?,?,?,systimestamp)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getFilename());
			ps.setString(6, vo.getOriginFilename());
			ps.setLong(7, vo.getFilesize());
			int n = ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}

	public List<BoardVO> listBoard(int start, int end) throws SQLException {
		try {
			con = ds.getConnection();
			// String sql = " select *from board Order by idx desc";

			StringBuilder buf = new StringBuilder(" select *from(")
					.append(" select row_number() over(order by idx desc) rn,")
					.append(" board.* from board")
					.append(" )where rn between ? and ?");
			String sql = buf.toString();
			System.out.println(sql);
			ps = con.prepareStatement(sql);

			ps.setInt(1, start);
			ps.setInt(2, end);

			rs = ps.executeQuery();

			return makeList(rs);
		} finally {
			close();
		}

	}

	public List<BoardVO> makeList(ResultSet rs) throws SQLException {
		con=ds.getConnection();
		List<BoardVO> arr = new ArrayList<>();
		while (rs.next()) {
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String pwd = rs.getString("pwd");
			String subject = rs.getString("subject");
			String content = rs.getString("content");
			Timestamp wdate = rs.getTimestamp("wdate");
			int readnum = rs.getInt("readnum");
			String filename = rs.getString("filename");
			String originfilename = rs.getString("originfilename");
			long filesize = rs.getLong("filesize");
			int refer = rs.getInt("refer");
			int lev = rs.getInt("lev");
			int sunbun = rs.getInt("sunbun");

			BoardVO boardArr = new BoardVO(idx, name, pwd, subject, content, wdate, readnum, filename, originfilename,
					filesize, refer, lev, sunbun);
			arr.add(boardArr);
		} // while ---
		return arr;
	} // -----------------------------------

	public int getTotalCount() throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "select count(idx) cnt from board";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			return cnt;
		} finally {
			close();
		}

	}

	public BoardVO viewBoard(int idx) throws SQLException {
		try {
			con = DBUtil.getCon();
			String sql = "select *from board where idx = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			List<BoardVO> arr = makeList(rs);
			if (arr != null && arr.size() == 1) {
				BoardVO vo = arr.get(0);

				return vo;
			}
			return null;

		} finally {
			close();
		}
	}

	public boolean updateReadnum(String idx) throws SQLException {
		try {
			con = ps.getConnection();
			String sql = "update board set readnum = readnum +1 where idx=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, idx);
			int n = ps.executeUpdate();
			return (n > 0) ? true : false;
		} finally {
			close();
		}
	}// -------------------------------------

	public int deleteBoard(int idx) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "delete from board where idx=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idx);
			return ps.executeUpdate();
		} finally {

		}
	}

	public int updateBoard(BoardVO board) throws SQLException {
		try {
			con = ds.getConnection();
			String sql = "update board set name=?, subject=?, content=?, pwd=?," + " wdate=systimestamp ";
			if (board.getFilename() != null) { // 첨부한 파일이 있따면 파일 내용 수정
				sql += " ,filename=?, filesize=?, originFilename=?";
			}
			sql += " where idx = ?";
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, board.getName());
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getContent());
			ps.setString(4, board.getPwd());
			if (board.getFilename() != null) { // 첨부파일이 있는 경우
				ps.setString(5, board.getFilename());
				ps.setLong(6, board.getFilesize());
				ps.setString(7, board.getOriginFilename());
				ps.setInt(8, board.getIdx());
			} else {// 첨부파일이 없는 경우
				ps.setInt(5, board.getIdx());
			}
			return ps.executeUpdate();

		} finally {
			close();
		}
	}

	/** 검색한 게시글 수 가져오기 */
	public int getTotalCount(String findType, String findKeyword) throws SQLException {
		String colName = getColumName(findType);
		try {
			con = ds.getConnection();
			String sql = " select count(idx) cnt from board where " + colName + " like ?";
			// System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + findKeyword + "%");
			rs = ps.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			return cnt;
		} finally {
			close();
		}
	}

	public List<BoardVO> findBoard(int start, int end, String findType, String findKeyword) throws SQLException {
		String colName = this.getColumName(findType);
		try {
			con = ds.getConnection();
			// String sql = " select *from board Order by idx desc";

			StringBuilder buf = new StringBuilder(" select *from(")
					.append(" select row_number() over(order by idx desc) rn,").append(" board.* from board")
					.append(" where " + colName + " like ?").append(" )where rn between ? and ?");
			String sql = buf.toString();
			// System.out.println(sql);
			ps = con.prepareStatement(sql);

			ps.setString(1, "%" + findKeyword + "%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();

			return makeList(rs);
		} finally {
			close();
		}

	}

	private String getColumName(String findType) {
		String str = "";
		switch (findType) {
		case "1":
			str = "subject";
			break;
		case "2":
			str = "name";
			break;
		case "3":
			str = "content";
			break;
		}
		return str;
	}
} //////////////////////////////////////////////
