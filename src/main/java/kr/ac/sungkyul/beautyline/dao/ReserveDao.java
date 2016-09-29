package kr.ac.sungkyul.beautyline.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.ReserveVo;

@Repository
public class ReserveDao {

	@Autowired
	private SqlSession sqlSession; //sql연결
	
	//reserveList
	public List<ReserveVo> resList(){
		return sqlSession.selectList( "res.resList" );
	}
	
	//예약번호로 검색
	public ReserveVo selectReserve( int no ){
		
		return sqlSession.selectOne( "res.resSelect", no );
	}
	
	// 예약실행
	public void reserve(  ReserveVo reserveVo ){
		sqlSession.insert( "res.reserve", reserveVo );
	}
	
	//예약 삭제
	public int reserveDelete( int no ){
		int delCount;
		delCount = sqlSession.delete( "res.resDelete", no );
		System.out.println( "예약삭제 dao = " + delCount);
		return delCount;
	}
	
	//달력에서 선택한 날짜로 vo받아오기
	public List<ReserveVo> resDaySel( String resDateText ){
		List<ReserveVo> resSelList = sqlSession.selectList( "res.resDaySel", resDateText );
		
		/*System.out.println( resSelList.size() );
		long curr = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("HH");
		String dateTime = sdf.format(new Date(curr));
		System.out.println("--->"+dateTime);
		System.out.println( resSelList.toString());*/
		
		return resSelList;
	}
}
