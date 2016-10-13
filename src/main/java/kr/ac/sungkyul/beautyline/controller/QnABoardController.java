package kr.ac.sungkyul.beautyline.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.beautyline.service.PageService;
import kr.ac.sungkyul.beautyline.service.QnABoardService;
import kr.ac.sungkyul.beautyline.vo.PageVo;
import kr.ac.sungkyul.beautyline.vo.QnABoardVo;

@Controller
@RequestMapping("/qnaboard")
public class QnABoardController {

	@Autowired
	private QnABoardService qBoardService;

	@Autowired
	private PageService pageService;
	
	/* 게시판 리스트 */
	   @RequestMapping("board")
	   public String list(Model model, 
			 @RequestParam(value = "nowPage", required = false) Integer nowPage,
	         @RequestParam(value = "nowBlock", required = false) Integer nowBlock
	   /*
	    * @RequestParam(value = "keyField", required=false) String keyField,
	    * 
	    * @RequestParam(value = "keyWord", required=false) String keyWord
	    */) {
	      List<QnABoardVo> boardList = qBoardService.getAll();
	      PageVo page = null;
	      try {
	         page = pageService.pagingProc(nowPage, nowBlock, boardList.size());
	      } catch (Exception err) {
	         page = pageService.pagingProc(0, 0, boardList.size());
	      }
	      model.addAttribute("boardList", boardList);
	      model.addAttribute("page", page);
	      /*
	       * model.addAttribute("keyField", keyField);
	       * model.addAttribute("keyWord", keyWord);
	       */
	      return "board/qnaboard/board";
	   }
	
	
	   /* 글 보기 폼 */
	   @RequestMapping(value = "/view", method = RequestMethod.GET)
	   public String view(Long no, Model model) {
		   /* 조회수 업뎃 */
		  qBoardService.updateViewCount(no);
		  
		  QnABoardVo qnabdvo = qBoardService.view(no);
	      
	      model.addAttribute("qnabdvo", qnabdvo);
	      return "board/qnaboard/view";
	   }


	   
	/* 글쓰기 폼 */
	@RequestMapping("/writeform")
	public String writeform() {
		return "board/qnaboard/write";
	}

	/* 글쓰기 */
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST,  produces = "text/html; charset=UTF-8")
	public void write(QnABoardVo qnabdvo) throws Exception {
		qBoardService.write(qnabdvo);
	}
	
	
	/* 답글쓰기폼 */	
	@RequestMapping(value ="/replywriteform", method = RequestMethod.GET)
	public String replywriteform( Long no,Model model ) {
	
	 QnABoardVo qnabdvo = qBoardService.view(no);
	 
	  model.addAttribute("qnabdvo", qnabdvo);
	  
	  return "board/qnaboard/writereply";
	}
	
	/* 답글 쓰기 */
	@ResponseBody
	@RequestMapping(value = "/replywrite", method = RequestMethod.POST,  produces = "text/html; charset=UTF-8")
	public void replywrite(QnABoardVo qnabdvo) throws Exception {
		qBoardService.replywrite(qnabdvo);
	}
	
	
/*------------------- 수정--------------------  */
	

	/* 글만 수정  */
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modify(QnABoardVo qnabdvo,Long fNo) throws Exception{
		
		qBoardService.modify(qnabdvo); //글업데이트
		
		//nBoardService.modify(noticeBoardVo, file);
		
	}

/*--------------------------------------------  */
	
	
	

	
   /*글 삭제 폼*/
	@RequestMapping(value = "/deleteform", method = RequestMethod.GET)
	public String deleteform(Long no, Model model){
		model.addAttribute( "no", no );
		return "board/qnaboard/deleteform";
	}
	
	/*글 삭제 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Long no){
		int cnt = qBoardService.delete(no);
		if( cnt >0 ){
			return "redirect:board";
		}else{
			return "board/qnaboard/error";
		}
		
	}
	
   
  
   

	    }
   

