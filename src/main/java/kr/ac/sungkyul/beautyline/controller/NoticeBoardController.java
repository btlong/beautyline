package kr.ac.sungkyul.beautyline.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	/* 이미지 업로드 */
	@ResponseBody
	@RequestMapping(value="/imaUpload", method = RequestMethod.POST)
	public String imaUpload(MultipartHttpServletRequest request){
		Iterator<String> itr = request.getFileNames();
	//	MultipartFile dwqmpf = request.getFile(itr.next());
		
		
		return "";
	}
	
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
