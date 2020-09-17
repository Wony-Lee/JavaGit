<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp"/>
	<p></p>
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
				<table class="table table-hover">
					<tr>
						<th class="text-right m" colspan="3"><h2>분양후기</h2></th>
						<td class="text-right" colspan="3">
						<button class="btn btn-outline-success" onclick="location.href='ReviewWrite.do'">리뷰작성</button></td>
					</tr>
					<tr>
						<td>제목 : </td>
						<td class="text-left-m"><label>뭘까요1?</label></td>
						<td>제목 :</td>
						<td class="text-left-m"><label>뭘까요?</label></td>
						<td>제목  :</td>
						<td class="text-left-m"><label>뭘까요?</label></td>
					</tr>
				
					<tr class="text-center">		
						<td colspan="2" style="width:33%;">
						<div class="justify-content-center" style="border:1px solid gold; width:100%">
								<img src="../images/a1.jpg" class="rounded" style="width:100%;">
						</div>
						</td>
						
						<td colspan="2" style="width:33%;">
						<div class="justify-content-center" style="border:1px solid gold; width:100%">
						<img src="../images/a1.jpg" class="rounded" alt="Cinque Terre" style="width:100%">
						</div>
						</td>
						
						<td colspan="2" style="width:33%;">
						<div class="justify-content-center" style="border:1px solid gold; width:100%">
						<img src="../images/a1.jpg" class="rounded" alt="Cinque Terre" style="width:100%">
						</div>
						</td>
					</tr>
					
					<tr>
						<td class="text-right" colspan="2"><button class="btn btn-success">상세보기</button></td>
						<td class="text-right" colspan="2"><button class="btn btn-success">상세보기</button></td>
						<td class="text-right" colspan="2"><button class="btn btn-success">상세보기</button></td>
					</tr>
					
					<tr>
						<td>제목 : </td>
						<td class="text-left-m"><label>뭘까요1?</label></td>
						<td>제목 :</td>
						<td class="text-left-m"><label>뭘까요?</label></td>
						<td>제목  :</td>
						<td class="text-left-m"><label>뭘까요?</label></td>
					</tr>
					
					<tr class="text-center">		
						<td colspan="2" style="width:33%;">
						<div class="justify-content-center" style="border:1px solid gold; width:100%">
						<img src="../images/a1.jpg" class="rounded" style="width:100%">
						</div>
						</td>
						
						<td colspan="2" style="width:33%;">
						<div class="justify-content-center" style="border:1px solid gold; width:100%">
						<img src="../images/a1.jpg" class="rounded" alt="Cinque Terre" style="width:100%">
						</div>
						
						</td>
						
						<td colspan="2" style="width:33%;">
						<div class="justify-content-center" style="border:1px solid gold; width:100%">
						<img src="../images/a1.jpg" name="image1" class="rounded" alt="Cinque Terre" style="width:100%">
						</div>
						</td>
					</tr>
					
					<tr>
						<td class="text-right" colspan="2"><button class="btn btn-success">상세보기</button></td>
						<td class="text-right" colspan="2"><button class="btn btn-success">상세보기</button></td>
						<td class="text-right" colspan="2"><button class="btn btn-success">상세보기</button></td>
					</tr>
					
					<tr>
						<td class="text-center" colspan="6">[]1,2,3,4,5[]</td>
					</tr>
					
				</table>
			</div>
		</div>
	</div>

<jsp:include page="../foot.jsp"/>