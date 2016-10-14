package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.PageService;
import kr.ac.sungkyul.beautyline.service.ReviewBoardService;
import kr.ac.sungkyul.beautyline.vo.PageVo;
import kr.ac.sungkyul.beautyline.vo.ReplyVo;
import kr.ac.sungkyul.beautyline.vo.ReviewBoardVo;

@Controller
@RequestMapping("/reviewboard")
public class ReviewBoardController {

	@Autowired
	private ReviewBoardService rBoardService;

	@Autowired
	private PageService pageService;

	
	/* 게시판 리스트 */
	@RequestMapping("board")
	public String list(Model model, @RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "nowBlock", required = false) Integer nowBlock) {
		List<ReviewBoardVo> boardList = rBoardService.getAll();
		PageVo page = null;
		try {
			page = pageService.pagingProc(nowPage, nowBlock, boardList.size());
		} catch (Exception err) {
			page = pageService.pagingProc(0, 0, boardList.size());
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", page);
		return "board/reviewboard/board";
	}

	/* 글 보기 폼 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Long no, Model model) {
		rBoardService.updateViewCount(no);// 조회수 업뎃
		ReviewBoardVo reviewBoardVo = rBoardService.view(no);
	
		model.addAttribute("reviewBoardVo", reviewBoardVo);
		return "board/reviewboard/view";
	}

	/* 글쓰기 폼 */
	@RequestMapping("/writeform")
	public String writeform() {
		return "board/reviewboard/write";
	}

	/* 글쓰기 */
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public int write(@RequestBody ReviewBoardVo reviewBoardVo) throws Exception {
		int check = rBoardService.write(reviewBoardVo);
		return check;
	}


	/* 글만 수정  */
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public int modify(@RequestBody ReviewBoardVo reviewBoardVo) throws Exception{
		int check =	rBoardService.modify(reviewBoardVo); //글업데이트
		return check;
	}


	/* 글 수정폼 */
	@RequestMapping(value = "/modifyform", method = RequestMethod.GET)
	public String modyfyform(Long no, Model model) {
		ReviewBoardVo reviewBoardVo = rBoardService.view(no);
		model.addAttribute("reviewBoardVo", reviewBoardVo);
		return "board/reviewboard/modifyform";

	}

	/* 글 삭제 폼 */
	@RequestMapping(value = "/deleteform", method = RequestMethod.GET)
	public String deleteform(Long no, Model model) {
		model.addAttribute("no", no);
		return "board/reviewboard/deleteform";
	}

	/* 글 삭제 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Long no) {
		int cnt = rBoardService.delete(no);
		if (cnt > 0) {
			return "redirect:board";
		} else {
			return "board/reviewboard/error";
		}
	}
	
	
	
	/*-------------------------------------------- */
	/* 댓글 리스트	*/
	@ResponseBody
	@RequestMapping(value = "/replylist", method = RequestMethod.POST)
	public List<ReplyVo> replylist(@RequestParam("reviewNo") Long reviewNo, Model model) {
		List<ReplyVo> list = rBoardService.replylist(reviewNo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public int reply(@RequestBody ReplyVo replyVo) {
		int check = rBoardService.reply(replyVo);
		return check;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/deletereply", method = RequestMethod.POST)
	public int deletereply(@RequestParam Long replyNo) {
		int check = rBoardService.deletereply(replyNo);
		return check;
	}
	
	/*-------------------------------------------- */
	
	
	
}
