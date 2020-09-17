<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />
<%
	String wrkp_nm=request.getParameter("wrkp_nm");

%>
<script type="text/javascript">
$(function(){
	$('#openBtn').click(function(){
		var keyword=$('#hospital').val();
		if(!keyword){
			alert('검색할 동물병원을 입력하세요.');
			$('#hospital').focus();
			return;
		}
		showDataList(keyword);
	})
});
var showDataList=function(keyword){
	
	var url="hospitalResult.do?query="+encodeURIComponent(keyword);
	send(url, keyword);
}
var send=function(url, keyword){
	$.ajax({
		type:'get',
		url:url,
		dataType:'xml',
		cache:false,
		success:function(res){
			var totalCount=$(res).find("totalCount").text();
			if(totalCount==0){
				alert("검색 결과가 없습니다.");
			}
			var str=+careNm;
			$('#openApiHospital').html(str);
		},
		error:function(err){
		alert('error: '+err.status);
		}
	})
}
</script>

<div class="container">
	<h1 id="msg">서울시 동물병원 찾기</h1>
	<form name="findH" id="findH" action="">
		<div class="row">
			<div class="col-md-8">
				<input type="text" name="hospital" id="hospital"
					onkeyup="autoComp(this.value)" class="form-control"
					placeholder="검색할 병원을 입력하세요.">
			</div>
			<div class="col-md-2">
				<button type="button" id="openBtn" class="btn btn-info"
					style="float: right; width: 100%">검색</button>
			</div>
		</div>
	</form>
</div>
<p></p>
<table id="shelter_info" class="table table-hover" border="2">
	<tr>
		<th>동물병원 리스트</th>
	</tr>
	<tr>
		<td><div id="openApiHospital" class="container"></div></td>
	</tr>

</table>
<jsp:include page="/foot.jsp" />