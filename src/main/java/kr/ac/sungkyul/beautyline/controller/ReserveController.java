package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.ReserveService;
import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	UserService userService;
	

/* 관리자 */
	
	//관리자 - 예약화면
	@RequestMapping("/reserve")
	public String reserve(){
		return "reserve/reserve";
	}
	
	//관리자 - 예약리스트 조회
	@RequestMapping( value = "reservelist", method = RequestMethod.GET)
	public String reservelist( Model model ){
		List<ReserveVo> resList = reserveService.resList();
		
		model.addAttribute("resList", resList);
		return "reserve/reservelist";
	}

	//관리자 - 예약취소화면
	@RequestMapping(value = "reservedeleteform", method = RequestMethod.GET)
	public String reservedeleteform( int no, Model model ){
		ReserveVo reserveVo = reserveService.selectReserve( no );
		
		model.addAttribute( "reserveVo", reserveVo );
		return "reserve/reservedeleteform";
	}
	
	//관리자 - 예약취소
	@ResponseBody
	@RequestMapping(value = "reservedelete", method = RequestMethod.POST)
	public int reservedelete( int no ) throws Exception{
	//@RequestBody객체로 받을때 . 객체를 해석하라고 지시하는것임
		int delResult = reserveService.reserveDelete( no );
		return delResult;
	}
	
	//관리자 - 회원 조회
	@ResponseBody
	@RequestMapping(value = "reserveusersearch", method = RequestMethod.POST)
	public List<UserVo> UserSearch( String name ) throws Exception{
		List<UserVo> userList = reserveService.UserSearch( name );
		return userList;
	}
	
	//관리자 - 회원 추가
	@ResponseBody
	@RequestMapping(value = "insertUser", method = RequestMethod.POST)
	public UserVo insertUser(@RequestBody UserVo uservo ) throws Exception{
		UserVo uservi = userService.insertUserNamePhone(uservo);
		return uservi;
	}
	

/* 회원 */
	//회원 - 예약화면
		@RequestMapping("/userreserve")
		public String userreserve(){
			return "reserve/userreserve";
		}
		
	//회원 - 예약 리스트
		@RequestMapping("/userreservelist")
		public String userreservelist( Model model, int userNo ){
			List<ReserveVo> resList = reserveService.resList( userNo );
			
			System.out.println( resList );
			model.addAttribute("resList", resList);
			return "reserve/userreservelist";
		}
		
/* 공통 */
			//예약시간선택화면
	@ResponseBody
	@RequestMapping(value = "reserveDay", method = RequestMethod.POST)
	public List<ReserveVo> reserveform( String resDateText ){
		List<ReserveVo> resSelList = reserveService.resDaySel( resDateText );
		//날짜에 맞는 시간 리스트로 받아오기
		return resSelList;
	}
	
		
		//예약 확인
		@RequestMapping(value="reserveok")
		public String reserveOk(){
			return "reserve/reserveok";
		}

		//예약하기 눌렀을때
		@ResponseBody
		@RequestMapping(value="reserveData", method=RequestMethod.POST)
		public int reserve(@RequestBody ReserveVo reserveVo ){
			// Vo에 담아(폼에서 담아져 온다.) db에 넣는다.
			int count = reserveService.reserve( reserveVo );
			return count;
		}
		
		
	  
}
 