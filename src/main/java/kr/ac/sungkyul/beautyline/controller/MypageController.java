package kr.ac.sungkyul.beautyline.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.service.UserinfoService;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

   @Autowired
   private MypageService mypageService;
   
   @Autowired
   UserinfoService userinfoService;

   @Autowired
   UserService userService;
   
    
   /* 요약페이지 */
	@RequestMapping("/main")
	public String main(HttpSession session, VisitVo visitVo, Model model) {
		UserVo authUser =(UserVo) session.getAttribute("authUser");
        //System.out.println("세션 값 : " + authUser.getNo());
        UserVo userVo = userService.getUserInfo(authUser.getNo());
        
        visitVo.setUserNo(authUser.getNo());
        //visitVo = mypageService.listHistory(session, visitVo);
        
        System.out.println("visitVo : " + visitVo);
        
        model.addAttribute("visitVo", visitVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)
        model.addAttribute("userVo",userVo);
		
		return "mypage/main";
	}
	@RequestMapping("/history2")
	public String listHistory2(HttpSession session, ListVo listVo, Model model) {
		UserVo authUser =(UserVo) session.getAttribute("authUser");
		System.out.println("세션 값 : " + authUser.getNo());
		
		listVo.setUserNo(authUser.getNo());
		listVo = mypageService.listHistory(session, listVo);
		
		System.out.println("listVo : " + listVo);
		
		model.addAttribute("listVo", listVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)
		
		
		return "mypage/history2";
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
   
      
      // 사진 출력
      @RequestMapping(value = "download", method = RequestMethod.GET)
      public void viewImg(String saveName, HttpServletResponse res) throws Exception {
    	  String path = "C:\\upload\\beautyline\\"; 
         res.setContentType("application/download");
         res.setHeader("Content-disposition", "attachment; filename=\"" + URLEncoder.encode(saveName,"UTF-8") +"\""); // orgname으로 바꿔서 보내준다.
         OutputStream resOut = res.getOutputStream();
         FileInputStream fin = new FileInputStream( path + saveName); // savename을  orgname으로 바꿔서 보내준다.
         FileCopyUtils.copy(fin, resOut);
         fin.close();
          
      }
      @RequestMapping("imageview")
      public String imageView() {
    	  
    	  return "mypage/imageview";
      }
   
      
    //쿠폰뷰
  	@ResponseBody
  	@RequestMapping(value = "selectCoupon", method = RequestMethod.POST)
  	public List<CouponVo> readCouponAjax(Long userNo) {
  		List<CouponVo> couponList = userinfoService.couponList(userNo);
  		System.out.println(couponList.toString());
  		return couponList;
  	}
  	
  	/* 회원 정보 수정 */
  	@RequestMapping("/modifyform")
	public String modifyform(HttpSession session, Model model)  throws Exception  {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		UserVo userVo = userService.getUserInfo(authUser.getNo());
		model.addAttribute("userVo",userVo);
		return "user/modifyform";
	}
  	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public int modify(HttpSession session, @RequestBody UserVo vo ) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		vo.setNo(authUser.getNo());
		vo.setName(authUser.getName());
	    int check =	userService.updateInfo(vo);
		return check;
	}
  	/*--------------*/
}