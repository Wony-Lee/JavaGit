<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,user.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/top.jsp" />

<div class="text-left p-5">
	<div class="row">
		<div class="col-md-12">
			<h1>User List[Admin Page]</h1>
		</div>
	</div>
	<!-- ----------------검색 폼 시작---------------------- -->
	<form name="sf" id="sf" action="memberFind.jsp">
		<div class="row mt-3">
			<div class="col-md-2">
				<select class="form-control" name="findType">
					<option value="">::검색 유형::</option>
					<option value="1">회원이름</option>
					<option value="2">아이디</option>
					<option value="3">연락처</option>

				</select>
			</div>
			<div class="col-md-8">
				<input type="text" name="findKeyword" placeholder="검색어를 입력하세요."
					class="form-control">
			</div>
			<div class="col-md-2">
				<button type="button" onclick="search()" class="btn btn-info">검색</button>
			</div>
		</div>
	</form>
	<!-- 검색 폼 끝 -------------------------------------------------------- -->
	<div class="row mt-3">
		<div class="col-md-12">
			<table class="table table-striped mt-2">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>연락처</th>
					<th>회원상태</th>
					<th>수정|삭제</th>
				</tr>
				<!-- ----------------------------- -->
				<c:if test="${userList eq null or empty userList}">
					<tr>
						<td colspan="6"><b>데이터가 없습니다.</b></td>
					</tr>
				</c:if>
				<c:if test="${userList ne null and not empty userList}">
				<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.idx}</td>
					<td>${user.name}</td>
					<td>${user.userid}</td>
					<td>${user.allHp}</td>
					<td>
						<c:choose>
							<c:when test="${user.mstate eq 0}">일반회원</c:when>
							<c:when test="${user.mstate eq 1}">정지회원</c:when>
							<c:otherwise>탈퇴회원</c:otherwise>
						</c:choose>
					</td>
					<td><a href="#" onclick="edit('${user.idx}')">수정</a>| <a
						href="javascript:del('${user.idx}')">삭제</a></td>
				</tr>
				</c:forEach>
				</c:if>
				<!-- ----------------------------- -->

				<tr>
					<td colspan="4">
						<ul class="pagination justify-content-center">
						
							<li class="page-item"><a
								class="page-link">a</a></li>

						</ul>
					</td>
					<td colspan="2"><b>총 회원수 : <span class="text-danger">
								</span></b></td>
				</tr>
			</table>
		</div>
	</div>

	<!-- 삭제 또는 수정 관련 폼 ---------------------------- -->
	<form name="frm">
		<input type="hidden" name="idx" id="idx">
	</form>
</div>

<script type="text/javascript">
	var search = function() {
		if (!sf.findType.value) {
			alert('검색 유형을 선택하세요.');
			sf.findType.focus();
			return;
		}

		if (!sf.findKeyword.value) {
			alert('검색어를 입력하세요.');
			sf.findKeyword.focus();
			return;
		}
		sf.submit();
	}

	var del = function(midx) {
		var yn = confirm(midx + "번 회원 정보를 정말 삭제할까요?");
		if (yn) {
			//location.href="memberDel.jsp?idx="+midx; // get 방식 좋지않음.
			frm.idx.value = midx;
			frm.method = "POST";//post 방식
			frm.action = "memberDel.jsp";
			frm.submit();
		}
	}
	var edit = function(midx) {
		//alert('midx='+midx); attr('속성명','속성값') .prop('속성명','속성값')
		$('#idx').val(midx);
		$('form[name="frm"]').prop("method", "POST").prop("action",
				"memberEdit.jsp").submit();
	}
</script>
<jsp:include page="/foot.jsp" />