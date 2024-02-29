package board.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory = null;
	private static BoardDAO boardDAO = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return boardDAO;
	}
	
	public BoardDAO() {
		
		try {
			String resource = "mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertBoard(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		int su = sqlSession.insert("boardSQL.insertBoard", map);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	
	public List<BoardDTO> boardList(Map<String,Integer> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}

	public BoardDTO getBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
		sqlSession.close();	// 커밋할 필요는 없음
		return boardDTO;
	}

	public int updateBoard(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();	//생성
		int su = sqlSession.update("boardSQL.updateBoard", map);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}

	public int boardReply(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// step(글순서) update (순서대로 보여주기 위해 하나씩 밀기)
		BoardDTO boardDTO = this.getBoard((int)map.get("pseq"));
		System.out.println("seq: "+boardDTO.getSeq());
		sqlSession.update("boardSQL.boardReplyStep", boardDTO);
		
		//insert	
		map.put("ref", boardDTO.getRef());		//답글의 ref(그룹번호)는 원글을 따라간다.
		map.put("lev", boardDTO.getLev()+1);	//답글의 lev는 원글lev+1
		map.put("step", boardDTO.getStep()+1);	//답글의 step은 원글step+1
		sqlSession.insert("boardSQL.boardReply", map);
		
		//reply(답글수) update
		sqlSession.update("boardSQL.boardReplyReply", map.get("pseq"));
		
		
		sqlSession.commit();
		sqlSession.close();
		return 0;
	}

	public int deleteBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		/*
		 * BoardDTO boardDTO = this.getBoard(seq); // 지우고자하는 게시글 // 원글 찾아서 reply 감소
		 * sqlSession.update("boardSQL.deleteBoardReply", boardDTO);
		 * 
		 * // 답글을 찾아서 subject에 원글이 삭제되었다고 알리기
		 * sqlSession.update("boardSQL.deleteBoardChildrenSubject", boardDTO);
		 * 
		 * //게시글 삭제 int su = sqlSession.delete("boardSQL.deleteBoard", boardDTO);
		 */
		
		int su = sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}

}
