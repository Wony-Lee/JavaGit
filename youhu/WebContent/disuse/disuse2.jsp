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
				var arr =$(res).find('row')
				if (totalCount == 0) {
					alert("검색 결과가 없습니다.");
				}
				var str = "";
				$.each(arr, function(i,obj){
					var name=$(obj).find('WRKP_NM').text();
				    var tel=$(obj).find('SITE_TEL').text();
					str+=name+" ["+tel+"]<br>";
				})
				
				
				
				$('#openApiHospital').html(str);
			},
			error : function(err) {
				alert('error: ' + err.status);
			}
		})
	}
</script>
<p></p>
					<h2 id="msg" style="text-align: center;">서울시 동물병원 찾기</h2>
<div class="container">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a
						href="/YOUHU/info/infoCenter.do">센터소개</a></li>
					<li class="list-group-item"><a
						href="/YOUHU/info/animalShelter.do">보호소 검색</a></li>
					<li class="list-group-item"><a
						href="/YOUHU/info/animalHospital.do">동물병원 검색</a></li>
					<li class="list-group-item"><a
						href="/YOUHU/info/presentCondition.do">유기동물 현황</a></li>
				</ul>
			</div>

			<div class="col-md-4">
				<form name="findH" id="findH" action="">
					<input type="text" name="hospital" id="hospital"
						class="form-control" placeholder="검색할 병원을 입력하세요.">
					<button type="button" id="openBtn" class="btn btn-info">검색</button>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<table id="shelter_info" class="table table-hover" border="2">
					<tr>
						<th>동물병원 리스트</th>
					</tr>
					<tr>
						<td><div id="openApiHospital" class="container"></div></td>
					</tr>

				</table>
			</div>
		</div>
	</div>
	<p></p>

</div>
<jsp:include page="/foot.jsp" />