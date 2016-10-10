package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.service.UserinfoService;
import kr.ac.sungkyul.beautyline.vo.PageVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.UserinfoVo;


@Controller
@RequestMapping("/userinfo")
public class UserinfoController {

	@Autowired
	private UserinfoService userinfoService;
	
	@Autowired
	UserService userService;
	
	// 리스트
	@RequestMapping(value = "list")
	public String listUser(Model model,
			@RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "nowBlock", required=false) Integer nowBlock, 
			@RequestParam(value = "keyField", required=false) String keyField, 
			@RequestParam(value = "keyWord", required=false) String keyWord){
		
		List<UserinfoVo> listUser = userinfoService.listUser(keyField, keyWord);
		System.out.println(listUser.toString());
		PageVo page = null;
        try{
            page = userinfoService.pagingProc(nowPage, nowBlock, listUser.size());
        }
        catch(Exception err){
            System.out.println("현재페이지와 현재블럭이 존재하지 않아 0을 대입했습니다.");
            System.out.println("에러내용은 다음과 같습니다." + err);
            page = userinfoService.pagingProc(0, 0, listUser.size());
        }
		model.addAttribute("listUser", listUser);
		model.addAttribute("page", page);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return "userinfo/list";
	}	
	
	
	
	// 회원삭제
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
	
	
	/* -- 회원가입  -- */	
	@RequestMapping("/joinform")
	public String joinform() { //회원가입 폼
		return "userinfo/joinform";
	}
	
	
	
	/*@RequestMapping("/join")
	public String join(@ModelAttribute UserVo vo) {//회원가입 버튼 누를 때
		userService.join(vo);
		return "redirect:/userinfo/list"; // redirect해야함
	}*/
	@ResponseBody
	@RequestMapping(value ="join", method = RequestMethod.POST)
	public int join(@RequestBody UserVo vo) {//회원가입 버튼 누를 때
		System.out.println(vo);
		int a = userService.join(vo);
		return a; // redirect해야함
	}
	
	
	
	@ResponseBody
	@RequestMapping(value ="checkId", method = RequestMethod.POST)
	public String checkId(@RequestParam (value = "id", required = false) String id){//회원가입시 id중복체크
		String check = userService.checkId(id);
		return check;
	}
	/*--------------*/
	
	
	
	/* --  로그인  -- */
	@RequestMapping("/loginform")
	public String loginform() {
		return "userinfo/loginform";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session,

			@RequestParam(value = "id", required = false, defaultValue = "") String id,
			@RequestParam(value = "password", required = false, defaultValue = "") String password){

		UserVo authUser = userService.login(id, password);
		if (authUser == null) {
			return "redirect:/userinfo/loginform";
		}
		session.setAttribute("authUser", authUser);
		return "redirect:/userinfo/list";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.invalidate(); //
		return "redirect:/main";
	}
	/* -------------- */
	
	
	
	
	
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
