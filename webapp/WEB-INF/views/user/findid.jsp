<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- id찾기 Modal -->
  <div class="modal fade" id="myModal3" role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
     
      <div class="modal-content">
      <div class="form-horizontal" >
    
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">아이디 찾기</h4>
        </div>
        <div class="modal-body"><!-- 이름과 이메일로 찾기 -->
	  <!-- 이름 -->
       <div class="form-group">
          <label class="col-lg-4 control-label" for="idFindName">이름</label>
        <div class="col-lg-8">
          <input class="form-control"  name="idFindName" id="idFindName" type="text" placeholder="이름" >
        </div>
        </div>
          
          <div class="form-group">
          <label class="col-lg-4 control-label" for="idFindEmail">이메일</label>
        <div class="col-lg-8">
          <input class="form-control" name="idFindEmail" id="idFindEmail" type="text" placeholder="이메일">
        </div>
        </div>
        </div>
        <div class="modal-footer">
        <div id="fintdt" class="col-lg-12 text-center">
         <button class="btn btn-danger"  id="idFindClick">  찾기  </button>
               </div>
       <!--  <button type="button" class="btn btn-default" data-dismiss="modal">찾기</button> -->  
        </div>
     </div>
      </div>
       
    </div>
  </div>