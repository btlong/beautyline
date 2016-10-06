package kr.ac.sungkyul.beautyline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		return"board/noticeboard/board";
	}
	
	/*글쓰기 폼*/
	@RequestMapping("/writeform")
	public String writeform(){
		return"board/noticeboard/write";
	}

	/*글쓰기*/
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void write(@RequestBody NoticeBoardVo vo){
		nBoardService.write(vo);
	
	}
	
	/*글 보기 폼*/
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(int no, Model model){
		//글 정보 받아오기
		NoticeBoardVo notiBdVo = nBoardService.view(no);
		
		//조회수 올리기
		nBoardService.updateViewCount(no);		
		
		model.addAttribute( "notiBdVo", notiBdVo );
		return "board/noticeboard/view";
	}
	
	/* 글 수정 폼 */
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modify(@RequestBody NoticeBoardVo vo){
		//nBoardService.modify(vo);
	
	}

	/*글 삭제 확인 폼*/
	@RequestMapping(value = "/deleteform", method = RequestMethod.GET)
	public String deleteform(int no, Model model){
		model.addAttribute( "no", no );
		return "board/noticeboard/deleteform";
	}
	
	/* 글 삭제 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int no){
		int count = nBoardService.delete(no);
		
		if( count > 0 ){
			return "redirect:board";
		}else{
			return "board/noticeboard/error";
		}
	}

}
