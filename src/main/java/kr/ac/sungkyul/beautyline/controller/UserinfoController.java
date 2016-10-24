package kr.ac.sungkyul.beautyline.controller;

import java.text.DateFormat;
import java.util.Date;
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

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.service.PageService;
import kr.ac.sungkyul.beautyline.service.ReserveService;
import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.service.UserinfoService;
import kr.ac.sungkyul.beautyline.service.VisitService;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.PageVo;
import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.UserinfoVo;

@Controller
@RequestMapping("/userinfo")
public class UserinfoController {

	@Autowired
	private UserinfoService userinfoService;

	@Autowired
	UserService userService;

	@Autowired
	VisitService visitService;

	@Autowired
	ReserveService reserveService;

	@Autowired
	MypageService mypageService;

	@Autowired
	PageService pageService;

	// 회원관리 리스트
	@RequestMapping(value = "list")
	public String listUser(Model model, @RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "nowBlock", required = false) Integer nowBlock,
			@RequestParam(value = "keyField", required = false) String keyField,
			@RequestParam(value = "keyWord", required = false) String keyWord) {

		List<UserinfoVo> listUser = userinfoService.listUser(keyField, keyWord);
		//System.out.println(listUser.toString());
		PageVo page = null;
		try {
			page = userinfoService.pagingProc(nowPage, nowBlock, listUser.size());
		} catch (Exception err) {
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
	@ResponseBody
	@RequestMapping(value = "userdelete", method = RequestMethod.POST)
	public int userdelete( Long userno ) throws Exception{
	//@RequestBody객체로 받을때 . 객체를 해석하라고 지시하는것임
		int delResult = userinfoService.deleteUser( userno );
		return delResult;
	}

	
	/* -- 회원등록  -- */	
	@RequestMapping("/joinform")
	public String joinform() { //회원가입 폼
		return "userinfo/joinform";
	}
	
	/* 관리자 회원등록 아작스	*/
	@ResponseBody
	@RequestMapping(value ="userresister", method = RequestMethod.POST)
	//public int join(@RequestBody UserVo vo) {//회원가입 버튼 누를 때
	public int userresister(@RequestBody(required = false) UserVo vo) {
		//System.out.println("//"+vo);
		int a = userService.userresister(vo);
		return a; 
	}

	@ResponseBody
	@RequestMapping(value ="checkId", method = RequestMethod.POST)
	public String checkId(@RequestParam (value="id", required = false)String id){//회원가입시 id중복체크
		String check = userService.checkId(id);
		return check;
	}
	/*--------------*/
	
	
	
	/* 회원 히스토리 */	
	@RequestMapping(value="/userhistory", method = RequestMethod.GET)
	public String userhistory(Long no, ListVo listVo, Model model) throws Exception {
		System.out.println(no);
		UserVo userVo = userService.getUserInfo(no);
		//예약요약
		List<ReserveVo> myResList = reserveService.myResList(no);
		//방문내역요약
		listVo.setUserNo(no);
		listVo = mypageService.sumListHistory(no, listVo);
		//System.out.println("listVo : " + listVo);

		model.addAttribute("userVo", userVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)
		model.addAttribute("myResList", myResList);
		model.addAttribute("listVo", listVo);
		
		//System.out.println(userVo);
		return "userinfo/userhistory";
	}
	
	// 쿠폰뷰
	@ResponseBody
	@RequestMapping(value = "selectCoupon", method = RequestMethod.POST)
	public List<CouponVo> readCouponAjax(Long userNo) {
		List<CouponVo> couponList = userinfoService.couponList(userNo);
		//System.out.println(couponList.toString());
		return couponList;
	}
	
	// 예약취소
	@ResponseBody
	@RequestMapping(value = "reservedelete", method = RequestMethod.POST)
	public int reservedelete(int no) throws Exception {
		// @RequestBody객체로 받을때 . 객체를 해석하라고 지시하는것임
		int delResult = reserveService.reserveDelete(no);
		return delResult;
	}

	//예약 리스트
	@RequestMapping("userreservelist")
	public String userreservelist(Long no, Model model, 
			@RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "nowBlock", required=false) Integer nowBlock) {
		System.out.println(no);
		Date now = new Date();

		DateFormat format1 = DateFormat.getDateInstance(DateFormat.FULL);
		String today = format1.format(now);
		
		UserVo userVo =userService.getUserInfo(no);
        
		List<ReserveVo> resList = reserveService.resList(no, today);
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
		model.addAttribute("userVo", userVo);
		
		return "reserve/userreservelist";
	}
	
	
	//지난 예약 리스트
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
	
	
	/*------------*/

	
	/* 회원 정보 수정 */	
	@RequestMapping(value="/modifyform", method = RequestMethod.GET)
	public String modifyform(Long no, Model model) throws Exception {
		System.out.println(no);
		UserVo userVo = userService.getUserInfo(no);
		model.addAttribute("userVo", userVo);
		System.out.println(userVo);
		return "userinfo/modifyform";
	}
	
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public int modify(@RequestBody UserVo vo ) {
		int check =	userService.updateInfo(vo);
		return check;
	}
	/*--------------*/
	
	
	
	/* -- 회원가입 -- */
//	@RequestMapping("/joinform")
//	public String joinform() { // 회원가입 폼
//		return "userinfo/joinform";
//	}
//
//	/*
//	 * @RequestMapping("/join") public String join(@ModelAttribute UserVo vo)
//	 * {//회원가입 버튼 누를 때 userService.join(vo); return "redirect:/userinfo/list";
//	 * // redirect해야함 }
//	 */
//	@ResponseBody
//	@RequestMapping(value = "join", method = RequestMethod.POST)
//	public int join(@RequestBody UserVo vo) {// 회원가입 버튼 누를 때
//		System.out.println(vo);
//		int a = userService.join(vo);
//		return a; // redirect해야함
//	}
//
//	@ResponseBody
//	@RequestMapping(value = "checkId", method = RequestMethod.POST)
//	public String checkId(@RequestParam(value = "id", required = false) String id) {// 회원가입시
//																					// id중복체크
//		String check = userService.checkId(id);
//		return check;
//	}
	/*--------------*/

	/* -- 로그인 -- */
	/*@RequestMapping("/loginform")
	public String loginform() {
		return "userinfo/loginform";
	}*/

	/*----------- */

	
	
	
	
	// 수정폼
	/*@RequestMapping(value = "modifyuser", method = RequestMethod.GET)
	public String modifyUser(Long no, Model model) {
		UserinfoVo userinfoVo = userinfoService.selectUser(no);
		model.addAttribute("UserinfoVo", userinfoVo);
		return "userinfo/modifyuser";
	}*/
	
	// 수정
	/*@RequestMapping(value = "update", method = RequestMethod.POST)
	public String modifyUser(UserinfoVo userinfoVo) {
		userinfoService.updateUser(userinfoVo);
		return "redirect:list";
	}*/
	
	//쿠폰뷰
	/*@ResponseBody
	@RequestMapping(value = "selectCoupon", method = RequestMethod.POST)
	public List<CouponVo> readBoardAjax(Long userNo) {
		List<CouponVo> couponList = userinfoService.couponList(userNo);
		System.out.println(couponList.toString());
		return couponList;
	}*/
	
	//쿠폰 insert1
	/*@ResponseBody
	@RequestMapping(value = "insertCoupon1", method = RequestMethod.POST)
	public int insertCoupon1(@RequestBody CouponVo couponvo){
		System.out.println("insert왔쟈"+couponvo);
		int ck1 = userinfoService.insertCoupon(couponvo);
		return ck1;
	}*/
	//쿠폰 insert2
	/*@ResponseBody
	@RequestMapping(value = "insertCoupon2", method = RequestMethod.POST)
	public int insertCoupon2(@RequestBody CouponVo couponvo){
		System.out.println("insert왔쟈"+couponvo);
		int ck2 = userinfoService.insertCoupon(couponvo);
		return ck2;
	}*/
	//쿠폰 insert3
	/*@ResponseBody
	@RequestMapping(value = "insertCoupon3", method = RequestMethod.POST)
	public int insertCoupon3(@RequestBody CouponVo couponvo){
		System.out.println("insert왔쟈"+couponvo);
		int ck3 = userinfoService.insertCoupon(couponvo);
		return ck3;
	}*/
	//쿠폰 insert4
	/*@ResponseBody
	@RequestMapping(value = "insertCoupon4", method = RequestMethod.POST)
	public int insertCoupon4(@RequestBody CouponVo couponvo){
		System.out.println("insert왔쟈"+couponvo);
		int ck4 = userinfoService.insertCoupon(couponvo);
		return ck4;
	}*/
}