package kr.ac.sungkyul.beautyline.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.beautyline.vo.FileNotiVo;
import kr.ac.sungkyul.beautyline.vo.NoticeBoardVo;



@Repository
public class NoticeBoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	/* 글 가져오기 */
	public List<NoticeBoardVo> getAll(String keyfield, String keyword, String keyword2){

        Map<String, String> map = new HashMap<String, String> ();
  
        List<NoticeBoardVo> list;
        if( keyword2 != null ){ //카테고리 선택한 경우
        	//검색따로 안한경우
        	if( keyword2.equalsIgnoreCase("cateNoti")){ //예약인경우
        		keyword2 = "공지";
        	}else{ //프로그램인경우
        		keyword2 = "이벤트";
        	}
        	
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
    		 list = sqlSession.selectList("noticeboard.getCateSearch", map);

    		 System.out.println("디비 들어갔다와서");
    		 System.out.println("DAO"+keyfield + "//" + keyword + "//" + keyword2);
    		 return list;
        }else{ //카테고리 선택안한 경우
        	
        	//검색한경우
        	if( keyfield != null && keyword != null && keyfield !="" && keyword !="" ){ //검색 한경우
	    		map.put("keyword", keyword);
	    		map.put("keyfield", keyfield);
	    		return sqlSession.selectList("noticeboard.getSearch", map);
	    		
    		}else{  //아무것도 검색 안한 경우    
    			return sqlSession.selectList("noticeboard.getAll");    
    		}
        	
        }
	}
	
	/* 공지사항 글쓰기 */
	public Long insertBoard(NoticeBoardVo vo){ 
		sqlSession.insert("noticeboard.insert",vo);	
		return vo.getNo();
	}

	/* 공지사항 글 보기 */
	public NoticeBoardVo viewBoard(Long no){
		return sqlSession.selectOne("noticeboard.view",no);
	}
	
	
	public void insertFileNoti(FileNotiVo fileVo ){ // 게시판 글작성 첨부파일 
		sqlSession.insert("noticeboard.insertFileNoti", fileVo);
	}

	
	/* 글 보기 눌렀을 때 첨부파일 이름 가져오기  & 다운*/
	public FileNotiVo selectFileNotiByNo(Long noticeNo){//글 보기를 눌렀을때 첨부파일 이름 가져오기위한 dao
		return  sqlSession.selectOne("noticeboard.selectFileNotiByNo",noticeNo);
		
	}
	

	
	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount(Long no){
		sqlSession.update("noticeboard.updateviewcnt",no);

	}
	

	/* 공지사항 글 삭제 */
	public int delete(Long no){
		return sqlSession.delete("noticeboard.delete",no);	
	}

	/* 공지사항 글 수정 --글만수정 */
	public void modify(NoticeBoardVo noticeBoardVo){
		sqlSession.update("noticeboard.modify",noticeBoardVo);	
	}
	
	
	/* 파일 삭제 */
	public int delFile(Long fileNo){
		return sqlSession.delete("noticeboard.delFile",fileNo);
	}

}
