package kr.ac.sungkyul.beautyline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.sungkyul.beautyline.vo.BoardVo;
@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@RequestMapping("/calenderform")
	public String calenderform(){
		return "reserve/calenderform";
	}
	
	@RequestMapping("/reservelist")
	public String reservelist(){
		return "reserve/reservelist";
	}
	
	@RequestMapping(value = "reserveform", method = RequestMethod.GET)
	public String reserveform( ){
		return "reserve/reserveform";
	}
	
	//수정폼
		@RequestMapping(value = "modifyForm", method = RequestMethod.GET)
		public String modifyForm(BoardVo boardVo, Model model) {
		//	boardVo = bbsService.selectBoard(boardVo);
			System.out.println("modifyForm:  " + boardVo.toString());

			model.addAttribute("boardVo", boardVo);
			return "board/modify";
		}
	
	
	@RequestMapping( value="/reservecalsel", method=RequestMethod.POST )
	public String reservecalsel(String day){
		System.out.println( "day" + day);
		return "redirect:/reserve/reserveform";
	}
}
