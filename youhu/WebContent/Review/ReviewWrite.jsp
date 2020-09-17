<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp"/>
<p></p>
<form id="revF" name="revF" action="ReviewWrite.do" method="post">
<div class="container">
	<div class="col-md-12">
		<div class="row">
						<!-- nav start -->
				<div class="col-md-2">
					<ul class="nav flex-column">
					  <li class="nav-item">
					    <a class="nav-link" href="appList.do">봉사신청</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="ReviewList.do">분양후기</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="BoardList.do">자유게시판</a>
					  </li>
					</ul>
				</div>
			<!-- nav end -->
			<div class="col-md-10">
				<table class="table talbe-hover">
					<tr>
						<th class="text-center" colspan="4"><h2>분양후기 작성</h2></th>
					</tr>
					
					<tr>
						<td style="vertical-align: middle;">이름</td>
						<td><input class="form-control" ></td>
						<td style="vertical-align: middle;">작성일</td>
						<td><input class="form-control" ></td>
					</tr>
					
					<tr>
						<td style="vertical-align: middle;">보호소</td>
						<td><input class="form-control" placeholder="Center Name"></td>
						<td style="vertical-align: middle;">뭘까?</td>
						<td><input class="form-control" placeholder="What.."></td>
					</tr>
					
					<tr>
						<td colspan="4">
						<textarea class="form-control" cols="4" rows="15" placeholder="Content"></textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">이미지 첨부</td>
						<td colspan="2"><input type="file" name="image1"></td>
						
					</tr>
					
					<tr>		
						<td colspan="2">
						<div class="justify-content-center"  style="border:1px solid gold; width:100%">
						<img src="../images/a1.jpg" name="image1" class="rounded" style="width:100%">
						</div>
						</td>
					
						<td colspan="2">
						<div class="justify-content-center"  style="border:1px solid gold; width:100%">
						<img src="../images/a1.jpg" name="image2" class="rounded" alt="Cinque Terre" style="width:100%">
						</div>
						</td>

					</tr>
					
					<tr>
						<td class="text-right" colspan="2">
						<button type="submit" class="btn btn-outline-success" id="btnWrite" name="btnWrite">작성</button>
						</td>
						<td class="text-left" colspan="2">
						<button class="btn btn-outline-danger" onclick="location.href='ReviewList.do'">취소</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
</form>
<script>
		$(function(){
			$('#btnWrite').click(function(){
				if(!$('#name').val()){
					alert('이름을 입력해주세요.');
					$('#name').focus();
					return false;
				}
				if(!$('#center').val()){
					alert('보호소를 입력해주세요.');
					$('#center').focus();
					return false;
				}
				if(!$('#content').val()){
					alert('내용을 입력해주세요.');
					$('#content').focus();
					return false;
				}
				$('#revF').submit();
			})
		})
</script>
<jsp:include page="../foot.jsp"/>