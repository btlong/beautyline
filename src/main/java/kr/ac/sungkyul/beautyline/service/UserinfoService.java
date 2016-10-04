package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.UserinfoDao;
import kr.ac.sungkyul.beautyline.vo.UserinfoVo;

@Service
public class UserinfoService {

	@Autowired
	private UserinfoDao userinfoDao;
	
	// 리스트
	public List<UserinfoVo> listUser(){
		return userinfoDao.listUser();
	}
	
	// 회원삭제
	public void deleteUser(long no){
		userinfoDao.deleteUser(no);
	}
	
	// 수정폼
	public UserinfoVo selectUser(long no){
		return userinfoDao.selectUser(no);
	}
	
	// 수정
	public void updateUser(UserinfoVo userinfoVo){
		userinfoDao.updateUser(userinfoVo);
	}
	
/*	public static CouponviewVo couponView(long userNo){
		return userinfoDao.couponView(userNo);
	}*/

/*	public List<CouponviewVo> listCoupon(){
		return userinfoDao.listCoupon();
	}*/
}
