<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />

<style>
.caret {
	position: absolute;
	right: 16px;
	top: 16px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#openBtn').click(function() {
			var keyword = $('#shelter').val();
			if (!keyword) {
				alert('검색할 보호소를 입력하세요.');
				$('#shelter').focus();
				return;
			}
			showDataList(keyword);

		})
	});

	var showDataList = function(keyword) {

		var url = "shelterResult.do?query=" + encodeURIComponent(keyword);
		send(url);
		//alert(keyword);

		/*var str=$('#shelter').val()+"에 대한 검색 결과";
			str+="<table class='table'>";
			str+="<tr>";
			$.each(keyword,function(i, shelter){
				str+="<td width='25%'>";
				str+="보호소명 : "+shelter.careNm+"<br>";
				str+="주소 : "+shelter.careAddr+"<br>";
				str+="연락처 : "+shelter.careTel;
			});
			str+="</tr></table>";
			$('#openApiShelter').html(str).show(500);
		 */
	}

	var send = function(url) {
		$.ajax({
			type : 'get',
			url : url,
			dataType : 'xml',
			cache : false,
			success : function(res) {
				//alert(res);
				var totalCount = $(res).find("totalCount").html();
				//alert(totalCount);
				if (totalCount == 0) {
					alert("검색 결과가 없습니다.");
				} else {
					var str = $(res).find("careNm").text();
					//alert(str);
					$('#openApiShelter').html(str);				
				}
				
			},
			error : function(err) {
				alert('error: ' + err.status);
			}
		})
	}
</script>

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
						<th class="text-center" colspan="4">보호소 찾기</th>
					</tr>
					<!-- table header end -->

					<tr>
						<!-- table Page -->
						<td colspan="2">
							<form name="findS" id="findS" action="">
								<input type="text" name="shelter" id="shelter" class="form-control"
								placeholder="검색할 보호소를 입력하세요.">
							</form>
						</td>
						<td colspan="2">
							<button type="button" name="openBtn" id="openBtn"
						class="btn btn-info" style="float: right; width: 100%">검색</button>
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