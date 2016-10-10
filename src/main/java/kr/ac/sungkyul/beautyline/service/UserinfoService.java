package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.UserinfoDao;
import kr.ac.sungkyul.beautyline.vo.PageVo;
import kr.ac.sungkyul.beautyline.vo.UserinfoVo;

@Service
public class UserinfoService {

	@Autowired
	private UserinfoDao userinfoDao;
	
	// 리스트
	public List<UserinfoVo> listUser(String keyfield, String keyword){
		return userinfoDao.listUser(keyfield, keyword);
	}
		
	//회원번호에의한 리스트뽑기
	/*public UserinfoVo findByNo(int no) {
        return userinfoDao.findByNo(no);
    }*/
	
	// 쿠폰뷰
/*	public List<CouponVo> couponList(long no) {
		return userinfoDao.selectList(no);
	}*/

	
	// 회원삭제
	public void deleteUser(long no){
		userinfoDao.deleteUser(no);
	}
	
	// 수정폼
	public UserinfoVo selectUser(long no){
		return userinfoDao.selectUser(no);
	}
	
	// 수정
	public void updateUser(UserinfoVo userinfoVo){
		userinfoDao.updateUser(userinfoVo);
	}
	
/*	public static CouponviewVo couponView(long userNo){
		return userinfoDao.couponView(userNo);
	}*/

/*	public List<CouponviewVo> listCoupon(){
		return userinfoDao.listCoupon();
	}*/
	
	// 페이징
    public PageVo pagingProc(int nowPage, int nowBlock, int totalRecord) {
        int numPerPage = 10; //한페이지에 보여질 게시물수
        int pagePerBlock = 5; //한페이지에 보여지는 블럭의 개수 
        int totalPage = (int)Math.ceil((double)totalRecord / numPerPage); //전체 페이지= 전체 게시물수 ÷ 한페이지에 보여질 게시물 수
        int beginPerPage = nowPage * numPerPage;//한페이지에 보여지는 가장 맨 윗글, 현재페이지 × 한 페이지에 담을 게시물 개수 
        int totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);//전체 블럭 = 전체 페이지 ÷ 한페이지에 보여지는 블럭수
        
        PageVo page = new PageVo();
        
        page.setBeginPerPage(beginPerPage);
        page.setNowBlock(nowBlock);
        page.setNowPage(nowPage);
        page.setNumPerPage(numPerPage);
        page.setPagePerBlock(pagePerBlock);
        page.setTotalBlock(totalBlock);
        page.setTotalPage(totalPage);
        page.setTotalRecord(totalRecord);
        
        return page;
    }


}
