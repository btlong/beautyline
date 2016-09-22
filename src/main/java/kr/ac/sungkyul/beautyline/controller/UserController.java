package kr.ac.sungkyul.beautyline.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.sungkyul.beautyline.email.EmailSender;
import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.vo.Email;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
    private EmailSender emailSender;
	
	//dddddd
	
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
	
	
	@RequestMapping(value="/idfind" , method=RequestMethod.POST)
	public String idfind(
			@RequestParam(value = "name", required = false, defaultValue = "") String name,
			@RequestParam(value = "email", required = false, defaultValue = "") String email) {
	
		return "redirect:/user/joinsuccess";

	}
	
	
	@RequestMapping("/send")
    public ModelAndView sendEmailAction () throws Exception {
 
        Email email = new Email();
         
        String reciver = "reciver@email.com"; //받을사람의 이메일입니다.
        String subject = "이메일 제목";
        String content = "이메일 내용입니다.";
         
        email.setReciver(reciver);
        email.setSubject(subject);
        email.setContent(content);
        emailSender.SendEmail(email);
         
        return new ModelAndView("success");
    }

	
	
	
}
