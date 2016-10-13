package kr.ac.sungkyul.beautyline.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

   @Autowired
   private MypageService mypageService;
   
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
   
}