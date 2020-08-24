<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>

<p></p>
<div class="container">
	<div class="col-md-12">
		<div class="row">
			<!-- nav start -->
			<div class="col-md-2">
				<ul class="nav flex-column">
				  <li class="nav-item">
				    <a class="nav-link" href="Application.jsp">봉사신청</a>
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
					<td><input class="form-control" readonly></td>
					<td class="text-right m" style="vertical-align: middle;">성별 :</td>
					<td><input class="form-control" readonly></td>

				</tr>
				<tr>
					<td class="text-right m" style="vertival-align: middle;">생년월일 :</td>
					<!-- 조만간 수정예정 -->
					<td><input class="form-control" placeholder="Birth"></td>
					
					<td class="text-right m" style="vertival-align: middle;">연락처 :</td>
					<td><input class="form-control" placeholder="Tel"></td>

					
				</tr>
				<tr>
					<td class="text-right m" style="vertival-align: middle;">우편번호 :</td>
					<td><input class="form-control" placeholder="Post"></td>
					<td><button type="button" class="btn btn-outline-success">우편번호 찾기</button> </td>
					<td></td>
				</tr>
				<tr>
					<td class="text-right m" style="vertival-align: middle;">주소 :</td>
					<td><input class="form-control" placeholder="Addr1"></td>
					<td colspan="2"><input class="form-control" placeholder="Addr2"></td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea class="form-control" cols="4" rows="4" placeholder="Self-introduction"></textarea></td>
				</tr>
				<tr>
					<td class="text-right" colspan="2"><button type="button" class="btn btn-outline-success">신청</button></td>
					<td class="text-left" colspan="2"><button type="button" class="btn btn-outline-danger">취소</button></td>
				</tr>
			</table>
			
			</div>
		
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp"/>