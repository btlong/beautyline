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

import kr.ac.sungkyul.beautyline.service.NoticeBoardService;
import kr.ac.sungkyul.beautyline.vo.NoticeBoardVo;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService nBoardService;
	
	
	/*게시판 리스트*/
	@RequestMapping("/board")
	public String list(Model model ){
		List<NoticeBoardVo> boardList= nBoardService.getAll();
		model.addAttribute("boarList", boardList );
		
		return"board/board";
	}
	
	/*글쓰기 폼*/
	@RequestMapping("/writeform")
	public String writeform(){
		return"board/noticewrite2";
	}

	/*글쓰기*/
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void write(@RequestBody NoticeBoardVo vo){
		nBoardService.write(vo);
	
	}
	
	/*글 보기 폼*/
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(){
		
		return"board/noticeview";
	}

	

}
