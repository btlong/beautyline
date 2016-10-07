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
import kr.ac.sungkyul.beautyline.service.PageService;
import kr.ac.sungkyul.beautyline.vo.NoticeBoardVo;
import kr.ac.sungkyul.beautyline.vo.PageVo;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService nBoardService;
	
	@Autowired
	private PageService pageService;
	/*게시판 리스트*/
	@RequestMapping("board")
	public String list(Model model,
			@RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "nowBlock", required=false) Integer nowBlock
			/*@RequestParam(value = "keyField", required=false) String keyField, 
			@RequestParam(value = "keyWord", required=false) String keyWord*/){
		List<NoticeBoardVo> boardList= nBoardService.getAll();
		System.out.println(boardList);
		PageVo page =null;
		try{
		
	
		page = pageService.pagingProc(nowPage, nowBlock, boardList.size());
		} catch(Exception err){
	            page = pageService.pagingProc(0, 0, boardList.size());
	        }
		System.out.println("???????????"+page+"jjjjjjjjjjjjjjjjj");
		model.addAttribute("boardList", boardList );
		model.addAttribute("page", page);
/*		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);*/
		return"board/noticeboard/board";
	}
	
	/*@RequestMapping(value = "list")
	public String listUser(Model model,
			@RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "nowBlock", required=false) Integer nowBlock, 
			@RequestParam(value = "keyField", required=false) String keyField, 
			@RequestParam(value = "keyWord", required=false) String keyWord){
		
		List<UserinfoVo> listUser = userinfoService.listUser(keyField, keyWord);
		System.out.println(listUser.toString());
		PageVo page = null;
        try{
            page = userinfoService.pagingProc(nowPage, nowBlock, listUser.size());
        }
        catch(Exception err){
            System.out.println("현재페이지와 현재블럭이 존재하지 않아 0을 대입했습니다.");
            System.out.println("에러내용은 다음과 같습니다." + err);
            page = userinfoService.pagingProc(0, 0, listUser.size());
        }
		model.addAttribute("listUser", listUser);
		model.addAttribute("page", page);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		return "userinfo/list";
	}	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*글쓰기 폼*/
	@RequestMapping("/writeform")
	public String writeform(){
		return"board/noticeboard/write";
	}

	/*글쓰기*/
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public void write(@RequestBody NoticeBoardVo vo) throws Exception{
		//nBoardService.write(vo, file);
		nBoardService.write(vo);
		
	}
	
	/*글 보기 폼*/
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(int no, Model model){
		NoticeBoardVo notiBdVo = nBoardService.view(no);
		model.addAttribute( "notiBdVo", notiBdVo );
		return"board/noticeboard/view";
	}
	
	/* 글 수정 폼 */
	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modify(@RequestBody NoticeBoardVo vo){
		//nBoardService.modify(vo);
	
	}

	/*글 삭제 폼*/
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete(int no){
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	 이미지 업로드 
	@ResponseBody
	@RequestMapping(value="/imaUpload", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String imaUpload(@RequestParam("file") MultipartFile file)throws Exception{
		String orgName= file.getOriginalFilename();
	//	file.get
		 String originFileName = imafile.getOriginalFilename();
		
		
		return "";
	}*/
	
	/*	@ResponseBody
	@RequestMapping(value = "/imaUpload", method = RequestMethod.POST)
	public String imaUpload(MultipartHttpServletRequest req, HttpServletResponse res){

	 Iterator<String> itr =  request.getFileNames();
	    MultipartFile mpf = request.getFile(itr.next());
	    String originFileName = mpf.getOriginalFilename();
	 return "";
	
}*/
/*	public void insertBoard(BBSVo BBSVo, MultipartFile file) throws Exception{

		
		//1. fno --> 저장할때
		
		//2. no --> 게시글 저장할때
		Long no = bbsDao.insertBoard(BBSVo);
		System.out.println(no);
		//3. orgName
		String orgName =file.getOriginalFilename();
	
		//4. fileSize
		long fileSize = file.getSize();
		
		//5. saveName
		String saveName = UUID.randomUUID().toString()+"_"+orgName;
		
		//6. path
		String path = "c:\\Users\\S401-11\\Downloads\\filestore";
	
	
		AttachFileVo attachFileVo = new AttachFileVo();
		attachFileVo.setNo(no);
		attachFileVo.setPath(path);
		attachFileVo.setFileSize(fileSize);
		attachFileVo.setOrgName(orgName);
		attachFileVo.setSaveName(saveName);

		bbsDao.insertAttachFile(attachFileVo);
		
		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);
	}*/

}
