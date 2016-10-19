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
import net.coobird.thumbnailator.Thumbnails;

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

		/* 객체 setting */
		FileVisitVo fileVisitVo = new FileVisitVo();
		fileVisitVo.setOrgName(orgName);
		fileVisitVo.setPath(path);
		fileVisitVo.setSaveName(saveName);

		/* 이미지 insert */
		long imageNo = visitDao.fileInsert(fileVisitVo);
		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);

		File thumbnail = new File(path, "thumb_" + saveName);

		if (target.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(target).forceSize(152, 195).toFile(thumbnail);

		}
		visitVo.setImageNo(imageNo);
		visitVo.setAverageScore((visitVo.getWhiteningScore() + // 미백
				visitVo.getElasticScore() + // 피부탄력
				visitVo.getMoistureScore() + // 수분
				visitVo.getAcneScore() + // 여드름
				visitVo.getWhinkleScore() // 주름
		) / 5);

		/* 데이터 insert */
		visitDao.insert(visitVo);

		/* payNo == 2 (쿠폰 ) */
		if (visitVo.getPayNo() == 2) {

			/* 쿠폰 update */
			visitDao.updateCouponMinus(visitVo); // userNo와 programNo가 필요.
		}
		if (visitVo.getPrice() == null) {
			visitVo.setPrice(0L); // defined
		}

		/* 시술 내역 insert */
		visitDao.SalesInsert(visitVo);
	}

	/*
	 * public boolean scale(BufferedImage srcImage, String destPath, String
	 * imageFormat, int destWidth, int destHeight) { boolean result = true;
	 * 
	 * try { ResampleOp resampleOp = new ResampleOp(destWidth, destHeight);
	 * resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
	 * 
	 * BufferedImage rescaledImage = resampleOp.filter(srcImage, null); File
	 * destFile = new File(destPath); ImageIO.write(rescaledImage, imageFormat,
	 * destFile); } catch (Exception e) { System.out.println(e.getMessage());
	 * result = false; } return result; }
	 */
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
		UserVo authVo = visitDao.selectOne(userVo);
		authVo.setAddress("[" + authVo.getZipCode() + "] " + authVo.getAddress1() + "   " + authVo.getAddress2());
		return authVo;
	}

	public List<CouponVo> couponList(Long no) {
		return visitDao.selectList(no);
	}

	public List<VisitVo> selectList() {
		return visitDao.selectList();
	}

	public void couponCharge(CouponVo couponVo) {
		long success = 0;
		/* 있는지 없는지 select */
		Long count = visitDao.couponSelect(couponVo);
		/* 있으면 update */
		System.out.println("count를 찍어봅시다." + count);
		/* 없으면 insert */

		if (count == null || count == 0) {
			success = visitDao.couponInsert(couponVo);
		} else {
			couponVo.setCount(couponVo.getCount() + count);
			success = visitDao.updateCouponCharge(couponVo);
		}

		if (success == 1) {
			visitDao.SalesInsert(couponVo);
		} else {
			System.out.println("씰패");
		}
	}

	public void couponRefund(VisitVo visitVo) {

		visitDao.updateRefundCoupon(visitVo);
	}

	public void insertRefundSales(Long no) {
		visitDao.insertRefundSales(no);
	}

}
