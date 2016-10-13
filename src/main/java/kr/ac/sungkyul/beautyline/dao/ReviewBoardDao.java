package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.ReplyVo;
import kr.ac.sungkyul.beautyline.vo.ReviewBoardVo;


@Repository
public class ReviewBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/* 전체글 가져오기 */
	public List<ReviewBoardVo> getAll(){
		List<ReviewBoardVo> list = sqlSession.selectList("reviewboard.getAll");
		return list;
	}
	
	/* 공지사항 글쓰기 */
	public int insertBoard(ReviewBoardVo vo){ 
		int check =	sqlSession.insert("reviewboard.insert",vo);	
		return check;
	}

	/* 공지사항 글 보기 */
	public ReviewBoardVo viewBoard(Long no){
		return sqlSession.selectOne("reviewboard.view",no);
	}
	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount(Long no){
		sqlSession.update("reviewboard.updateviewcnt",no);

	}

	/* 공지사항 글 삭제 */
	public int delete(Long no){
		return sqlSession.delete("reviewboard.delete",no);	
	}
	/* 공지사항 글 수정 --글만수정 */
	public int modify(ReviewBoardVo reviewBoardVo){
		int check = sqlSession.update("reviewboard.modify",reviewBoardVo);	
		return check;
	}
	public List<ReplyVo> getReplyAll(Long reviewNo){
		List<ReplyVo> list = sqlSession.selectList("reviewboard.getReplyAll",reviewNo);
		return list;

	}
	public int reply(ReplyVo replyVo){
		int check = sqlSession.insert("reviewboard.reply",replyVo);
		return check;
	}
	
	public int deletereply(Long replyNo){
		int check = sqlSession.delete("reviewboard.deletereply",replyNo);
		return check;
	}
}
