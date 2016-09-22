package kr.ac.sungkyul.beautyline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/visit")
public class VisitController {
	
	@RequestMapping("/visitform")
	public String visit() {
		
		return "visit/visitform";
	}
}
