package kr.ac.sungkyul.beautyline.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.beautyline.dao.MypageDao;
import kr.ac.sungkyul.beautyline.vo.ListVo;
import kr.ac.sungkyul.beautyline.vo.RecommendVo;
import kr.ac.sungkyul.beautyline.vo.VisitVo;

@Service
public class MypageService {
   
   @Autowired
   private MypageDao mypageDao;
   
   public ListVo sumListHistory(HttpSession session, ListVo listVo) {
	//회원- 요약리스트 데이터
	      List<VisitVo> sumVisitList = mypageDao.sumListHistory(listVo);
	      listVo.setVisitList(sumVisitList);
		return listVo;
   }

   
   //관리자- 요약리스트 데이터
	public ListVo sumListHistory(Long no, ListVo listVo) {
		List<VisitVo> sumVisitList = mypageDao.sumListHistory(listVo);
		listVo.setVisitList(sumVisitList);
		return listVo;
	}
   
      
   public ListVo listHistory(HttpSession session, ListVo listVo) {
      final int PAGE_RECORDS = 10;
      final int PAGE_SETS = 5;
      
      // 페이징 변수
      int totalRecords = 0;
      int currentPage = 0;
      int number = 0;
      int totalPages = 0;
      int totalPageSets = 0;
      int currentPageSet = 0;
      
      // 현재 페이지번호 지정
      if (listVo.getCurrentPage() == 0) {
         currentPage = 1;
         currentPageSet = 1;
      } else {
         currentPage = listVo.getCurrentPage();
         currentPageSet = listVo.getCurrentPageSet();
      }
      
      // 총 레코드 수 가져오기
      totalRecords = mypageDao.countHistory(listVo.getUserNo());
      System.out.println("totalRecord : " + totalRecords);
      
      // 전체 페이지 수, 전체 페이지집합의 수, 현재 페이지집합 번호 추출
      totalPages = (int) Math.ceil((double) totalRecords / PAGE_RECORDS);
      totalPageSets = (int) Math.ceil((double) totalPages / PAGE_SETS);
      currentPageSet = (int) Math.ceil((double) currentPage / PAGE_SETS);
      
      // 이전 페이지 집합
      int beforePageSet = 0;
      if (currentPageSet > 1) {
         beforePageSet = PAGE_SETS * (currentPageSet - 1);
      }
      
      // 이전 페이지
      int beforePage = 0;
      if (currentPage > 1) {
         beforePage = currentPage - 1;
      }

      // 현재 페이지 집합에서 출력할 첫 페이지 번호와 끝 페이지번호 추출
      int firstPage = PAGE_SETS * (currentPageSet - 1);
      int lastPage = PAGE_SETS * currentPageSet;
      
      System.out.println("firstPage : " + firstPage);
      System.out.println("lastPage : " + lastPage);

      if (currentPageSet == totalPageSets) {
         lastPage = totalPages;
      }

      // 다음 페이지
      int nextPage = 0;
      if (totalPages > currentPage) {
         nextPage = currentPage + 1;
      } 

      // 다음 페이지 집합
      int nextPageSet = 0;
      if (totalPageSets > currentPageSet) {
         nextPageSet = PAGE_SETS * currentPageSet + 1;
      } 
      
      // 페이지별 가상 시작번호 생성
      number = totalRecords - (currentPage-1) * PAGE_RECORDS;

      listVo.setCurrentPage(currentPage);
      listVo.setCurrentPageSet(currentPageSet);
      listVo.setPageRecords(PAGE_RECORDS);
      
      // 리스트 데이터
      List<VisitVo> visitList = mypageDao.listHistory(listVo);
      listVo.setVisitList(visitList);
      
      // 맞춤 서비스 데이터
      RecommendVo recommendVo = new RecommendVo();
      if( session.getAttribute("recommend") == null) {
         String[] srcs = {"/beautyline/images/cos1.PNG"
               , "/beautyline/images/cos2.PNG"
               , "/beautyline/images/cos3.PNG"
               , "/beautyline/images/cos4.PNG"
               , "/beautyline/images/cos5.PNG"};
         String[] urls = {"http://www.dermalogica.co.kr/?r=home&m=shop&cat=2&uid=14"
               , "http://www.dermalogica.co.kr/?r=home&m=shop&cat=2&uid=9"
               , "http://www.dermalogica.co.kr/?r=home&m=shop&cat=3&uid=27"
               , "http://www.dermalogica.co.kr/?r=home&m=shop&cat=2&uid=11"
               , "http://www.dermalogica.co.kr/?r=home&m=shop&cat=3&uid=31"};
         
         if(visitList.isEmpty()) {
        	 return null;
         }
         
         VisitVo visitVo = visitList.get(0);
         Long whiteningScore = visitVo.getWhiteningScore();
         Long whinkleScore = visitVo.getWhinkleScore();
         Long elasticScore = visitVo.getElasticScore();
         Long moistureScore = visitVo.getMoistureScore();
         Long acneScore = visitVo.getAcneScore();
         Long lowestScore = 100L;
         int weaknessType = 0;
         Long[] scores = {whiteningScore, whinkleScore, elasticScore, moistureScore, acneScore};
         for(int i=0; i < scores.length; i++) {
            if(lowestScore > scores[i]) {
               lowestScore = scores[i];
               weaknessType = i;
            }
         }
         recommendVo.setSrc(srcs[weaknessType]);
         recommendVo.setUrl(urls[weaknessType]);
         session.setAttribute("recommend", recommendVo);
      }
      
      // 페이징 데이터
      
      listVo.setCurrentPage(currentPage);
      listVo.setCurrentPageSet(currentPageSet);
      listVo.setBeforePage(beforePage);
      listVo.setBeforePageSet(beforePageSet);
      listVo.setFirstPage(firstPage);
      listVo.setLastPage(lastPage);
      listVo.setNextPage(nextPage);
      listVo.setNextPageSet(nextPageSet);
      listVo.setNumber(number);
      
      return listVo;
   }

}