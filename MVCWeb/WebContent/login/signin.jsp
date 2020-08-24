<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- signin.jsp -->
<jsp:include page="/top.jsp" />
<h1 class="text-primary">SignIn</h1> 
<script>
	$(function() {
		// 로그인 버튼을 클릭하면 유효성 체크하기 // userid, pwd 입력값 체크
		$('#btnlogin').click(function(){
		
			if(!$('#userid').val()){
				alert('아이디를 입력하세요.');
				$('#userid').focus();
				return;
			}
			if(!$('#pwd').val()){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				return;
			}
		// 입력값이 올바르면 submit() 되도록 처리하세요.
			$('#loginF').submit();			
		})
	});
</script>
<%
	// 저장된 아이디 쿠키를 꺼내서 아이디 입력폼에 해당 값을 출력하자
	Cookie []cks=request.getCookies();
	String saveId="";
	boolean flag = false;
	if(cks!=null)
	{
		for(Cookie ck:cks)
		{
			String key=ck.getName();
			if(key.equals("saveId"))
			{
				saveId = ck.getValue();
				flag=true;
				break;
			}
		}
	}
%>
<form name="loginF" id="loginF" method="post" action="loginEnd.do">
	<div class="row">
		<div class="col-md-8 offset-md-2">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" id="userid" value="<%=saveId%>"
						placeholder="User ID" class="form-control"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" id="pwd"
						placeholder="Password" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><label for="saveId" class="form-check-label">
							<input type="checkbox" class="form-check-input" name="saveId"
							<%=(flag)?"checked":""%>
							id="saveId">아이디 저장
					</label>
						<button type="button" id="btnlogin" class="btn btn-success ml-3">로그인</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</form>


<jsp:include page="/foot.jsp" />