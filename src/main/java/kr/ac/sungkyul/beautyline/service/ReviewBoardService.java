package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.ReviewBoardDao;
import kr.ac.sungkyul.beautyline.vo.ReplyVo;
import kr.ac.sungkyul.beautyline.vo.ReviewBoardVo;

@Service
public class ReviewBoardService {
	
	@Autowired
	private ReviewBoardDao rBoardDao;

	
	/* 전체글 가져오기*/
	public List<ReviewBoardVo> getAll(String keyfield, String keyword, String keyWord2){
		//찾기가 있다면 if (){ 찾기  sql 문으로 ㄱㄱ 나중에 string 들어와야함
		List<ReviewBoardVo> list = rBoardDao.getAll(keyfield, keyword, keyWord2);		
		return list;	
	}
	/* 글쓰기	*/
	public int write(ReviewBoardVo reviewBoardVo){
		int check = rBoardDao.insertBoard(reviewBoardVo);
		return check;
	}
	/* 글 보기 */
	public ReviewBoardVo view( Long no ){
		return rBoardDao.viewBoard(no);
		
	}
	

	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount( Long no ){
		rBoardDao.updateViewCount(no);
	}
	
	/* 글 삭제 */
	public int delete( Long no ){
		 return rBoardDao.delete(no);
	}
	


	/* 글만 수정 */
	public int modify(ReviewBoardVo reviewBoardVo){
		int check = rBoardDao.modify(reviewBoardVo);
		return check;
	}
	/* 댓글 가져오기	*/
	public List<ReplyVo> replylist(Long reviewNo){
		List<ReplyVo> list = rBoardDao.getReplyAll(reviewNo);
		return list;
	}
	/* 댓글쓰기	*/
	public int reply(ReplyVo replyVo){
		int check = rBoardDao.reply(replyVo);
		return check;
	}
	
	/* 댓글 삭제	*/
	public int deletereply(Long replyNo){
		int check = rBoardDao.deletereply(replyNo);
		return check;
	}
	
}


