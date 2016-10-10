package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;


@Repository
public class MypageDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	public List<VisitVo> listHistory(ListVo listVo) {
		List<VisitVo> list = sqlSession.selectList("mypage.listHistory", listVo);
		return list;
	}
	
	public int countHistory(Long userNo) {
		int totalRecords = sqlSession.selectOne("mypage.countHistory", userNo);
		return totalRecords;
	}
	
	
	
}
