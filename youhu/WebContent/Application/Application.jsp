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
				<table class="table table-hover"> <!-- table start -->
					<tr><!-- table header -->
						<th class="text-center" colspan="5">봉사신청</th>
						
					</tr><!-- table header end -->
					
					<tr><!-- table top -->
						<td>글번호</td>
						<td>제목</td>
						<td>조회수</td>
						<td>날짜</td>
						<td>수정|삭제</td>
					</tr><!-- table end -->
					
					<tr><!-- table body -->
					
					</tr><!-- table body end -->
					
					<tr><!-- table Page -->
						<td>a</td>
						<td>b</td>
						<td>c</td>
						<td>d</td>
						<td>e</td>
					</tr><!-- table Page end -->
			
					<tr><!-- table foot -->
					<td class="text-left" colspan="3">[◀]　1,2,3,4,5　[▶]</td>
					<td class="text-right" colspan="2">
					<button class="btn btn-outline-primary" onclick="location.href='ApplicationWrite.jsp'">신청하기</button></td>
					</tr><!-- table foot -->
					
				</table> <!-- table end -->
			</div>
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp"/>