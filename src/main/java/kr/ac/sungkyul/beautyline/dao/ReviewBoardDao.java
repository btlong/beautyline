package kr.ac.sungkyul.beautyline.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.QnABoardVo;
import kr.ac.sungkyul.beautyline.vo.ReplyVo;
import kr.ac.sungkyul.beautyline.vo.ReviewBoardVo;


@Repository
public class ReviewBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/* 전체글 가져오기 */
	public List<ReviewBoardVo> getAll(String keyfield, String keyword, String keyword2){
		  System.out.println("DAO"+keyfield + "//" + keyword + "//" + keyword2);
	    	
	        Map<String, String> map = new HashMap<String, String> ();
	  
	        List<ReviewBoardVo> list;
	        if( keyword2 != null ){ //카테고리 선택한 경우
	        	//검색따로 안한경우
	        	
	        	map.put("keyword2", keyword2);
	        	System.out.println("카테고리 선택한 경우");
	    		
	        	if( keyfield != null && keyword != null && keyfield !="" && keyword !="" ){//검색 한경우
		    		map.put("keyword", keyword);
		    		map.put("keyfield", keyfield);
		    		System.out.println("카테고리 선택한 경우 + 검색한 경우");
		    		
	    		} else { //카테고리만 선택한 경우
	    			map.put("keyword", "null");  //쿼리문 검색 위해 강제로 keyword와 keyfield를 넣어준다.
		    		map.put("keyfield", "null");
	    		}
	    		
	    		System.out.println("디비 들어가기 전");
	    		 list = sqlSession.selectList("reviewboard.getCateSearch", map);

	    		 System.out.println("디비 들어갔다와서");
	    		 System.out.println("DAO"+keyfield + "//" + keyword + "//" + keyword2);
	    		 return list;
	        }else{ //카테고리 선택안한 경우
	        	
	        	//검색한경우
	        	if( keyfield != null && keyword != null && keyfield !="" && keyword !="" ){ //검색 한경우
		    		map.put("keyword", keyword);
		    		map.put("keyfield", keyfield);
		    		return sqlSession.selectList("reviewboard.getSearch", map);
		    		
	    		}else{  //아무것도 검색 안한 경우    
	    			return sqlSession.selectList("reviewboard.getAll");    
	    		}
	        	
	        }
	}
	
	/* 공지사항 글쓰기 */
	public int insertBoard(ReviewBoardVo vo){ 
		int check =	sqlSession.insert("reviewboard.insert",vo);	
		return check;
	}

	/* 공지사항 글 보기 */
	public ReviewBoardVo viewBoard(Long no){
		return sqlSession.selectOne("reviewboard.view",no);
	}
	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount(Long no){
		sqlSession.update("reviewboard.updateviewcnt",no);

	}

	/* 공지사항 글 삭제 */
	public int delete(Long no){
		return sqlSession.delete("reviewboard.delete",no);	
	}
	/* 공지사항 글 수정 --글만수정 */
	public int modify(ReviewBoardVo reviewBoardVo){
		int check = sqlSession.update("reviewboard.modify",reviewBoardVo);	
		return check;
	}
	public List<ReplyVo> getReplyAll(Long reviewNo){
		List<ReplyVo> list = sqlSession.selectList("reviewboard.getReplyAll",reviewNo);
		return list;

	}
	public int reply(ReplyVo replyVo){
		int check = sqlSession.insert("reviewboard.reply",replyVo);
		return check;
	}
	
	public int deletereply(Long replyNo){
		int check = sqlSession.delete("reviewboard.deletereply",replyNo);
		return check;
	}
}
