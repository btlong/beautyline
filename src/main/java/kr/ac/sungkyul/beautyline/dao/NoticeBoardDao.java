package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.NoticeBoardVo;
@Repository
public class NoticeBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/* 전체글 가져오기 */
	public List<NoticeBoardVo> getAll(){
		List<NoticeBoardVo> list =sqlSession.selectList("noticeboard.getAll");
		return list;
	}
	
	/* 공지사항 글쓰기 */
	public void insertBoard(NoticeBoardVo vo){ 
		sqlSession.insert("noticeboard.insert",vo);	
	}

	/* 공지사항 글 보기 */
	public NoticeBoardVo viewBoard(int no){
		return sqlSession.selectOne("noticeboard.view",no);
	}
	
	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount(int no){
		sqlSession.update("noticeboard.updateviewcnt",no);
	}
	
	/* 공지사항 글 삭제 */
	public int delete(int no){
		return sqlSession.delete("noticeboard.delete",no);	
	}
}
