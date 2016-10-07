package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;
	
	// 히스토리
		@RequestMapping("/history")
		public String listHistory(Long userNo, Model model) {
			
			List<VisitVo> listHistory = mypageService.listHistory(83L);

			// jsp에 넘겨준다.
			model.addAttribute("listHistory", listHistory); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)

			return "mypage/history";
		}
	
}
