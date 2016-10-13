package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.service.UserinfoService;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

   @Autowired
   private MypageService mypageService;
   
   @Autowired
   UserinfoService userinfoService;
   
   // 요약페이지
	@RequestMapping("/main")
	public String main() {
		return "mypage/main";
	}
   
   
   // 히스토리
      @RequestMapping("/history")
      
      public String listHistory(HttpSession session, ListVo listVo, Model model) {
         UserVo authUser =(UserVo) session.getAttribute("authUser");
         System.out.println("세션 값 : " + authUser.getNo());
         
         listVo.setUserNo(authUser.getNo());
         listVo = mypageService.listHistory(session, listVo);
         
         System.out.println("listVo : " + listVo);
         
         model.addAttribute("listVo", listVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)
         

         return "mypage/history";
      }
   
      
    //쿠폰뷰
  	@ResponseBody
  	@RequestMapping(value = "selectCoupon", method = RequestMethod.POST)
  	public List<CouponVo> readCouponAjax(Long userNo) {
  		List<CouponVo> couponList = userinfoService.couponList(userNo);
  		System.out.println(couponList.toString());
  		return couponList;
  	}
}