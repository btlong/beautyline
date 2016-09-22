package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.exception.VisitUpdateException;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Repository
public class VisitDao {

	@Autowired
	private SqlSession sqlSession;

	/* 방문내역 관리 - 시술이후 등록 */
	public long update(VisitVo visitVo) throws VisitUpdateException {
		int count = sqlSession.update("visit.update", visitVo);
		if (count == 0) {
			throw new VisitUpdateException();
		}
		System.out.println("방문내역이 등록되었습니다.");
		return visitVo.getUserNo();
	}

	/* 방문내역 조회 */
	/*public List<VisitVo> getList() {
		List<VisitVo> list = sqlSession.selectList("visit.getList");
		return list;
	}*/

/*	 회원 검색 
	public List<VisitVo> getList(String name) {

		List<VisitVo> list = sqlSession.selectOne("visit.getSearchList", name); //
		return list;
	}*/

	public List<UserVo> selectByName(UserVo userVo) {
		return sqlSession.selectList("user.getByName", userVo);
	}

	public List<VisitVo> selectList() {
		return sqlSession.selectList("visit.selectList");
	}

}
