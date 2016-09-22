package kr.ac.sungkyul.beautyline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.sungkyul.beautyline.service.CounselService;
import kr.ac.sungkyul.beautyline.vo.ResultVo;
import kr.ac.sungkyul.beautyline.vo.ScoreVo;

@Controller
@RequestMapping("/coun")
public class CounselController {
	
	@Autowired
	private CounselService counService;
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String Test() {		
		return "counsel/test";
	}
	
	@RequestMapping(value = "result", method = RequestMethod.POST)
	public String Result(ScoreVo scoreVo, Model model) {	
		System.out.println(scoreVo.toString());
		ResultVo resultVo = counService.recommend(scoreVo);
		
		model.addAttribute("url", resultVo.getUrl());
		model.addAttribute("src", resultVo.getSrc());
		return "counsel/result";
	}
	
}
