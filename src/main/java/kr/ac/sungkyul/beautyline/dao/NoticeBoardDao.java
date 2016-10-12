package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.FileNotiVo;
import kr.ac.sungkyul.beautyline.vo.NoticeBoardVo;


@Repository
public class NoticeBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/* 전체글 가져오기 */
	public List<NoticeBoardVo> getAll(){
		List<NoticeBoardVo> list = sqlSession.selectList("noticeboard.getAll");
		return list;
	}
	
	/* 공지사항 글쓰기 */
	public Long insertBoard(NoticeBoardVo vo){ 
		sqlSession.insert("noticeboard.insert",vo);	
		return vo.getNo();
	}

	/* 공지사항 글 보기 */
	public NoticeBoardVo viewBoard(Long no){
		return sqlSession.selectOne("noticeboard.view",no);
	}
	
	
	public void insertFileNoti(FileNotiVo fileVo ){ // 게시판 글작성 첨부파일 
		sqlSession.insert("noticeboard.insertFileNoti", fileVo);
	}

	
	/* 글 보기 눌렀을 때 첨부파일 이름 가져오기  & 다운*/
	public FileNotiVo selectFileNotiByNo(Long noticeNo){//글 보기를 눌렀을때 첨부파일 이름 가져오기위한 dao
		return  sqlSession.selectOne("noticeboard.selectFileNotiByNo",noticeNo);
		
	}
	

	
	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount(Long no){
		sqlSession.update("noticeboard.updateviewcnt",no);

	}
	

	/* 공지사항 글 삭제 */
	public int delete(Long no){
		return sqlSession.delete("noticeboard.delete",no);	
	}

	/* 공지사항 글 수정 --글만수정 */
	public void modify(NoticeBoardVo noticeBoardVo){
		sqlSession.update("noticeboard.modify",noticeBoardVo);	
	}
	
	
	/* 파일 삭제 */
	public int delFile(Long fileNo){
		return sqlSession.delete("noticeboard.delFile",fileNo);
	}

}
