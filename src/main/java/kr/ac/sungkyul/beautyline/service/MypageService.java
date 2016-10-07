package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.MypageDao;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Service
public class MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	public List<VisitVo> listHistory(Long userNo) {
		System.out.println("Service userNo : " + userNo);
		List<VisitVo> listHistory = mypageDao.listHistory(userNo);
		return listHistory;
	}

}
