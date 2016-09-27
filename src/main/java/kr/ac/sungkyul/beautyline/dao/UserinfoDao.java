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
	
	public List<UserinfoVo> listUser() {
		return sqlSession.selectList("userinfo.listUser");
	}

	public UserinfoVo selectUser(long no) {
		return sqlSession.selectOne("userinfo.selectUser", no);
	}
	
	public void deleteUser(long no) {
		sqlSession.delete("userinfo.deleteUser", no);
	}

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
