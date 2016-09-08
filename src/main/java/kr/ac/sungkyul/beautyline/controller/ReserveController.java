package kr.ac.sungkyul.beautyline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/reserveform")
	public String reserveform(){
		return "reserve/reserveform";
	}
}
