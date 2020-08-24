<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/top.jsp" />
<script>
	$(function() {
		//	$('#bbs').focus();
	})
</script>

<div class="text-left p-5">
	<h1 class="text-center">MVC Board [%{findKeyword}]</h1>
	<p class="text-center">
		<a href="write.do">글쓰기</a>| <a href="list.do">글목록</a>
	</p>
	<div class="row p-3 m-2">
		<div class="col-md-3">
			<!--  pageSize 관련 form 시작 ------------------------------- -->
			<form name="listF" id="listF" action="list.do#t1">
				<!-- hidden data cpage 값 넘기기 -->
				<input type="hidden" name="cpage" value="${cpage}">
				<input type="hidden" name="findType" value="${findType}">
				<input type="hidden" name="findKeyword" value="${findKeyword}">
				<!-- ----------------------- -->
				<select name="pageSize" class="form-control m-2" onchange="submit()">
					<option value="5">Page Size Select</option>
					<c:forEach var="ps" begin="5" end="20" step="5">
						<option value="${ps}">페이지 사이즈 ${ps}</option>
					</c:forEach>
				</select>
			</form>
			<!--  ---------------------------------------------------- -->
		</div><!--  col end -->
		<div class="col-md-9">
		<form name="findF" id="findF" action="find.do#t1" class="form-inline">
			<select name="findType" id="findType" class="form-control m-2">
				<option value="0">::검색 유형::</option>
				<option value="1">제 목</option>
				<option value="2">작성자</option>
				<option value="3">글내용</option>
			</select>
			<input type="text" name="findKeyword" id="findKeyword" 
			placeholder="검색어를 입력하세요." class="form-control m-2" required>
			<button class="btn btn-primary">검색</bttuon>
		</form>
		</div>
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

					<td><a href="view.do?idx=${board.idx}">${board.subject}</a> <c:if
							test="${board.filesize>0}">
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
					<c:if test="${prevBlock>0}">
						<!--  이전 5개 -->
						<li class="page-item"><a class="page-link"
							href="find.do?cpage=${prevBlock}#t1">이전 ${pagingBlock}개</a></li>
					</c:if>
					<c:forEach var="i" begin="${prevBlock+1}" end="${nextBlock-1}"
						step="1">
						<c:if test="${i<=pageCount}">
							<li class="page-item <c:if test="${cpage ==i}">active</c:if>">
								<a class="page-link" href="find.do?cpage=${i}#t1">${i}</a>
							</li>
						</c:if>
					</c:forEach>

					<c:if test="${nextBlock<=pageCount}">
						<!--  이후 5개 -->
						<li class="page-item"><a class="page-link"
							href="list.do?cpage=${nextBlock}#t1">이후 ${pagingBlock}개</a></li>
					</c:if>


				</ul>
			</td>
			<td colspan="3" class="text-center">총게시글 수 : <span
				class="text-primary">${totalCount}</span> 개 <br> <span
				class="text-danger">${cpage}</span> /<span>${pageCount}</span>
			</td>
		</tr>

	</table>
</div>

<jsp:include page="/foot.jsp" />