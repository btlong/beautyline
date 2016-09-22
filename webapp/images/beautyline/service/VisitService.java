package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.beautyline.dao.VisitDao;
import kr.ac.sungkyul.beautyline.exception.VisitUpdateException;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Service
public class VisitService {
	
	@Autowired
	private VisitDao visitDao;

	/* visited - 방문 이후 등록 */
	public void update(VisitVo visitVo , MultipartFile file ) throws VisitUpdateException {
		
		visitDao.update(visitVo);
		// 정보추가
	}

	public List<UserVo> search(UserVo userVo) {
		return visitDao.selectByName(userVo);
	}

	public List<VisitVo> selectList() {
		return visitDao.selectList();
	}

	// visitForm에서 name을 검색 --> Query를 통해 --> VisitVo의 정보를 불러옴 ( name은 UserVo에
	// 존재 )
	/*public VisitVo search(String name) {
		 회원의 대한 정보 
		 이름 검색 
		VisitVo vo = (VisitVo) visitDao.getList(name);

		return vo;
	}
*/
}
