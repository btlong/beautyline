package kr.ac.sungkyul.beautyline.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.QnABoardVo;


@Repository
public class QnABoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/* 전체글 가져오기 */
	public List<QnABoardVo> getAll(String keyfield, String keyword, String keyword2){
        System.out.println("DAO"+keyfield + "//" + keyword + "//" + keyword2);
    	
        Map<String, String> map = new HashMap<String, String> ();
  
        List<QnABoardVo> list;
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
    		 list = sqlSession.selectList("qnaboard.getCateSearch", map);

    		 System.out.println("디비 들어갔다와서");
    		 System.out.println("DAO"+keyfield + "//" + keyword + "//" + keyword2);
    		 return list;
        }else{ //카테고리 선택안한 경우
        	
        	//검색한경우
        	if( keyfield != null && keyword != null && keyfield !="" && keyword !="" ){ //검색 한경우
	    		map.put("keyword", keyword);
	    		map.put("keyfield", keyfield);
	    		return sqlSession.selectList("qnaboard.getSearch", map);
	    		
    		}else{  //아무것도 검색 안한 경우    
    			return sqlSession.selectList("qnaboard.getAll");    
    		}
        	
        }
	}
	
	

	/* 글쓰기 */
	public void insertBoard(QnABoardVo qbdvo){ 
		sqlSession.insert("qnaboard.insert",qbdvo);	
	}

	/* 답글쓰기 */
	public void insertreply(QnABoardVo qbdvo){ 
		sqlSession.insert("qnaboard.insertreply",qbdvo);	
	}
	
	/* 답글 업뎃 */
	public void updatereply(QnABoardVo qbdvo){ 
		sqlSession.update("qnaboard.updatereply",qbdvo);	
	}
	
	/* 글 보기 */
	public QnABoardVo viewBoard(Long no){
		return sqlSession.selectOne("qnaboard.view",no);
	}
		
	
	/* 조회수 업뎃 */
	public void updateViewCount(Long no){
		sqlSession.update("qnaboard.updateviewcnt",no);

	}
	

	/* 글 삭제 */
	public int delete(QnABoardVo qbdvo){
		return sqlSession.delete("qnaboard.delete",qbdvo);	
	}

	/* 글 수정 */
	public void modify(QnABoardVo qbdvo){
		sqlSession.update("qnaboard.modify",qbdvo);	
	}

}
