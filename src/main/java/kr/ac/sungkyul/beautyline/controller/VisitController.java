package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.beautyline.service.VisitService;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Controller
@RequestMapping("/visit")
public class VisitController {

	@Autowired
	VisitService visitService;

	@RequestMapping("/visitform")
	public String visitForm() {

		return "visit/visitform";
	}

	@RequestMapping(value = "/visited", method = RequestMethod.POST)
	public String visited(@ModelAttribute VisitVo visitVo, MultipartFile file) {
		visitService.update(visitVo, file);
		return "redirect:/visit/visitform";
	}

	@RequestMapping("/details")
	public String details() {
		return "visit/details";
	}

	@RequestMapping(value = "/visitorsearchform")
	public String visitorSearchForm(@ModelAttribute UserVo userVo, Model model) {
		List<UserVo> list = visitService.search(userVo);
		model.addAttribute("visitList", list);
		return "visit/visitorsearchform";
	}

	@RequestMapping(value = "/packagecharge", method = RequestMethod.GET)
	public String packageCharge(VisitVo visitVo) {

		return "visit/packagecharge";
	}

	@RequestMapping("/registraion")
	public String registration() {
		return "registration";
	}

}
