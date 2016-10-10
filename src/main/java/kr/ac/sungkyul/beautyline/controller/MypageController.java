package kr.ac.sungkyul.beautyline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.vo.ListVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;
	
	// 히스토리
		@RequestMapping("/history")
		public String listHistory(ListVo listVo, Model model) {
			
			listVo.setUserNo(83L);
			listVo = mypageService.listHistory(listVo);
			
			System.out.println("listVo : " + listVo);
			
			model.addAttribute("listVo", listVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)
			

			return "mypage/history";
		}
	
}
