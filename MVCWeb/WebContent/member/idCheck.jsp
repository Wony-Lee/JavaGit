<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="row p-3">
		<div class="col-md-10 offset-md-1">
			<form name="idf" action="idCheck.do" method="POST">
				<label>아이디 : </label> <input type="text" name="userid"
					class="form-control m-3" placeholder="User ID"
					autofocus="autofocus">
				<button class="btn btn-outline-primary m-1">확인</button>
			</form>
		</div>
	</div>

</div> <!-- container end -->

<script type="text/javascript">
	var setId = function(id) {
		//alert(id);
		//부모창(opener==>window객체)의 userid 텍스트 박스에 id 값을 넣어주자.
		opener.document.f.userid.value = id;
		opener.document.f.flag.value = true;
		//팝업창 닫기
		self.close();
	}
</script>