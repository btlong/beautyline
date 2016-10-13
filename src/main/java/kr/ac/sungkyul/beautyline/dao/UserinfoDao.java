package kr.ac.sungkyul.beautyline.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.UserinfoVo;

@Repository
public class UserinfoDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 리스트
	public List<UserinfoVo> listUser(String keyfield, String keyword) {
        System.out.println(keyfield + "//" + keyword);
        if(keyfield != null && keyword != null && keyfield !="" && keyword !=""){
            Map<String, String> map = new HashMap<String, String> ();
            map.put("keyfield" , keyfield);
            map.put("keyword", keyword);
            return sqlSession.selectList("userinfo.searchUser", map);
        /*}else if((keyfield == null || keyfield =="") && (keyword != null || keyword !="")){
        	return sqlSession.selectList("userinfo.listUser");*/
        }else {
        	return sqlSession.selectList("userinfo.listUser");
        }
	}
	
	//쿠폰뷰
	public List<CouponVo> selectList(Long userNo) {
		return sqlSession.selectList("userinfo.selectCoupon", userNo);
	}
	
	
	/*//쿠폰수정
	public int updateCoupon(CouponVo couponvo) {
		System.out.println("//"+couponvo);
		Long programNo = couponvo.getProgramNo();
		Long userNo = couponvo.getUserNo();
		if(programNo!=null && userNo!=null){
		return sqlSession.update("userinfo.updateCoupon", couponvo);
		}else{
			return sqlSession.insert("userinfo.insertCoupon", couponvo);
		}
	}*/
	
	// 쿠폰count==0일때 insert
	public int insertCoupon(CouponVo couponvo) {
		return sqlSession.insert("userinfo.insertCoupon", couponvo);
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
