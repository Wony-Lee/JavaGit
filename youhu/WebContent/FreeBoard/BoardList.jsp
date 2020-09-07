<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<table class="table table-hover"> <!-- table start -->
					<tr><!-- table header -->
						<th class="text-center" colspan="4">자유게시판</th>
						
					</tr><!-- table header end -->
					
					<tr><!-- table top -->
						<td>글번호</td>
						<td>이름</td>
						<td>제목</td>
						<td>날짜</td>
					</tr><!-- table end -->
					
					<c:if test="${boardList eq null or empty boardList }">
					<tr><!-- table body -->
						<td colspan="4"> 게시글이 없습니다. </td>
					</tr><!-- table body end -->
					</c:if>
					
				<c:if test="${boardList ne null and not empty boardList}">
					<c:forEach var="bl" items="${boardList}" varStatus="bor">		
					<tr id="bl${bor.count}"><!-- table Page -->
						<td>${bl.bidx}</td>
						<td>${bl.name}</td>
						<td><a href="BoardView.do?bidx=${bl.bidx}">${bl.subject}</a></td>
						<td>${bl.indate}</td>
					</tr><!-- table Page end -->
					</c:forEach>
				</c:if>
				
					<tr><!-- table foot -->
					<td class="text-left" colspan="2">[◀]　1,2,3,4,5　[▶]</td>
					<td class="text-right" colspan="2">
					<button class="btn btn-outline-success" onclick="location.href='BoardWrite.do'">글 쓰기</button></td>
					</tr><!-- table foot -->
					
				</table> <!-- table end -->
			</div>
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp"/>