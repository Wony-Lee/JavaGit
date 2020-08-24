<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- signup.jsp -->
<jsp:include page="/top.jsp" />

<script type="text/javascript">
	/*아이디 중복체크 팝업창 열기 함수*/
	var win = null;
	function openWin()
	{
		f.flag.value="false";
		win=window.open("idCheck.do","idCheck","width=400, height=400, left=100, top=100");
	}
	var addrwin = null;
	function openAddr()
	{
		
		addrwin = window.open("addrCheck.jsp","addrCheck","width=400, height=400, left=100, top=100");
	}

	function check() {
		if (!f.name.value) {
			alert('이름을 입력하세요.');
			f.name.focus();
			return;
		}
		//아이디, 비밀번호, hp1,hp2,hp3 입력값 체크
		if (!f.id.value) {
			alert('아이디를 입력하세요.');
			f.id.focus();
			return;
		}
		if (!f.pwd.value) {
			alert('비밀번호를 입력하세요.');
			f.pwd.focus();
			return;
		}
		if (f.pwd.value != f.pwd2.value) {
			alert('번호 다름');
			f.pwd.focus();
			return;
		}
		if (!f.hp1.value || !f.hp2.value || !f.hp3.value) {
			alert('연락처를 확인해주세요.');
			f.hp1.focus();
			return;
		}
/*		if(f.flag.value=="false")
		{
			alert('아이디 중복 체크를 해야 해요');
			return;
		}*/
		f.submit();

	}
</script>


<h1 class="text-primary m-5">SignUp</h1>
<form name="f" action="signupEnd.do" method="post">

	<div class="row m-3">
		<div class="col-md-3">이름</div>
		<div class="col-md-6">
			<input type="text" name="name" id="name" placeholder="Name"
				class="form-control">
		</div>
	</div>

	<div class="row m-3">
		<div class="col-md-3">아이디</div>
		<div class="col-md-6">
			<input type="text" name="userid" id="id" placeholder="User ID" 
				class="form-control">
				<!--  hidden data -------------- -->
				<input type="hidden" name="flag" value="false">
				<!--  -------------------------- -->
		</div>
		<div class="col-md-3">
			<button type="button" onclick="openWin()" class="btn btn-success">아이디 중복체크</button>
		</div>
	</div>

	<div class="row m-3">
		<div class="col-md-3">비밀번호</div>
		<div class="col-md-6">
			<input type="password" name="pwd" id="pwd" placeholder="Password"
				class="form-control">
		</div>
	</div>

	<div class="row m-3">
		<div class="col-md-3">비밀번호 확인</div>
		<div class="col-md-6">
			<input type="password" name="pwd2" id="pwd2"
				placeholder="Re Password" class="form-control">
		</div>
	</div>

	<div class="row m-3">
		<div class="col-md-3">연락처</div>
		<div class="col-md-2">
			<input type="text" name="hp1" id="hp1" placeholder="HP1"
				maxlength="3" class="form-control">
		</div>

		<div class="col-md-2">
			<input type="text" name="hp2" id="hp2" placeholder="HP2"
				maxlength="4" class="form-control">
		</div>

		<div class="col-md-2">
			<input type="text" name="hp3" id="hp3" placeholder="HP3"
				maxlength="4" class="form-control">
		</div>
	</div>

	<div class="row m-3">
		<div class="col-md-3">우편번호</div>
		<div class="col-md-6">
			<input type="text" name="post" id="post" placeholder="Post"
				maxlength="5" class="form-control">
		</div>
		<div class="col-md-3">
			<button type="button" onclick="openAddr()" class="btn btn-success">우편번호 찾기</button>
		</div>
	</div>

	<div class="row m-3">
		<div class="col-md-3">주소</div>
		<div class="col-md-6">
			<input type="text" name="juso" id="juso" placeholder="Address"
				class="form-control">
			<p></p>
			<input type="text" name="addr1" id="addr1" placeholder="상세주소"
				class="form-control">
		</div>
	</div>

	<div class="row m-3">
		<div class="col-md-12 text-center">
			<button type="button" class="btn btn-primary" onclick="check()">회원
				가입</button>
			<button type="reset" class="btn btn-danger">다시쓰기</button>
		</div>
	</div>


</form>


<jsp:include page="/foot.jsp" />