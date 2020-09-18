<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />
<%
	String wrkp_nm = request.getParameter("wrkp_nm");
%>
<script type="text/javascript">
	$(function() {
		$('#openBtn').click(function() {
			var keyword = $('#hospital').val();
			if (!keyword) {
				alert('검색할 동물병원을 입력하세요.');
				$('#hospital').focus();
				return;
			}
			showDataList(keyword);
		})
	});
	var showDataList = function(keyword) {

		var url = "hospitalResult.do?query=" + encodeURIComponent(keyword);
		send(url, keyword);
	}
	var send = function(url, keyword) {
		$.ajax({
			type : 'get',
			url : url,
			dataType : 'xml',
			cache : false,
			success : function(res) {
				var totalCount = $(res).find("list_total_count").text();
				var arr = $(res).find('row')
				if (totalCount == 0) {
					alert("검색 결과가 없습니다.");
				}		
				var str = "";
				$.each(arr, function(i, obj) {
					var name = $(obj).find('WRKP_NM').text();
					var tel = $(obj).find('SITE_TEL').text();
					var closeyn = $(obj).find('TRD_STATE_GBN_CTN').text();
					str += name + " [" + tel + "]"+"★"+closeyn+"★<br><br>";
				})

				$('#openApiHospital').html(str);
			},
			error : function(err) {
				alert('error: ' + err.status);
			}
		})
	}
</script>
<style>
	#openApiHospital{
		color:pink;
		font-weight:bold;
		text-align:center;
	}
</style>
<p></p>
<div class="container">
	<div class="col-md-12">
		<div class="row">
			<!-- nav start -->
			<div class="col-md-2">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a
						href="infoCenter.do">센터소개</a></li>
					<li class="list-group-item"><a
						href="animalShelter.do">보호소 검색</a></li>
					<li class="list-group-item"><a
						href="animalHospital.do">동물병원 검색</a></li>
					<li class="list-group-item"><a
						href="presentCondition.do">유기동물 현황</a></li>
				</ul>
			</div>
			<!-- nav end -->
			<div class="col-md-10">
				<table class="table table-hover">
					<!-- table start -->
					<tr>
						<!-- table header -->
						<th class="text-center" colspan="4">동물병원 찾기</th>
					</tr>
					<!-- table header end -->

					<tr>
						<!-- table Page -->
						<td colspan="2">
							<form name="findH" id="findH" action="">
								<input type="text" name="hospital" id="hospital"
									class="form-control" placeholder="검색할 병원을 입력하세요.">
							</form>
						</td>
						<td colspan="2">
							<button type="button" id="openBtn" class="btn btn-info" style="float: right; width: 100%">검색</button>
						</td>
					</tr>
					<!-- table Page end -->
					<tr>
						<td colspan="4"><div id="openApiHospital" class="container"></div></td>
					</tr>
					<!-- table foot -->
				</table>
				<!-- table end -->
			</div>
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp" />