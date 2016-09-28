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
import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	//달력화면
	@RequestMapping("/calenderform")
	public String calenderform(){
		return "reserve/calenderform";
	}
	
	//관리자 예약리스트 조회
	@RequestMapping( value = "reservelist", method = RequestMethod.GET)
	public String reservelist( Model model ){
		List<ReserveVo> resList = reserveService.resList();
		
		model.addAttribute("resList", resList);
		return "reserve/reservelist";
	}
	
	//예약시간선택화면
	@RequestMapping(value = "reserveform", method = RequestMethod.GET)
	public String reserveform( String resDate, Model model ){
		//날짜에 맞는 시간 리스트로 받아오기
		List<ReserveVo> resSelList = reserveService.resDaySel( resDate ); 
		
		//예약일로 검색한 결과 리스트를 화면으로 보낸다.
		model.addAttribute( "resSelList", resSelList );
		model.addAttribute( "resDate", resDate );
		return "reserve/reserveform";
	}
	
	//예약하기 눌렀을때
	@RequestMapping(value="reserve", method=RequestMethod.POST)
	public String reserve( ReserveVo reserveVo, Model model ){
	
		// Vo에 담아(폼에서 담아져 온다.) db에 넣는다.
		reserveService.reserve( reserveVo );

		//예약번호를 vo에 넣어서 model.addAttribute로 화면으로 보낸다.	
		model.addAttribute( "reserveVo", reserveVo );
		
		
		return "reserve/reserveok";
	}
	
	//예약취소화면
	@RequestMapping(value = "reservedeleteform", method = RequestMethod.GET)
	public String reservedeleteform( int no, Model model ){
		ReserveVo reserveVo = reserveService.selectReserve( no );
		
		model.addAttribute( "reserveVo", reserveVo );
		return "reserve/reservedeleteform";
	}
	
	//예약취소
	@ResponseBody
	@RequestMapping(value = "reservedelete", method = RequestMethod.POST)
	public String reservedelete( int no ) throws Exception{
	//@RequestBody객체로 받을때 . 객체를 해석하라고 지시하는것임
		System.out.println( "나여기" + no );
		String delResult = reserveService.reserveDelete( no );
		
		return delResult;
	}
	
	   /*@ResponseBody
	   @RequestMapping(value="idfind", method=RequestMethod.POST) //아이디 찾기
	   public String idfind  (@RequestBody UserVo userVo) throws Exception {
	      String findResult = userService.getId(userVo.getName(), userVo.getEmail());
	      System.out.println(findResult);
	      return findResult;
	    }*/
	   

}
