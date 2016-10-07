package kr.ac.sungkyul.beautyline.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;


import kr.ac.sungkyul.beautyline.dao.VisitDao;
import kr.ac.sungkyul.beautyline.exception.VisitUpdateException;
import kr.ac.sungkyul.beautyline.vo.CouponVo;
import kr.ac.sungkyul.beautyline.vo.FileVisitVo;
import kr.ac.sungkyul.beautyline.vo.UserVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Service
public class VisitService {

	@Autowired
	private VisitDao visitDao;

	/* visited - insert */
	public void insert(VisitVo visitVo, MultipartFile file) throws Exception {

		/* orgName , path, saveName */
		String orgName = file.getOriginalFilename();
		String path = "c:\\upload\\beautyline";
		String saveName = UUID.randomUUID().toString() + "_" + orgName;

		// 6.path

		FileVisitVo fileVisitVo = new FileVisitVo();

		fileVisitVo.setOrgName(orgName);
		fileVisitVo.setPath(path);
		fileVisitVo.setSaveName(saveName);

		long imageNo = visitDao.fileInsert(fileVisitVo);

		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);

		visitVo.setImageNo(imageNo);

		visitVo.setAverageScore((visitVo.getWhiteningScore() + // 미백
				visitVo.getElasticScore() + // 피부탄력
				visitVo.getMoistureScore() + // 수분
				visitVo.getAcneScore() + // 여드름
				visitVo.getWhinkleScore() // 주름
		) / 5);
		
		visitDao.insert(visitVo);
		System.out.println();
		/* payNo == 2 (쿠폰 ) */
		if (visitVo.getPayNo() == 2) {
			visitDao.updateCoupon(visitVo); // userNo와 programNo가 필요.
		}
		if (visitVo.getPrice() == null) {
			visitVo.setPrice(0L); // defined
		}

		visitDao.SalesInsert(visitVo);
	}

	public void insert(VisitVo visitVo) {
		visitDao.insert(visitVo);
	}

	/* visited - update */
	public void update(VisitVo visitVo, MultipartFile file) throws VisitUpdateException {
		visitDao.update(visitVo);
		// 정보추가
	}

	public List<UserVo> searchList(UserVo userVo) {
		return visitDao.selectByName(userVo);
	}

	public UserVo searchOne(UserVo userVo) {
		return visitDao.selectOne(userVo);
	}

	public List<CouponVo> couponList(Long no) {
		return visitDao.selectList(no);
	}

	public List<VisitVo> selectList() {
		return visitDao.selectList();
	}

	public void couponCharge(CouponVo couponVo) {

		int success = visitDao.couponInsert(couponVo);

		if (success == 1) {
			visitDao.SalesInsert(couponVo);
		}
	}

	// visitForm에서 name을 검색 --> Query를 통해 --> VisitVo의 정보를 불러옴 ( name은 UserVo에
	// 존재 )
	/*
	 * public VisitVo search(String name) { 회원의 대한 정보 이름 검색 VisitVo vo =
	 * (VisitVo) visitDao.getList(name);
	 * 
	 * return vo; }
	 */
}
