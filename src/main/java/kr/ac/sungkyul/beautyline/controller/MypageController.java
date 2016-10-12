package kr.ac.sungkyul.beautyline.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;
	
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
	
}
