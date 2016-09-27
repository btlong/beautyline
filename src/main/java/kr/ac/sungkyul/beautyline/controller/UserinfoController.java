package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.sungkyul.beautyline.service.UserinfoService;
import kr.ac.sungkyul.beautyline.vo.UserinfoVo;


@Controller
@RequestMapping("/userinfo")
public class UserinfoController {

	@Autowired
	private UserinfoService userinfoService;
	
	// 리스트
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listUser(Model model) {
		List<UserinfoVo> listUser = userinfoService.listUser();
		//System.out.println(listUser.toString());
		model.addAttribute("listUser", listUser);
		return "userinfo/list";
	}	
	
/*	// 상세
	@RequestMapping(value = "viewuser", method = RequestMethod.GET)
	public String readUser(long no, Model model) {
		UserinfoVo userinfoVo = userinfoService.selectUser(no);
		model.addAttribute("UserinfoVo", userinfoVo);
		return "userinfo/viewuser";
	}*/
	
	// 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String modifyUser(long no) {
		//System.out.println(no);
		userinfoService.deleteUser(no);
		return "redirect:list";
	}
	
	// 수정폼
	@RequestMapping(value = "modifyuser", method = RequestMethod.GET)
	public String modifyUser(long no, Model model) {
		UserinfoVo userinfoVo = userinfoService.selectUser(no);
		model.addAttribute("UserinfoVo", userinfoVo);
		return "userinfo/modifyuser";
	}
	
	// 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String modifyUser(UserinfoVo userinfoVo) {
		userinfoService.updateUser(userinfoVo);
		return "redirect:list";
	}
	
/*	// 쿠폰조회
	@RequestMapping(value = "couponview", method = RequestMethod.GET)
	public String readCoupon(long no, Model model) {
		UserinfoVo userinfoVo = userinfoService.selectUser(no);
		List<CouponviewVo> listCoupon = userinfoService.listCoupon();
		model.addAttribute("UserinfoVo", userinfoVo);
		model.addAttribute("listCoupon", listCoupon);
		return "userinfo/couponview";
	}*/

	
/*	// 쿠폰조회
	@RequestMapping(value = "couponview", method = RequestMethod.GET)
	public String listCoupon(Model model) {
		List<CouponviewVo> listCoupon = userinfoService.listCoupon();
		model.addAttribute("listCoupon", listCoupon);
		return "userinfo/couponview";
	}*/
	
}
