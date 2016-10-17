package kr.ac.sungkyul.beautyline.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Repository
public class ReserveDao {

	@Autowired
	private SqlSession sqlSession; //sql연결
	
	//reserveList
	public List<ReserveVo> resList(){
		return sqlSession.selectList( "res.resList" );
	}
	
	//회원 - 회원번호로 list 조회
	public List<ReserveVo> resList( Long userNo ){
		return sqlSession.selectList( "res.resListUserNo", userNo );
	}
	//마이페이지 - 회원번호로 list 조회
	public List<ReserveVo> myResList( Long userNo ){
		return sqlSession.selectList( "res.myResListUserNo", userNo );
	}
	
	//예약번호로 검색
	public ReserveVo selectReserve( int no ){
		return sqlSession.selectOne( "res.resSelect", no );
	}
	
	// 예약실행
	public int reserve(  ReserveVo reserveVo ){
		int count = sqlSession.insert( "res.reserve", reserveVo );
		return count;
	}
	
	//예약 삭제
	public int reserveDelete( int no ){
		int delCount;
		delCount = sqlSession.delete( "res.resDelete", no );
		return delCount;
	}
	
	//달력에서 선택한 날짜로 vo받아오기
	public List<ReserveVo> resDaySel( String resDateText ){
		List<ReserveVo> resSelList = sqlSession.selectList( "res.resDaySel", resDateText );	
		return resSelList;
	}
	
	//회원 이름으로 회원 검색
	public List<UserVo> UserSearch( String name ){
		return sqlSession.selectList( "res.UserSearch", name );
	}
}
