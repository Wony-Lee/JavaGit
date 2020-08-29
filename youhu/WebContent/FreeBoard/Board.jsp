<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<p></p>
<div class="container">
<div style="border:1px solid gold">
<p>자유게시판이라고 알리고싶은데 어떻게 헷갈리지않게 알릴 수 있을까?</p>
</div>
	<div class="col-md-12">
		<div class="row">
			<!-- nav start -->
			<div class="col-md-2">
				<ul class="nav flex-column">
				  <li class="nav-item">
				    <a class="nav-link" href="../Application/Application.jsp">봉사신청</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="../Review/Review.jsp">분양후기</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="Board.jsp">자유게시판</a>
				  </li>
				</ul>
			</div>
			<!-- nav end -->
			<div class="col-md-10">
				<table class="table table-hover"> <!-- table start -->
					<tr><!-- table header -->
						<th class="text-center" colspan="5">자유게시판</th>
						
					</tr><!-- table header end -->
					
					<tr><!-- table top -->
						<td>글번호</td>
						<td colspan="2">제목</td>
						<td>조회수</td>
						<td>날짜</td>
					</tr><!-- table end -->
					
					<tr><!-- table body -->
					
					</tr><!-- table body end -->
					
					<tr><!-- table Page -->
						<td>a</td>
						<td colspan="2">b</td>
						<td>c</td>
						<td>d</td>
					</tr><!-- table Page end -->
			
					<tr><!-- table foot -->
					<td class="text-left" colspan="3">[◀]　1,2,3,4,5　[▶]</td>
					<td class="text-right" colspan="2">
					<button class="btn btn-outline-success" onclick="location.href='BoardWrite.jsp'">글 쓰기</button></td>
					</tr><!-- table foot -->
					
				</table> <!-- table end -->
			</div>
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp"/>