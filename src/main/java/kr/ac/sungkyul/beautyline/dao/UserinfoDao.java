package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.UserinfoVo;

@Repository
public class UserinfoDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 리스트
	public List<UserinfoVo> listUser() {
		return sqlSession.selectList("userinfo.listUser");
	}

	// 회원삭제
	public void deleteUser(long no) {
		sqlSession.delete("userinfo.deleteUser", no);
	}

	// 수정폼
	public UserinfoVo selectUser(long no) {
		return sqlSession.selectOne("userinfo.selectUser", no);
	}

	// 수정
	public void updateUser(UserinfoVo userinfoVo) {
		sqlSession.update("userinfo.updateUser", userinfoVo);
	}
	
/*	public CouponviewVo couponView(long userNo) {
		return sqlSession.selectOne("userinfo.couponView", userNo);
	}*/

/*	public List<CouponviewVo> listCoupon() {
		return sqlSession.selectList("userinfo.listCoupon");
	}
	*/

}
