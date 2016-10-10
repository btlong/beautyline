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
	
<<<<<<< HEAD
	public List<VisitVo> listHistory(ListVo listVo) {
		List<VisitVo> list = sqlSession.selectList("mypage.listHistory", listVo);
=======
	public List<VisitVo> listHistory(Long userNo) {
		List<VisitVo> list = sqlSession.selectList("mypage.listHistory" ,userNo);
>>>>>>> 3b1f7ddca3b01002fdf95b16743b5b8443d54fd1
		return list;
	}
	
	public int countHistory(Long userNo) {
		int totalRecords = sqlSession.selectOne("mypage.countHistory", userNo);
		return totalRecords;
	}
	
	
	
}
