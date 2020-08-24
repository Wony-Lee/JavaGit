<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/top.jsp" />
<script>
	$(function(){
		//	$('#bbs').focus();
	})

</script>

<div class="text-left p-5">
	<h1 class="text-center">MVC Board List</h1>
	<p class="text-center">
		<a href="write.do">글쓰기</a>| <a href="list.do">글목록</a>
	</p>
	<div class="row">
		<div class="col-md-3 offset-md-8 p-3 m-3">
			<!--  pageSize 관련 form 시작 ------------------------------- -->
			<form name="listF" id="listF" action="list.do#t1">
				<!-- hidden data cpage 값 넘기기 -->
				<input type="hidden" name="cpage" value="${cpage}">
				<!-- ----------------------- -->
				<select name="pageSize" class="form-control" onchange="submit()">
					<option value="5">::페이지 사이즈 선택::</option>
					<c:forEach var="ps" begin="5" end="20" step="5">
					<option value="${ps}">페이지 사이즈 ${ps}</option> 
					</c:forEach>
				</select>
			</form>
			<!--  ---------------------------------------------------- -->
		</div><!--  col end -->
	</div><!-- row end -->
	<table class="table table-striped table-hover" id="t1">
		<tr class="table-dark">
			<th width="10%">글번호</th>
			<th width="40%">제 목</th>
			<th width="20%">글쓴이</th>
			<th width="20%">날 짜</th>
			<th width="10%">조회수</th>
		</tr>
		<!-- ----------------------------------------- -->
		<c:if test="${boardArr==null||empty boardArr}">
			<%-- (boardArr.size()==0) ==> empty boardArr --%>
			<tr>
				<td colspan="5">데이터가 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${boardArr!=null && not empty boardArr}">
			<c:forEach var="board" items="${boardArr}">
				<tr>
					<td>${board.idx}</td>

					<td><a href="view.do?idx=${board.idx}">${board.subject}</a> 
					<c:if test="${board.filesize>0}">
							<img src="../images/캡처.png" width="16px">
						</c:if></td>

					<td>${board.name}</td>
					<td><fmt:formatDate value="${board.wdate}"
							pattern="yyyy-MM-dd" /> <!--  날짜 포맷 --></td>
					<td>${board.readnum}</td>
				</tr>
			</c:forEach>
		</c:if>
		<!-- ----------------------------------------- -->
		<tr>
			<td colspan="3" class="text-center">
				<!-- begin : 시작값, end : 끝 값, step : 증가치 -->
				<ul class="pagination justify-content-center">
					<c:forEach var="i" begin="1" end="${pageCount}" step="1">
						<li class="page-item <c:if test="${cpage ==i}">active</c:if>">
							<a class="page-link" href="list.do?cpage=${i}#t1">${i}</a>
						</li>
					</c:forEach>
				</ul>
			</td>
			<td colspan="3" class="text-center">총게시글 수 : <span
				class="text-primary">${totalCount}</span> 개 <br> <span>현재
					페이지</span>/<span>총페이지 수</span>
			</td>
		</tr>

	</table>
</div>

<jsp:include page="/foot.jsp" />