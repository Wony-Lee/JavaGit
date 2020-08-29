<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />
<div class="text-center p-5">
	<h1 class="m-3 text-success">마이페이지</h1>
	
	<div class="card" style="width:400px;margin:auto">
    <img class="card-img-top" src="images/code.jpg" alt="MyImage" style="width:100%">
    <div class="card-body">
      <h4 class="card-title">${loginUser.name}</h4>
      <p class="card-text">
                아이디: ${loginUser.id}<br>
                연락처: ${loginUser.hp}<br>
      	주 소 : ${loginUser.addr1}<br>
      	
      </p>
      <a href="#" class="btn btn-primary stretched-link">See Profile</a>
    </div>
  </div>
	
</div>
<jsp:include page="/foot.jsp" />