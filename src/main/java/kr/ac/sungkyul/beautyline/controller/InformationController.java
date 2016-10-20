package kr.ac.sungkyul.beautyline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/information")
public class InformationController {

	@RequestMapping("/brand")
	public String brand() {
		return "information/brand";
	}
	
	@RequestMapping("/program")
	public String program() {
		return "information/program";
	}

	@RequestMapping("/basic")
	public String basic() {
		return "information/basic";
	}
	@RequestMapping("/white")
	public String white() {
		return "information/white";
	}
	@RequestMapping("/lifting")
	public String lifting() {
		return "information/lifting";
	}
	@RequestMapping("/acne")
	public String acne() {
		return "information/acne";
	}
}
