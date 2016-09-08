package kr.ac.sungkyul.beautyline.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.UserDao;
import kr.ac.sungkyul.beautyline.exception.UserInfoUpdateException;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public void join(UserVo vo){
		userDao.insert(vo);
	}
	
	public UserVo login(String id, String password){
		UserVo authUser = userDao.get(id,password);
		return authUser;
		
	}
	
	public void updateInfo(UserVo vo){
		try{
		userDao.update(vo);
		}catch(UserInfoUpdateException e ){
			
		}
		}
	public UserVo getUserInfo(Long no){
		UserVo authUser = userDao.get(no);
		return authUser;
	}
}
