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


}
