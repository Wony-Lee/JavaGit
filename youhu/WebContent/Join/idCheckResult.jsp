<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<div class="container">
	<!-- idCheckResult.jsp : 아이디 사용 여부 결과를 알려주는 페이지 -->
	
<c:if test="${isUse}">	
	<div class="row">
		<div class="col-md-10 offset-md-1">
			<h3>
				 <span style="font-weight: bold; color: red"> ${id}</span>은
				사용 가능 한 아이디 입니다.
			</h3>
			<button class="btn btn-warning" onclick="setId('${id}')">닫
				기</button>
		</div>
	</div>
</c:if>
<c:if test="${!isUse}">	
	<div class="row">
		<div class="col-md-10 offset-md-1">
			<h3>
				<span style="font-weight: bold; color: red">${id}</span>는
				이미 사용 중입니다.
			</h3>
		</div>
	</div>
	<div class="row p-3">
		<div class="col-md-10 offset-md-1">
			<form name="idf" action="idCheck.do" method="POST">
				<label>아이디:</label> <input type="text" name="id"
					class="form-control m-1" placeholder="User ID"
					autofocus="autofocus">
				<button class="btn btn-outline-primary m-1">확인</button>
			</form>
		</div>
	</div>
</c:if>

</div>
<script type="text/javascript">
	var setId = function(id) {
		//alert(id);
		//부모창(opener==>window객체)의 userid텍스트 박스에 id값을 넣어주자.
		opener.document.a.id.value = id;
		opener.document.a.ch.value = true;
		//팝업창 닫기
		self.close();
	}
</script>





