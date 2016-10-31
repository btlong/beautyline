package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.ReserveDao;
import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Service
public class ReserveService {

	@Autowired
	private ReserveDao reserveDao;
	
	//관리자 - reserveList
	public List<ReserveVo> resList(String keyfield, String keyword, String today){
		return reserveDao.resList(keyfield, keyword, today);
	}
	
	//관리자 - reservePastList
		public List<ReserveVo> reservePastList(String keyfield, String keyword, String today){
			return reserveDao.reservePastList(keyfield, keyword, today);
	}
		
	//회원 - 회원번호로 list 조회
	public List<ReserveVo> resList( Long userNo, String today ){
		return reserveDao.resList( userNo, today);
	}
	//안드로이드 회원 - 회원번호로 list 조회
	public List<ReserveVo> andResList( Long userNo, String today ){
		return reserveDao.andResList( userNo, today);
	}
		//회원 - 회원번호로 과거list 조회
	public List<ReserveVo> resPastList( Long userNo, String today ){
		return reserveDao.resPastList( userNo, today);
	}
	
	//마이페이지- 회원번호로 list 조회
	public List<ReserveVo> myResList( Long userNo ){
		return reserveDao.myResList( userNo );
	}
	//예약번호로 검색
	public ReserveVo selectReserve( int no ){
		return reserveDao.selectReserve( no );
	}
	
	//예약실행
	public int reserve( ReserveVo reserveVo ){
		int count = reserveDao.reserve( reserveVo );
		return count;
		
	}
	
	//삭제
	public int reserveDelete( long no ){
		int delCount;
		delCount = reserveDao.reserveDelete( no );
		return delCount;
	}
	
	//달력에서 선택한 날짜로 vo받아오기
	public List<ReserveVo> resDaySel( String resDateText ){
		return reserveDao.resDaySel( resDateText );
	}
	
	//회원 이름으로 검색
	public List<UserVo> UserSearch( String name ){
		return reserveDao.UserSearch( name );
	}
	
	

}
