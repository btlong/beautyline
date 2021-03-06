package kr.ac.sungkyul.beautyline.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.beautyline.dao.NoticeBoardDao;
import kr.ac.sungkyul.beautyline.vo.FileNotiVo;
import kr.ac.sungkyul.beautyline.vo.NoticeBoardVo;

@Service
public class NoticeBoardService {
	
	@Autowired
	private NoticeBoardDao nBoardDao;

	
	/* 전체글 가져오기*/
	public List<NoticeBoardVo> getAll(String keyfield, String keyword, String keyWord2){
		//찾기가 있다면 if (){ 찾기  sql 문으로 ㄱㄱ 나중에 string 들어와야함
		List<NoticeBoardVo> list = nBoardDao.getAll(keyfield, keyword, keyWord2);		
		return list;	
	}
	public void write(NoticeBoardVo noticeBoardVo){
		nBoardDao.insertBoard(noticeBoardVo);
	}
	
	
	/* 글쓰기	*/
	public void write(NoticeBoardVo noticeBoardVo, MultipartFile file)throws Exception {
		Long noticeNo = nBoardDao.insertBoard(noticeBoardVo);
		
		// 2. orgName
		String orgName = file.getOriginalFilename();

		// 4. fileSize 리사이징할때
		// long fileSize = file.getSize();

		// 5. saveName
		String saveName = UUID.randomUUID().toString() + "_" + orgName;

		// 6. path
		String path = "c:\\Users\\S401-11\\Downloads\\filestore";

		
		FileNotiVo noticeFile = new FileNotiVo();

		noticeFile.setNoticeNo(noticeNo);
		noticeFile.setOrgName(orgName);
		noticeFile.setPath(path);
		noticeFile.setSaveName(saveName);
		nBoardDao.insertFileNoti(noticeFile);

		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);

		 // board no 가져오기
	}
	
	/* 공지사항 글 보기 */
	public NoticeBoardVo view( Long no ){
		return nBoardDao.viewBoard(no);
		
	}
	

	/* 공지사항 글 조회수 업뎃 */
	public void updateViewCount( Long no ){
		nBoardDao.updateViewCount(no);
	}
	
	/* 공지사항 글 삭제 */
	public int delete( Long no ){
		 return nBoardDao.delete(no);
	}
	
	/* 글보기 누를때 파일 이름가져오기	*/
	public FileNotiVo fileview(Long noticeNo){//볼때
		return nBoardDao.selectFileNotiByNo(noticeNo);
	}

/*------------------- 수정--------------------  */
	/* 글만 수정 */
	public void modifyBd(NoticeBoardVo noticeBoardVo){
		nBoardDao.modify(noticeBoardVo);
	}
	
	
	/* 글 수정과 첨부파일 추가 */
	public void modify(NoticeBoardVo noticeBoardVo, MultipartFile file)throws Exception {
		
		nBoardDao.modify(noticeBoardVo);
		Long noticeNo = noticeBoardVo.getNo();
		
		// 2. orgName
		String orgName = file.getOriginalFilename();

		// 4. fileSize 리사이징할때
		// long fileSize = file.getSize();

		// 5. saveName
		String saveName = UUID.randomUUID().toString() + "_" + orgName;

		// 6. path

		String path = "c:\\Users\\S401-11\\Downloads\\filestore";

		FileNotiVo noticeFile = new FileNotiVo();

		noticeFile.setNoticeNo(noticeNo);
		noticeFile.setOrgName(orgName);
		noticeFile.setPath(path);
		noticeFile.setSaveName(saveName);
		nBoardDao.insertFileNoti(noticeFile);

		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);

	}
	
	/* 파일 삭제 */
	public int delFile(Long fileNo){
		return nBoardDao.delFile(fileNo);
	}
	
	
	
	}






/*public List<BoardVo> getAll(String kwd) { 전체가져오기
	List<BoardVo> list = new ArrayList<BoardVo>();	
	BoardVo vo = null;
	Connection connection = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		connection = DriverManager.getConnection(url, "webdb", "webdb");
		stmt = connection.createStatement();
		 
		String sql ="select a.no, title, b.name, content, reg_date, view_count, b.no as user_no from board a, users b where a.user_no = b.no ";
		if(kwd!=null){
			sql += " and title like '%"+kwd+"%' and content like '%"+kwd+"%' ";
			
		}
			sql += " order by group_no DESC, order_no ASC ";
		
		
			rs = stmt.executeQuery(sql);
		
				
		while(rs.next()){
			Long no = rs.getLong(1);
			
			
			vo =new BoardVo();
			vo.setNo(no);
			list.add(vo);
		}

	return list;
}






public List<BoardVo> getList(Long pageNo, String kwd) {
		List<BoardVo> list = new ArrayList<BoardVo>();	
		PreparedStatement pstmt = null;
		Connection connection = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			connection = DriverManager.getConnection(url, "webdb", "webdb");
			
			//String sql ="select a.no, title, b.name, content, reg_date, view_count, b.no from board a, users b where a.user_no = b.no order by group_no DESC, order_no ASC";
			String sql = "select * from (select c.*, rownum as rn from ( select a.no, title, b.name, content, reg_date, view_count, b.no as user_no  from board a, users b where a.user_no = b.no ";
			
			
			
			if(kwd!=null){
			sql += "   and title like '%"+ kwd+ "%' and content like '%"+ kwd +"%' ";
			
			
			}
			sql += "  order by group_no DESC, order_no ASC ) c) where (?-1)*10 + 1 <= rn and rn <= ?*10";
				

			pstmt = connection.prepareStatement(sql);
		
				pstmt.setLong(1, pageNo);
				pstmt.setLong(2, pageNo);
				
			
		
			rs = pstmt.executeQuery();
					
			
			while(rs.next()){
				Long no = rs.getLong(1);
				String title = rs.getString(2);
				String name = rs.getString(3);
				String content = rs.getString(4);
				String regDate = rs.getString(5);
				Long viewNo = rs.getLong(6);
				Long userNo = rs.getLong(7);
				
				
				BoardVo vo = new BoardVo();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setName(name);
				vo.setContent(content);
				vo.setRegDate(regDate);
				vo.setViewNo(viewNo);
				vo.setUserNo(userNo);
				
				list.add(vo);
				
				
			}
	

		return list;

	}















*/

	