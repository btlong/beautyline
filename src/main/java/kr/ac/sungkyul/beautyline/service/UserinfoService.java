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
	
	public List<UserinfoVo> listUser(){
		return userinfoDao.listUser();
	}
	
	public UserinfoVo selectUser(long no){
		return userinfoDao.selectUser(no);
	}
	
	public void deleteUser(long no){
		userinfoDao.deleteUser(no);
	}
	
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
