package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.exception.VisitUpdateException;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Repository
public class VisitDao {

	@Autowired
	private SqlSession sqlSession;

	/* visited - visitInsert */
	public void insert(VisitVo visitVo) {
		sqlSession.insert("visit.insert", visitVo);
	}

	/* visited - update */
	public long update(VisitVo visitVo) throws VisitUpdateException {
		int count = sqlSession.update("visit.update", visitVo);
		if (count == 0) {
			throw new VisitUpdateException();
		}
		System.out.println("방문내역이 등록되었습니다.");
		return visitVo.getUserNo();
	}

	public List<UserVo> selectByName(UserVo userVo) {
		return sqlSession.selectList("visit.searchByNameAndPhone", userVo);
	}

	public UserVo selectOne(UserVo userVo) {
		return sqlSession.selectOne("visit.searchSelectOne", userVo);
	}

	public List<CouponVo> selectList(Long no) {
		return sqlSession.selectList("visit.couponSelect", no);
	}

}
