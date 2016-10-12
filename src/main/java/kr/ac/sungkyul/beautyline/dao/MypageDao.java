package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.FileVisitVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;


@Repository
public class MypageDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	public List<VisitVo> listHistory(Long userNo) {
		List<VisitVo> list = sqlSession.selectList("mypage.listHistory" ,userNo);
		return list;
	}

	public List<FileVisitVo> listImage(Long userNo) {
		return sqlSession.selectList("mypage.listImage" , userNo);
	}
	
	
	
}
