package kr.ac.sungkyul.beautyline.service;

import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.vo.ResultVo;
import kr.ac.sungkyul.beautyline.vo.ScoreVo;

@Service
public class CounselService {
	
	public ResultVo recommend (ScoreVo scoreVo) {
		
		String[] srcs = {"/beautyline/images/cos1.PNG", "/beautyline/images/cos2.PNG", "/beautyline/images/cos3.PNG", "/beautyline/images/cos4.PNG", "/beautyline/images/cos5.PNG"};
		String[] urls = {"http://www.dermalogica.co.kr/?r=home&m=shop&cat=2&uid=14"
				, "http://www.dermalogica.co.kr/?r=home&m=shop&cat=2&uid=9"
				, "http://www.dermalogica.co.kr/?r=home&m=shop&cat=3&uid=27"
				, "http://www.dermalogica.co.kr/?r=home&m=shop&cat=2&uid=11"
				, "http://www.dermalogica.co.kr/?r=home&m=shop&cat=3&uid=31"};
		
		
		int score1 = scoreVo.getScore1();
		int score2 = scoreVo.getScore2(); 
		int score3 = scoreVo.getScore3();
		int score4 = scoreVo.getScore4();
		int score5 = scoreVo.getScore5();
		
		int lowestScore = 100;
		int weaknessType = 0;
		int[] scores = {score1, score2, score3, score4, score5};
		for(int i=0; i < scores.length; i++) {
			if(lowestScore > scores[i]) {
				lowestScore = scores[i];
				weaknessType = i;
				System.out.println("weaknessType: " + weaknessType);
			}
		}
		
		ResultVo resultVo = new ResultVo();
		resultVo.setSrc(srcs[weaknessType]);
		resultVo.setUrl(urls[weaknessType]);
		
		return resultVo;
	}

}
