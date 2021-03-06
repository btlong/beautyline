package kr.ac.sungkyul.beautyline.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.MypageService;
import kr.ac.sungkyul.beautyline.service.ReserveService;
import kr.ac.sungkyul.beautyline.service.UserService;
import kr.ac.sungkyul.beautyline.service.UserinfoService;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.ReserveVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@Autowired
	UserinfoService userinfoService;

	@Autowired
	UserService userService;

	@Autowired
	ReserveService reserveService;

	/* ----관리자---- */
	//관리자페이지
	@RequestMapping("/adminmain")
	public String adminmain(HttpSession session, ListVo listVo, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		// System.out.println("세션 값 : " + authUser.getNo());
		UserVo userVo = userService.getUserInfo(authUser.getNo());

		model.addAttribute("userVo", userVo);
		return "mypage/adminmain";
	}
	
	// 관리자 정보 수정	
	@RequestMapping(value="/adminmodifyform", method = RequestMethod.GET)
	public String modifyform(HttpSession session, Model model) throws Exception {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		UserVo userVo = userService.getUserInfo(authUser.getNo());
		model.addAttribute("userVo", userVo);
		System.out.println(userVo);
		return "mypage/adminmodifyform";
	}
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public int modify(HttpSession session, @RequestBody UserVo vo ) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		vo.setNo(authUser.getNo());
		System.out.println("수정!"+vo);
		int check =	userService.updateAdminInfo(vo);
		return check;
	}
	
/* 효빈 */
	//회원 방문 내역 조회
	/*-----히스토리----*/
	@RequestMapping(value="/adminHistory", method = RequestMethod.GET)
	public String listHistory(Long no, ListVo listVo, Model model,HttpSession session) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		System.out.println("들어온다? "+no);
		
		
		listVo.setUserNo(no);
		listVo = mypageService.listHistory(session,listVo);

		System.out.println("listVo : " + listVo);

		model.addAttribute("listVo", listVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)

		return "mypage/history";
	}

	
/* 효빈 */
	
	/*-------------*/
	
	
	/*--- 요약페이지 ---*/
	@RequestMapping("/main")
	public String main(HttpSession session, ListVo listVo, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		// System.out.println("세션 값 : " + authUser.getNo());
		UserVo userVo = userService.getUserInfo(authUser.getNo());

		List<ReserveVo> myResList = reserveService.myResList(authUser.getNo());

		listVo.setUserNo(authUser.getNo());
		listVo = mypageService.sumListHistory(session, listVo);
		System.out.println("listVo : " + listVo);

		model.addAttribute("userVo", userVo);
		model.addAttribute("myResList", myResList);
		model.addAttribute("listVo", listVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)
		return "mypage/main";
	}

	// 쿠폰뷰
	@ResponseBody
	@RequestMapping(value = "selectCoupon", method = RequestMethod.POST)
	public List<CouponVo> readCouponAjax(Long userNo) {
		List<CouponVo> couponList = userinfoService.couponList(userNo);
		System.out.println(couponList.toString());
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
	/*------------*/

	/*-----히스토리----*/
	@RequestMapping("/history")
	public String listHistory(HttpSession session, ListVo listVo, Model model) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		System.out.println("세션 값 : " + authUser.getNo());

		listVo.setUserNo(authUser.getNo());
		listVo = mypageService.listHistory(session, listVo);

		System.out.println("listVo : " + listVo);

		model.addAttribute("listVo", listVo); // jsp에서 쓸 이름, 넘겨줄 애(실제 데이터)

		return "mypage/history";
	}



	
	// 사진 출력
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void viewImg(String saveName, HttpServletResponse res) throws Exception {
		String path = "C:\\upload\\beautyline\\";
		res.setContentType("application/download");
		res.setHeader("Content-disposition", "attachment; filename=\"" + URLEncoder.encode(saveName, "UTF-8") + "\""); // orgname으로
																														// 바꿔서
																														// 보내준다.
		OutputStream resOut = res.getOutputStream();
		FileInputStream fin = new FileInputStream(path + saveName ); // savename을
																	// orgname으로
																	// 바꿔서 보내준다.
		FileCopyUtils.copy(fin, resOut);
		fin.close();
	}

	@RequestMapping("imageview")
	public String imageView() {

		return "mypage/imageview";
	}
	/*--------------*/
}