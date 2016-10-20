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
	
	
	
	/* 글 가져오기 */
	public List<QnABoardVo> getAll(String keyfield, String keyword, String keyword2){
    	
        Map<String, String> map = new HashMap<String, String> ();
  
        List<QnABoardVo> list;
        if( keyword2 != null ){ //카테고리 선택한 경우
        	//검색따로 안한경우
        	if( keyword2.equalsIgnoreCase("cateRes")){ //예약인경우
        		keyword2 = "예약";
        	}else{ //프로그램인경우
        		keyword2 = "프로그램";
        	}
        	
        	map.put("keyword2", keyword2);
    		
        	if( keyfield != null && keyword != null && keyfield !="" && keyword !="" ){//검색 한경우
	    		map.put("keyword", keyword);
	    		map.put("keyfield", keyfield);
	    		
    		} else { //카테고리만 선택한 경우
    			map.put("keyword", "null");  //쿼리문 검색 위해 강제로 keyword와 keyfield를 넣어준다.
	    		map.put("keyfield", "null");
    		}
    		
    		 list = sqlSession.selectList("qnaboard.getCateSearch", map);

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
	

	/* 답글을 위해 원글 작성자 알아오기 */
	public Long getOrgNo( Long no ){
		return sqlSession.selectOne("qnaboard.getOrgNo",no);
	}
	
	/* 글 삭제 */
	public int delete(QnABoardVo qbdvo){
		/* 1. 삭제할 글에 답글이 있는지 확인한다.
		 * 	1-1. 없으면 삭제
		 *  1-2. 있으면 status를 1로 바꿔준다.
		 */
		//1. 삭제할 글에 답글 있는지 확인 ( 삭제할 글의 group에서 order_no+1의 depth값이 원글의 depth값보다 크면 답글)

		//지금 그룹에 status 1인 것이 있으면 이 그룹삭제
		Long statusCh =  sqlSession.selectOne("qnaboard.searchStatus", qbdvo); //그룹을 삭제할지 안할지 체크

		if( statusCh == 1 ){
			//그룹을 삭제할 것임
			return sqlSession.delete("qnaboard.deleteGroup",qbdvo);
			
		}else{
			//그룹에서 마지막 글이 아님
			Long delcheck = sqlSession.selectOne("qnaboard.delStatus",qbdvo); //답글 있는지 체크
			
			if( delcheck == 0 ){
				return sqlSession.delete("qnaboard.delete",qbdvo);	
			}else{
				return sqlSession.update("qnaboard.updateStatus",qbdvo);
			}
		}
		
		

	}

	/* 글 수정 */
	public void modify(QnABoardVo qbdvo){
		sqlSession.update("qnaboard.modify",qbdvo);	
	}

}
