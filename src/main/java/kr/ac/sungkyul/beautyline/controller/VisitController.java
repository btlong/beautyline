package kr.ac.sungkyul.beautyline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.beautyline.service.VisitService;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Controller
@RequestMapping("/visit")
public class VisitController {

	@Autowired
	VisitService visitService;

	// 처음 화면
	@RequestMapping("/visitform")
	public String visitForm() {

		return "visit/visitform";
	}

	// 시술 후 등록
	@RequestMapping(value = "/visited", method = RequestMethod.POST)
	public String visited(@ModelAttribute VisitVo visitVo, MultipartFile file) {
		visitService.update(visitVo, file);
		return "redirect:/visit/visitform";
	}

	// 내역 조회
	@RequestMapping("/details")
	public String details(Model model) {
		/*
		 * List<VisitHistoryVo> visitList = visitService.selectList();
		 * model.addAttribute("visitList",visitList);
		 */
		return "visit/details";
	}

	// 검색 회원 선택 시작
	@ResponseBody
	@RequestMapping(value = "visitorsearchform", method = RequestMethod.POST)
	public List<UserVo> visitorSearchForm(@RequestBody UserVo userVo) {
		List<UserVo> visitorList = visitService.searchList(userVo);
		return visitorList;
	}

	// 검색 회원선택 완료
	@ResponseBody
	@RequestMapping(value = "searchSucess", method = RequestMethod.POST)
	public Map<String, Object> searchSucess(@RequestBody UserVo userVo) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		UserVo authUser = visitService.searchOne(userVo);
		retVal.put("authUser", authUser);
		List<CouponVo> couponList = visitService.couponList(authUser.getNo());
		System.out.println("리스트 확인 :"+couponList.toString());
		retVal.put("couponList", couponList);
		return retVal;
	}

	// 쿠폰 충전
	@RequestMapping(value = "/packagecharge", method = RequestMethod.GET)
	public String packageCharge(VisitVo visitVo) {
		return "visit/packagecharge";
	}

	// 회원등록
	@RequestMapping("/registraion")
	public String registration() {
		return "registration";
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "careSelected", method = RequestMethod.POST)
	 * public List<CouponVo> careSelected(@RequestBody CouponVo couponVo) { //
	 * userNo 1번씨가 -->> 번호가1번 10회 , 2번 5회 3번 4회가 존재. List<CouponVo> couponList =
	 * visitService.couponList(couponVo); System.out.println(couponList.size());
	 * 
	 * return couponList; }
	 */
}
