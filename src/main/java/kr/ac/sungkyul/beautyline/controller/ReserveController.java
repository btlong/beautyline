package kr.ac.sungkyul.beautyline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping( value="/reservecalsel", method=RequestMethod.POST )
	public String reservecalsel(String day){
		System.out.println( "day" + day);
		return "redirect:/reserve/reserveform";
	}
}
