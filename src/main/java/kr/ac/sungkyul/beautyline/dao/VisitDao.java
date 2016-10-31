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
		return visitVo.getUserNo();
	}

	public List<UserVo> selectByName(UserVo userVo) {
		return sqlSession.selectList("visit.searchByNameAndPhone", userVo);
	}

	public UserVo selectOne(UserVo userVo) {
		UserVo authVo = sqlSession.selectOne("visit.searchSelectOne", userVo);
		return authVo;
	}

	public List<CouponVo> selectList(Long no) {
		return sqlSession.selectList("visit.couponSelectList", no);
	}

	public List<VisitVo> selectList() {
		return sqlSession.selectList("visit.detailSelect");
	}

	/* 쿠폰 사용 */
	public void updateCouponMinus(VisitVo visitVo) {
		sqlSession.update("visit.couponUpdateMinus", visitVo);
	}

	/* 방문 내역 기록 - 시술이후 */
	public void SalesInsert(VisitVo visitVo) {
		sqlSession.insert("visit.salesInsert", visitVo);
	}

	/* 쿠폰 */
	public long couponInsert(CouponVo couponVo) {
		return sqlSession.insert("visit.couponInsert", couponVo);
	}

	/* 방문 내역 기록 - 쿠폰 등록 이후 */
	public void SalesInsert(CouponVo couponVo) {
		sqlSession.insert("visit.salesInsertByCoupon", couponVo);
	}

	public long fileInsert(FileVisitVo fileVisitVo) {
		sqlSession.insert("visit.fileInsert", fileVisitVo);
		return fileVisitVo.getNo();
	}

	public void updateRefundCoupon(VisitVo visitVo) {
		sqlSession.update("visit.updateRefundCoupon", visitVo);

		System.out.println("update 성공");
	}

	public void insertRefundSales(Long no) {
		sqlSession.insert("visit.insertSalesByRefund", no);

	}

	public Long couponSelect(CouponVo couponVo) {
		return sqlSession.selectOne("visit.couponSelectOne", couponVo);
	}

	public long updateCouponCharge(CouponVo couponVo) {
		return sqlSession.update("visit.couponUpdateByCharge", couponVo);
	}

	public void updateRefundSales(Long no) {
		sqlSession.update("visit.salesUpdateByRefund",no);
	}

	public List<VisitVo> selectListbyToday(String today) {
		
		return sqlSession.selectList("visit.detailSelectByToday", today );
	}

}
