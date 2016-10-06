package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.exception.VisitUpdateException;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.FileVisitVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Repository
public class VisitDao {

	@Autowired
	private SqlSession sqlSession;

	/* visited - visitInsert */
	public void insert(VisitVo visitVo) {
		System.out.println(visitVo);
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

	public List<VisitVo> selectList() {
		return sqlSession.selectList("visit.detailSelect");
	}

	/* 쿠폰 사용 */
	public void updateCoupon(VisitVo visitVo) {
		sqlSession.update("visit.couponUpdate", visitVo);
		System.out.println("coupon의 갯수차감에 성공했습니다.");
	}

	/* 방문 내역 기록 - 시술이후 */
	public void SalesInsert(VisitVo visitVo) {
		sqlSession.insert("visit.salesInsert", visitVo);
		System.out.println("sales 등록에 성공했습니다.");
	}

	/* 쿠폰 */
	public int couponInsert(CouponVo couponVo) {
		System.out.println(couponVo);
		return sqlSession.insert("visit.couponInsert", couponVo);
	}

	/* 방문 내역 기록 - 쿠폰 등록 이후 */
	public void SalesInsert(CouponVo couponVo) {
		System.out.println(couponVo.getPayNo());
		sqlSession.insert("visit.salesInsertByCoupon", couponVo);
		System.out.println("sales 등록에 성공했습니다.");
	}

	public long fileInsert(FileVisitVo fileVisitVo) {
		sqlSession.insert("visit.fileInsert", fileVisitVo);
		return fileVisitVo.getNo();
	}

}
