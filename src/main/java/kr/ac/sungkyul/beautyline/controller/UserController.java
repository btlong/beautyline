package kr.ac.sungkyul.beautyline.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	
	/* -- 회원가입  -- */	
	
	@RequestMapping("/joinform")
	public String joinform() { //회원가입 폼

		return "user/joinform";
	}
	
	@RequestMapping("/join")
	public String join(@ModelAttribute UserVo vo) {//회원가입 버튼 누를 때
		userService.join(vo);
		return "redirect:/main"; // redirect해야함
	}
	
	@RequestMapping("/joinsuccess")
	public String joinsuccess() { //회원가입 성공시
		return "user/joinsuccess"; // redirect해야함
	}
	
	@ResponseBody
	@RequestMapping(value ="checkId", method = RequestMethod.POST)
	public String checkId(@RequestParam String id){//회원가입시 id중복체크
		String check = userService.checkId(id);
		return check;
	}
	
	/*--------------*/
	
	
	
	
	
	/* --  로그인  -- */
	@RequestMapping("/loginform")
	public String loginform() {

		return "user/loginform";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session,

			@RequestParam(value = "id", required = false, defaultValue = "") String id,
			@RequestParam(value = "password", required = false, defaultValue = "") String password) {

		UserVo authUser = userService.login(id, password);
		if (authUser == null) {
			System.out.println("세션값이 없다!!!");
			return "redirect:/user/loginform";
		}
		session.setAttribute("authUser", authUser);
		return "redirect:/main";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.invalidate(); //
		return "redirect:/main";
	}
	
	@ResponseBody
	@RequestMapping(value="idfind", method=RequestMethod.POST) //아이디 찾기
	public String idfind  (@RequestBody UserVo userVo) throws Exception {
		String findResult = userService.getId(userVo);
		System.out.println(findResult);
		return findResult;
    }
	
	@ResponseBody
	@RequestMapping(value="pwfind", method=RequestMethod.POST) //아이디 찾기
	public String pwfind  (@RequestBody UserVo userVo) throws Exception {
		String findResult = userService.getPw(userVo);
		System.out.println(findResult);
		return findResult;
    }
	
	/*--------------*/
	
	
	

	

	

	

	@RequestMapping("/modifyform")
	public String modifyform(HttpSession session) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		userService.getUserInfo(authUser.getNo());
		return "user/modifyform";

	}

	@RequestMapping(value="/modify", method=RequestMethod.POST)
//	public String modify(HttpSession session,@RequestParam(value="name", required=false, defaultValue="") String name, @RequestParam(value="password", required=false, defaultValue="") String password, @RequestParam(value="gender", required=false, defaultValue="") String gender ){

	public String modify(HttpSession session, @ModelAttribute UserVo vo) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		vo.setNo(authUser.getNo());
		userService.updateInfo(vo);

		authUser.setName(vo.getName());
		return "redirect:/main";

	}
	
	
	


	
	
	
}
