package kr.ac.sungkyul.beautyline.vo;

import java.util.List;

public class ListVo {
   
   private int totalRecords;
   private Long userNo;
   private int currentPage;
   private int currentPageSet;
   private int beforePage;
   private int beforePageSet;
   private int firstPage;
   private int lastPage;
   private int nextPage;
   private int nextPageSet;
   private int number;
   private int pageRecords;
   private List<VisitVo> visitList;
   
   
   public int getPageRecords() {
      return pageRecords;
   }
   public void setPageRecords(int pageRecords) {
      this.pageRecords = pageRecords;
   }
   public int getTotalRecords() {
      return totalRecords;
   }
   public void setTotalRecords(int totalRecords) {
      this.totalRecords = totalRecords;
   }
   public Long getUserNo() {
      return userNo;
   }
   public void setUserNo(Long userNo) {
      this.userNo = userNo;
   }
   public int getCurrentPage() {
      return currentPage;
   }
   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }
   public int getCurrentPageSet() {
      return currentPageSet;
   }
   public void setCurrentPageSet(int currentPageSet) {
      this.currentPageSet = currentPageSet;
   }
   public int getBeforePage() {
      return beforePage;
   }
   public void setBeforePage(int beforePage) {
      this.beforePage = beforePage;
   }
   public int getBeforePageSet() {
      return beforePageSet;
   }
   public void setBeforePageSet(int beforePageSet) {
      this.beforePageSet = beforePageSet;
   }
   public int getFirstPage() {
      return firstPage;
   }
   public void setFirstPage(int firstPage) {
      this.firstPage = firstPage;
   }
   public int getLastPage() {
      return lastPage;
   }
   public void setLastPage(int lastPage) {
      this.lastPage = lastPage;
   }
   public int getNextPage() {
      return nextPage;
   }
   public void setNextPage(int nextPage) {
      this.nextPage = nextPage;
   }
   public int getNextPageSet() {
      return nextPageSet;
   }
   public void setNextPageSet(int nextPageSet) {
      this.nextPageSet = nextPageSet;
   }
   public int getNumber() {
      return number;
   }
   public void setNumber(int number) {
      this.number = number;
   }
   public List<VisitVo> getVisitList() {
      return visitList;
   }
   public void setVisitList(List<VisitVo> visitList) {
      this.visitList = visitList;
   }
   @Override
   public String toString() {
      return "ListVo [totalRecords=" + totalRecords + ", userNo=" + userNo + ", currentPage=" + currentPage
            + ", currentPageSet=" + currentPageSet + ", beforePage=" + beforePage + ", beforePageSet="
            + beforePageSet + ", firstPage=" + firstPage + ", lastPage=" + lastPage + ", nextPage=" + nextPage
            + ", nextPageSet=" + nextPageSet + ", number=" + number + ", pageRecords=" + pageRecords
            + ", visitList=" + visitList + "]";
   }
   
   
   
   

}