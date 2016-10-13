package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.QnABoardVo;


@Repository
public class QnABoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/* 전체글 가져오기 */
	public List<QnABoardVo> getAll(){
		List<QnABoardVo> list = sqlSession.selectList("qnaboard.getAll");
		return list;
	}
	

	/* 글쓰기 */
	public void insertBoard(QnABoardVo qbdvo){ 
		sqlSession.insert("qnaboard.insert",qbdvo);	
	}

	/* 답글쓰기 */
	public void insertreply(QnABoardVo qbdvo){ 
		sqlSession.insert("qnaboard.insertreply",qbdvo);	
	}
	
	/* 답글 업뎃 */
	public void updatereply(QnABoardVo qbdvo){ 
		sqlSession.update("qnaboard.updatereply",qbdvo);	
	}
	
	/* 글 보기 */
	public QnABoardVo viewBoard(Long no){
		return sqlSession.selectOne("qnaboard.view",no);
	}
		
	
	/* 조회수 업뎃 */
	public void updateViewCount(Long no){
		sqlSession.update("qnaboard.updateviewcnt",no);

	}
	

	/* 글 삭제 */
	public int delete(Long no){
		return sqlSession.delete("qnaboard.delete",no);	
	}

	/* 글 수정 */
	public void modify(QnABoardVo qbdvo){
		sqlSession.update("qnaboard.modify",qbdvo);	
	}

}
