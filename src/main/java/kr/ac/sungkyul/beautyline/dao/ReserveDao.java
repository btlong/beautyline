package kr.ac.sungkyul.beautyline.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<ReserveVo> resList(String keyfield, String keyword, String today){
		
        Map<String, String> map = new HashMap<String, String> ();
    

    	map.put("today", today);

        
        if( keyfield != null && keyword != null && keyfield !="" && keyword !="" ){//검색 한경우
    		map.put("keyword", keyword);
    		map.put("keyfield", keyfield);
    		return sqlSession.selectList( "res.getSearch" , map );
    		
        }else{  //아무것도 검색 안한 경우    
			return sqlSession.selectList("res.resList", map);    
		}
		
		
	}
	
	//reservePastList
		public List<ReserveVo> reservePastList(String keyfield, String keyword, String today){
			
			
	        Map<String, String> map = new HashMap<String, String> ();
	        
	        	map.put("today", today);
	        	
	        if( keyfield != null && keyword != null && keyfield !="" && keyword !="" ){//검색 한경우
	    		map.put("keyword", keyword);
	    		map.put("keyfield", keyfield);
	    		return sqlSession.selectList( "res.getPastSearch" , map );
	    		  
	        }else{  //아무것도 검색 안한 경우    
	        	return sqlSession.selectList("res.resPastList", map  );    
			}
			
			
		}
		
	
	//회원 - 회원번호로 list 조회
	public List<ReserveVo> resList( Long userNo, String today ){
        Map<String, Object> map = new HashMap<String, Object> ();
        map.put("userNo",userNo);
        map.put("today",today);
		return sqlSession.selectList( "res.resListUserNo", map );
	}
		
	//회원 - 회원번호로 과거 list 조회
	public List<ReserveVo> resPastList( Long userNo, String today ){
        Map<String, Object> map = new HashMap<String, Object> ();
        map.put("userNo",userNo);
        map.put("today",today);
		return sqlSession.selectList( "res.resPastListUserNo", map );
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
	public int reserveDelete( long no ){
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
