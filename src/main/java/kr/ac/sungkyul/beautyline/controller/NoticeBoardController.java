package kr.ac.sungkyul.beautyline.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.beautyline.service.NoticeBoardService;
import kr.ac.sungkyul.beautyline.service.PageService;
import kr.ac.sungkyul.beautyline.vo.FileNotiVo;
import kr.ac.sungkyul.beautyline.vo.NoticeBoardVo;
import kr.ac.sungkyul.beautyline.vo.PageVo;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService nBoardService;

	@Autowired
	private PageService pageService;
	
	//소연시작
	/* 게시판 리스트 */
	   @RequestMapping("board")
	   public String list(Model model, @RequestParam(value = "nowPage", required = false) Integer nowPage,
	         @RequestParam(value = "nowBlock", required = false) Integer nowBlock
	   /*
	    * @RequestParam(value = "keyField", required=false) String keyField,
	    * 
	    * @RequestParam(value = "keyWord", required=false) String keyWord
	    */) {
	      List<NoticeBoardVo> boardList = nBoardService.getAll();
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
	      return "board/noticeboard/board";
	   }
	
	


	/* 글쓰기 폼 */
	@RequestMapping("/writeform")
	public String writeform() {
		return "board/noticeboard/write";
	}

	/* 글쓰기 */
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST,  produces = "text/html; charset=UTF-8")
	/*public Object write(MultipartHttpServletRequest request) throws Exception {*/
	public void write(NoticeBoardVo noticeBoardVo) throws Exception {
		nBoardService.write(noticeBoardVo);
	

	}
	
	/* 글쓰기 +파일 */
	@ResponseBody
	@RequestMapping(value = "/writefile", method = RequestMethod.POST,  produces = "text/html; charset=UTF-8")
	/*public Object write(MultipartHttpServletRequest request) throws Exception {*/
	public void write(NoticeBoardVo noticeBoardVo,@RequestParam("file") MultipartFile file) throws Exception {
		//if(itr.hasNext()) {

		nBoardService.write(noticeBoardVo, file);

		// }
	   
	  /*  return true;
        } else {
            return false;
        }*/
	 

	}
	
	/* 글 보기 폼 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Long no, Model model) {
		NoticeBoardVo notiBdVo = nBoardService.view(no);
		FileNotiVo file = nBoardService.fileview(no);
		model.addAttribute("file",file);
		model.addAttribute("notiBdVo", notiBdVo);
		return "board/noticeboard/view";
	}

	
	/* 첨부파일 다운로드 */
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void downloadFile(Long no, HttpServletResponse res) throws Exception {
		FileNotiVo file = nBoardService.fileview(no);
		String saveName = file.getSaveName();
		String orgName = file.getOrgName();
		res.setContentType("application/download");
		res.setHeader("Content-disposition", "attachment; filename=\"" + URLEncoder.encode(orgName,"UTF-8") +"\""); // orgname으로 바꿔서 보내준다.
		OutputStream resOut = res.getOutputStream();
	
		FileInputStream fin = new FileInputStream("c:\\Users\\S401-11\\Downloads\\filestore\\"+saveName); // savename을  orgname으로 바꿔서 보내준다.
		FileCopyUtils.copy(fin, resOut);
		fin.close();
	    
	 }
 //소연이
   
}
