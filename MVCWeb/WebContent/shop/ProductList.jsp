<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/top.jsp" />

<!-- 테이블 정렬 플러그인 참조 -->
<script type="text/javascript" src="../js/stupidtable.min.js">
</script>
<!-- ---------------- -->

<script>
	$(function(){
		$('#productTable').stupidtable();
	})
</script>

<div class="text-left p-5">
	<h1 class="text-center">Product List[Admin]</h1>
	<table id="productTable" class="table table-striped mt-4">
		<thead>
		<tr class="bg-warning">
			<th data-sort="int">상품번호</th>
			<th data-sort="string">카테고리</th>
			<th data-sort="string">상품명</th>
			<th data-sort="int">정가/판매가</th>
			<th data-sort="string">제조사</th>
			<th>편집|삭제</th>
		</tr>
		</thead>
		<tbody>
				<!-- -------------------- -->
		<c:if test="${prodList eq null or empty prodList}">
			<tr>
				<td colspan="6"><b>데이터가 없습니다.</b></td>
			</tr>
		</c:if>
		<c:if test="${prodList ne null and not empty prodList}">
		<c:forEach var="pd" items="${prodList}" varStatus="st">
			<tr id="pd${st.count}">
				<td>${pd.pnum}</td>		
				<%-- ${pd.upCg_code}-${pd.downCg_code}1 --%>		
				<td>${pd.allCategory}</td>
				<td class="text-center">${pd.pname}<BR>
					<a href="../prodDetail.do?pnum=${pd.pnum}">
					<img src="../images/${pd.pimage1}" style="width:180px"></a>
				</td>		
				<td>${pd.price}원<br>
				<span class="text-danger">${pd.saleprice}</span><br>
				<span class="badge badge-info">${pd.percent}%할인</span>
				</td>		
				<td>${pd.pcompany}</td>		
				<td><a>편집</a>|<a href="#pd${st.count}" onclick="del('${pd.pnum}')">삭제</a></td>		
			</tr>
		</c:forEach>
		</c:if>
				<!--  ------------------ -->
		</tbody>
	</table>
	<table class="table">
		<tr>
			<td style="width:60%">pageNavi</td>
			<td style="width:40%">총 상품갯수 : <b>${totalCount} 개</b></td>
		</tr>
	</table>
</div>
<form name="pf" id="pf">
	<input type="text" name="pnum" id="pnum">
</form>
<script>
 	function del(pnum){
 		var yn=confirm(pnum+"번 상품을 정말 삭제할까요?");
 		
 		if(!yn)return;
 		
 		pf.pnum.value=pnum;
 		pf.action="prodDel.do?";
 		pf.method='post';
 		pf.submit();
 	}
</script>

<jsp:include page="/foot.jsp" />