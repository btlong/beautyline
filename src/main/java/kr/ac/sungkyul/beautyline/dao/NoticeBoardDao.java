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
	public NoticeBoardVo viewBoard(int no){
		return sqlSession.selectOne("noticeboard.view",no);
	}
	
	
	public void insertAttachFile(FileNotiVo fileVo ){ // 게시판 글작성 첨부파일 
		sqlSession.insert("bbs.insertAttachFile",fileVo);
	}
	
	
	
	
	
	
	
	
	
	public FileNotiVo selectAttachFileByNo(Long no){//글 보기를 눌렀을때 첨부파일 이름 가져오기위한 dao
		FileNotiVo fileVo = sqlSession.selectOne("bbs.selectAttachFileByNo",no);
		return fileVo;
	}
	
	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount(int no){
	}
	
	/* 공지사항 글 삭제 */
	public int delete(int no){
		return sqlSession.delete("noticeboard.delete",no);	
	}

}
