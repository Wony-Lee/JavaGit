<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<p></p>
<form name="af" id="af" action="writeEnd.do" method="post">
<div class="container">
	<div class="col-md-12">
		<div class="row">
			<!-- nav start -->
			<div class="col-md-2">
				<ul class="nav flex-column">
				  <li class="nav-item">
				    <a class="nav-link" href="ApplicationList.jsp">봉사신청</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="../Review/Review.jsp">분양후기</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="../FreeBoard/Board.jsp">자유게시판</a>
				  </li>
				</ul>
			</div>
			<!-- nav end -->
		
			<div class="col-md-10">
			<table class="table" style="border:2px solid darkgray">
				<tr>
					<th class="text-center" colspan="4">
						<h1>신청서 작성</h1>
					</th>
				</tr>
				<tr>
					<td class="text-right m" style="vertical-align: middle;">이름 :</td>
					<td><input class="form-control" id="name" name="name" readonly></td>
					<td class="text-right m" style="vertical-align: middle;">성별 :</td>
					<td><input class="form-control" id="sex" name="sex" readonly></td>

				</tr>
				<tr>
					<td class="text-right m" style="vertival-align: middle;">생년월일 :</td>
					<!-- 조만간 수정예정 -->
					<td><input type="text" class="form-control" id="birth" name="birth" placeholder="Birth"></td>
					
					<td class="text-right m" style="vertival-align: middle;">연락처 :</td>
					<td><input type="text" class="form-control" id="tel" name="tel" placeholder="Tel"></td>

					
				</tr>
				<tr>
					<td class="text-right m" style="vertival-align: middle;">우편번호 :</td>
					<td><input type="text" class="form-control" id="post" name="post" placeholder="Post"></td>
					<td><button type="button" class="btn btn-secondary">우편번호 찾기</button> </td>
					<td></td>
				</tr>
				<tr>
					<td class="text-right m" style="vertival-align: middle;">주소 :</td>
					<td><input type="text" class="form-control" id="addr1" name="addr1" placeholder="Addr1"></td>
					<td colspan="2"><input type="text" class="form-control" id="addr2" name="addr2" placeholder="Addr2"></td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea type="text" class="form-control" cols="4" rows="4" id="contents" name="contents" placeholder="Self-introduction"></textarea></td>
				</tr>
				<tr>
					<td class="text-right" colspan="2"><button type="button" class="btn btn-success" id="btnWrite">신청</button></td>
					<td class="text-left" colspan="2">
					<button type="button" class="btn btn-danger" onclick="location.href='javascript:history.back()'">취소</button>
					</td>
				</tr>
			</table>
			
			<input type="hidden" class="form-control" readonly>
			
			</div>
		
		</div>
	</div>
</div>
</form>

<script>
$(function(){
	$('#btnWrite').click(function(){
		//if(!$('#name').val()){
			//alert('이름이 입력되지 않았습니다.');
			//$('#name').focus();
			//return false;
		//}
		
		if(!$('#tel').val()){
			alert('연락처를 입력해주세요.')
			$('#tel').focus();
			return false;
		}
		if(!$('#addr1').val()){
			alert('주소를 입력해주세요.')
			$('#addr1').focus();
			return false;
		}
		if(!$('#addr2').val()){
			alert('상세 주소를 입력해주세요.')
			$('#addr2').focus();
			return false;
		}
		$('#af').submit();
	})
})
</script>


<jsp:include page="/foot.jsp"/>