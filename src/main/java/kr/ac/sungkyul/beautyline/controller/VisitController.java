package kr.ac.sungkyul.beautyline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "visited", method = RequestMethod.POST)
	public String visited(VisitVo visitVo, MultipartFile file) {
		System.out.println(file.getOriginalFilename().toString());
		visitService.insert(visitVo ,file);
		return "visit/visited";
	}

	// 내역 조회
	@RequestMapping("/details")
	public String details(Model model) {
		List<VisitVo> visitList = visitService.selectList();
		model.addAttribute("visitList", visitList);

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
		/*System.out.println(couponList);*/
		retVal.put("couponList", couponList);
		return retVal;
	}

	/* 쿠폰 충전 */
	@ResponseBody
	@RequestMapping(value = "packageModal", method = RequestMethod.POST)
	public UserVo packageCharge(@RequestBody UserVo userVo) {
		System.out.println(userVo);
		UserVo authUser = visitService.searchOne(userVo);
		return authUser;
	}

	/* 쿠폰 완료 */
	@ResponseBody
	@RequestMapping(value = "packageCharge", method = RequestMethod.POST)
	public List<CouponVo> packageCharge(@RequestBody CouponVo couponVo) {
		visitService.couponCharge(couponVo);
		List<CouponVo> couponList = visitService.couponList(couponVo.getUserNo());
		return couponList ;
	}

	// 회원등록
	@RequestMapping("/registraion")
	public String registration() {
		return "registration";
	}

}
