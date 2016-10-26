package kr.ac.sungkyul.beautyline.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	
	/* 회원가입 아작스	*/
	@ResponseBody
	@RequestMapping(value ="join", method = RequestMethod.POST)
	public int join(@RequestBody UserVo vo) {//회원가입 버튼 누를 때
		System.out.println(vo);
		int a = userService.join(vo);
		return a; 
	}

	@ResponseBody
	@RequestMapping(value ="checkId", method = RequestMethod.POST)
	public String checkId(@RequestParam String id){//회원가입시 id중복체크
		String check = userService.checkId(id);
		return check;
	}
	
	/*--------------*/
	
	@RequestMapping(value ="android", method = RequestMethod.POST)
	public void test(HttpServletRequest request) {
		System.out.println("name : " + request.getParameter("name"));
		System.out.println("안드로이드 테스트!!!!!!");
		System.out.println("안드로이드 테스트!!!!!!");
		System.out.println("안드로이드 테스트!!!!!!");
		System.out.println("안드로이드 테스트!!!!!!");
	
	}
	
	
	
	
	/* --  로그인  -- */
	@RequestMapping("/loginform")
	public String loginform() {
		return "user/loginform";
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session, @RequestBody UserVo vo){

		UserVo authUser = userService.login(vo);
		if (authUser == null) {
			System.out.println("세션값이 없다!!!");
			return "";
		}
		session.setAttribute("authUser", authUser);
		return "found";
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
	
	
	
	
	
	/* 회원 정보 수정 */	
	@RequestMapping("/modifyform")
	public String modifyform(HttpSession session, Model model)  throws Exception  {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		UserVo userVo = userService.getUserInfo(authUser.getNo());
		model.addAttribute("userVo",userVo);
		return "user/modifyform";

	}
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public int modify(HttpSession session, @RequestBody UserVo vo ) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		vo.setNo(authUser.getNo());
		vo.setName(authUser.getName());
	    int check =	userService.updateInfo(vo);
		return check;
	}
	
	
	/*--------------*/

	/* 회원 탈퇴 */
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public int  delete(@RequestParam Long userNo,HttpSession session){
		System.out.println(userNo);
	    int check =	userService.delete(userNo);
	    if(check == 1){ 
		session.removeAttribute("authUser");
		session.invalidate(); //
	    }
		return check;
	
	}
	
	
	
	@RequestMapping(value = "checkLogin", method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String, String> androidTestWithRequest(HttpServletRequest request,
	         @RequestParam("id") String id,
	         @RequestParam("pw") String pw){
	      
	      System.out.println(id);
	      System.out.println(pw);
	      
//	      System.out.println("test"); 
//	      System.out.println(request.getParameter("title"));
//	        System.out.println(request.getParameter("memo"));
	   
	        Map<String, String> result = new HashMap<String, String>();
	        
	        UserVo vo = new UserVo();
	        vo.setId(id);
	        vo.setPassword(pw);
	        
	       UserVo authUser =  userService.login(vo);
	       
	      if(authUser == null){
	          result.put("result", "false");
	          
	      }
	        
	      else {
	         //인증성공
	          result.put("result", "true");
	          result.put("no",authUser.getNo().toString());
	          result.put("name", authUser.getName().toString());
	      }
	        return result;
	           
	   }
	
	
	
	
	
	
	
	
	
	
	
	
	
}
