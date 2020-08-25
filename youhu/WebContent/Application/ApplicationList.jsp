<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/top.jsp"/>
<p>${totalCount }</p>
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
						<th class="text-center" colspan="4">봉사신청</th>
					</tr><!-- table header end -->
					
					<tr><!-- table top -->
						<td>글번호</td>
						<td>신청자</td>
						<td>주소</td>
						<td>날짜</td>
						<td>${arrApp.aidx}</td>
						<!--<td>수정|삭제</td>-->
					</tr><!-- table end -->
					
					<c:if test="${appArr==null eq null or empty appArr}">
					<tr><!-- table body -->
						<td colspan="4"> 게시글이 없습니다. </td>					
					</tr><!-- table body end -->
					</c:if>
					<c:if test="${appArr}">
						<c:forEach var="appList" items="${appArr}">
					<tr><!-- table Page -->
						<td>${arrApp.aidx}</td>
						<td>${arrApp.name}</td>
						<td>${arrApp.addr1}</td>
						<td>${arrApp.wdate}</td>
						<!-- <td>e</td> -->
					</tr><!-- table Page end -->
						</c:forEach>
					</c:if>
					<tr><!-- table foot -->
					<td class="text-left" colspan="2">[◀]　1,2,3,4,5　[▶]</td>
					<td class="text-right" colspan="2">
					<button class="btn btn-outline-primary" onclick="location.href='ApplicationWrite.jsp'">신청하기</button></td>
					</tr><!-- table foot -->
					
				</table> <!-- table end -->
			</div>
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp"/>