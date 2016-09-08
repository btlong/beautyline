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
}
