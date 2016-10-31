package kr.ac.sungkyul.beautyline.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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

import kr.ac.sungkyul.beautyline.service.PageService;
import kr.ac.sungkyul.beautyline.service.ReserveService;
import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.vo.PageVo;
import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	PageService pageService;

/* 관리자 */
	
	//관리자 - 예약화면
	@RequestMapping("/reserve")
	public String reserve(){
		return "reserve/reserve";
	}
	
	//관리자 - 예약리스트 조회
	@RequestMapping( "reservelist" )
	public String reservelist( Model model,
			@RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "nowBlock", required=false) Integer nowBlock, 
			@RequestParam(value = "keyField", required=false) String keyField,
		    @RequestParam(value = "keyWord", required=false) String keyWord
			){
		Date now = new Date();

		DateFormat format1 = DateFormat.getDateInstance(DateFormat.FULL);
		String today = format1.format(now);
		
		List<ReserveVo> resList = reserveService.resList(keyField, keyWord, today);
		PageVo page = null;
        try{
            page = pageService.pagingProc(nowPage, nowBlock, resList.size());
        }
        catch(Exception err){
            page = pageService.pagingProc(0, 0, resList.size());
        }
		model.addAttribute("page", page);
		model.addAttribute("resList", resList);
		model.addAttribute("keyField", keyField);
	    model.addAttribute("keyWord", keyWord);
	    model.addAttribute("today", today);

		return "reserve/reservelist";
	}

	//관리자 - 지난 예약리스트 조회
		@RequestMapping( "reservePastList" )
		public String reservePastList( Model model,
				@RequestParam(value = "nowPage", required = false) Integer nowPage,
				@RequestParam(value = "nowBlock", required=false) Integer nowBlock, 
				@RequestParam(value = "keyField", required=false) String keyField,
			    @RequestParam(value = "keyWord", required=false) String keyWord
				){
			
			Date now = new Date();

			DateFormat format1 = DateFormat.getDateInstance(DateFormat.FULL);
			String today = format1.format(now);
			

			List<ReserveVo> resList = reserveService.reservePastList(keyField, keyWord, today);
			PageVo page = null;
	        try{
	            page = pageService.pagingProc(nowPage, nowBlock, resList.size());
	        }
	        catch(Exception err){
	            page = pageService.pagingProc(0, 0, resList.size());
	        }
			model.addAttribute("page", page);
			model.addAttribute("resList", resList);
			model.addAttribute("keyField", keyField);
		    model.addAttribute("keyWord", keyWord);
		    model.addAttribute("today", today);
			return "reserve/reservePastList";
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
	

/*------------------------------------------------ 회원-------------------------------------------------- */
	//회원 - 예약화면
		@RequestMapping("/userreserve")
		public String userreserve(){
			return "reserve/userreserve";
		}
		
	//회원 - 예약 리스트
		@RequestMapping("userreservelist")
		public String userreservelist( Model model, 
				@RequestParam(value = "nowPage", required = false) Integer nowPage,
				@RequestParam(value = "nowBlock", required=false) Integer nowBlock,
				HttpSession session
				){
			Date now = new Date();

			DateFormat format1 = DateFormat.getDateInstance(DateFormat.FULL);
			String today = format1.format(now);
			
			UserVo authUser =(UserVo) session.getAttribute("authUser");
	        Long userNo = authUser.getNo();
	        
			List<ReserveVo> resList = reserveService.resList( userNo, today);
			PageVo page = null;
	        try{
	            page = pageService.pagingProc(nowPage, nowBlock, resList.size());
	        }
	        catch(Exception err){
	            page = pageService.pagingProc(0, 0, resList.size());
	        }
	        
			model.addAttribute("page", page);
			model.addAttribute("resList", resList);
			model.addAttribute("today",today);
			model.addAttribute("authUser",authUser);
			
			return "reserve/userreservelist";
		}
		
		
		//회원 - 지난 예약 리스트
		@RequestMapping("userreservepastlist")
		public String userReservePastList( Model model, 
					@RequestParam(value = "nowPage", required = false) Integer nowPage,
					@RequestParam(value = "nowBlock", required=false) Integer nowBlock,
					HttpSession session
						){
			
				Date now = new Date();

				DateFormat format1 = DateFormat.getDateInstance(DateFormat.FULL);
				String today = format1.format(now);
			
			   	UserVo authUser =(UserVo) session.getAttribute("authUser");
			       Long userNo = authUser.getNo();
			        
				List<ReserveVo> resList = reserveService.resPastList( userNo, today);
					PageVo page = null;
			        try{
			            page = pageService.pagingProc(nowPage, nowBlock, resList.size());
			        }
			        catch(Exception err){
			            page = pageService.pagingProc(0, 0, resList.size());
			        }
					model.addAttribute("authUser", authUser);
					model.addAttribute("page", page);
					model.addAttribute("resList", resList);
					model.addAttribute("today",today);
					
					return "reserve/userreservepastlist";
			}
/*------------------------------------------------- 공통--------------------------------------------------- */
	//예약시간선택화면
	@ResponseBody
	@RequestMapping(value = "reserveDay", method = RequestMethod.POST)
	public List<ReserveVo> reserveform( String resDateText ){
		List<ReserveVo> resSelList = reserveService.resDaySel( resDateText );
		//날짜에 맞는 시간 리스트로 받아오기
		return resSelList;
	}
	
	//예약취소
	@ResponseBody	
	@RequestMapping(value = "reservedelete", method = RequestMethod.POST)
	public int reservedelete( @RequestParam Long no ) throws Exception{
	//@RequestBody객체로 받을때 . 객체를 해석하라고 지시하는것임
		int delResult = reserveService.reserveDelete( no );
		return delResult;
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
	
	/*------------------------------------------------- 안드--------------------------------------------------- */
	@RequestMapping(value = "android", method = RequestMethod.POST)
	   @ResponseBody
	   public String androidTestWithRequest(HttpServletRequest request,
               @RequestParam("resDate") String resDate,
               @RequestParam("resTime") String resTime,
               @RequestParam("progNo") String progNo,
               @RequestParam("userNo") String userNo){
		
		//Integer programNo;
		Integer a=Integer.parseInt(resTime);	
			ReserveVo reserveVo = new ReserveVo();
			reserveVo.setResDate(resDate);
			reserveVo.setResTime(a);
			reserveVo.setUserNo(Integer.parseInt(userNo));
			reserveVo.setProgName(progNo);
			int count = reserveService.reserve( reserveVo );
			String result = count+"";
			System.out.println(result);

				return result;


		}

	
	 //안드로이드 - 회원 예약 리스트
	@ResponseBody
    @RequestMapping(value="andReserveList", method = RequestMethod.POST)
    public List<ReserveVo> andReserveList(  
          @RequestParam("no") Long no
          ){
       
       System.out.println("안드로이드 들어와땅"+no);
       Date now = new Date();

       DateFormat format1 = DateFormat.getDateInstance(DateFormat.FULL);
       String today = format1.format(now);
                  
       List<ReserveVo> resList = reserveService.resList( no, today);
       System.out.println(resList);
        
    
        return resList;
    }
	 
} 
