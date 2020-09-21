<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String myctx = request.getContextPath();
%>
<jsp:include page="/top.jsp" />

<script>
	var win=null;
	function addrCheck() {
		f.flag.value="false";
		win=window.open("postSelect.jsp","adrCheck","width=400, height=400, left=100, top=100");
	}
	
	//여기 있는건 소스를 긁어온겁니다.
	function preImg(a, b, c, d) {
		var f = a.value;
		var g = f.substring(f.lastIndexOf('.') + 1).toLowerCase();
		var h = document.getElementById(b);
		if (!/(jpg|png|gif|jpeg)$/i.test(g)) {
			alert('이미지파일 형식은 jpg, png, gif 만 등록 가능합니다.');
			return;
		}
		while (h.firstChild) {
			h.removeChild(h.firstChild);
		}
		  	if (window.FileReader) {
		    	var i = b + "_img";
		    	var j = new FileReader();
		    	var k = "";
		    	
		    	j.onload = function(e) {
		      		k = "<img id='" + i + "' src='" + e.target.result + "' style='width:auto;height:" + d + "px;max-width:" + c + "px;' alt='이미지'/>";
		      		document.getElementById(b).innerHTML = k;
		    	};
		    	
		    	j.readAsDataURL(a.files[0]);
		    	
		  		}else{	
		    		a.select();
		    		a.blur();
		    		var l = document.selection.createRange().text;
		    		h.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src='" + l + "')";
		  		}
		}
	/**$(function accept(){
		$('#prodF').on('submit', function(){
			if(!$('#title').val()){
				alert('제목을 입력하세요');
				$('#title').focus();
				return false;
			}
			if(!$('#image1').val()){
				alert('1번 사진을 올려주세요.');
				$('#image1').focus();
				return false;
			}
			if(!$('#sex').val()){
				alert('성별을 선택해주세요');
				$('#sex').select();
				return false;
			}
			if(!$('#addr').val()){
				alert('발견장소를 입력해주세요');
				$('#addr').select();
				return false;
			}
		})
	})*/
</script>
<div class="col-md-12">
	<div class="row">
		<div class="col-md-3 text-left mt-3" style="height:910px; border:solid 2px;">
			<div class="justify-content-center">
				<div class="row">
					<table class="table table-hover table-condensed table-bordered mt-1" bgcolor="pink">
						<tr>
							<td class="text-center">
								<a class="nav-link" href="<%=myctx%>/animSecure.do">보호동물</a>
							</td>
						</tr>
						<tr>
							<td class="text-center">
								<a class="nav-link" href="<%=myctx%>/animal.do">입양동물</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-9 text-left mt-1">
			<h1 class="text-center">보호동물 등록[: : : :]</h1>
			
			<form name="addAnim" id="addAnim" action="animInsert.do" method="POST"
				enctype="multipart/form-data">
				<table style="border:solid 2px;" class="table table-condensed table-bordered mt-1"
				bgcolor="skyblue">
					<thead>
						<tr class="bg-success text-white">
							<th colspan="4" class="text-center">
								<h3>: : : 등록  : : :</h3>
							</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td class="text-center" width="20%"><b>제목</b></td>
							<td width="30%"><input type="text" name="title"
								id="title" placeholder="String(제목)"></td>
							 
							<td rowspan="7" class="text-center" width="20%"><b>이미지</b></td>
							<td rowspan="7" width="30%">
							<input type="file" name="image" id="image" value="파일찾기" title="파일찾기"
							accept=".png,.jpg,.jpeg,.gif" onchange="preImg(this, 'img_view', 313, 320)">
							<div id="img_view" style="margin-top:5px;"></td>

						</tr>
						<tr>
							<td class="text-center" width="15%"><b>작성자</b></td>
							<td width="30%"><input type="text" name="name"
								id="name" placeholder="String(작성자)"></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>중성화여부</b></td>
							<td width="30%"><input type="text" name="trans"
								id="trans" placeholder="String(중성화여부)"></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>색상</b></td>
							<td width="30%"><input type="text" name="color"
								id="color" placeholder="String(색상)"></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>종류</b></td>
							<td width="30%"><input type="text" name="form"
								id="form" placeholder="int (1:개, 2:고양이, 3:기타)"></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>체중</b></td>
							<td width="30%"><input type="text" name="weight"
								id="weight" placeholder="String(체중)"></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>성별</b></td>
							<td width="30%"><input type="text" name="sex"
								id="sex" placeholder="String(성별)"></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>현황</b></td>
							<td width="30%"><input type="text" name="astate"
								id="astate" placeholder="숫자 1을 넣어주세요"></td>
									
							<td rowspan="1" class="text-center" width="15%"><b>발견날짜</b></td>
							<td rowspan="1" width="30%"><input type="text" name="indate"
								id="indate" placeholder="String(발견날짜)"></td>
						</tr>
						<tr>
							<td class="text-center" width="20%"><b>발견장소</b></td>
							<td width="30%"><input type="text" name="addr"
								id="addr" placeholder="String(발견장소)"></td>
								
							<td rowspan="1" class="text-center" width="20%"><b>보호센터</b></td>
							<td rowspan="1" width="30%"><input type="text" name="center"
								id="center" placeholder="String(보호중인 센터)"></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>보호장소</b></td>
							<td colspan="2" width="30%"><input type="text" name="protect"
								id="protect" placeholder="예) 서울시 강남구 테헤란로"></td>
								
							<td colspan="1" class="text-center">
								<button type="button" onclick="addrCheck()"
								class="btn btn-info">주소검색</button></td>
						</tr>
						<tr>
							<td class="text-center" width="15%"><b>연락처</b></td>
							<td colspan="2" width="30%"><input type="text" name="tel"
								id="tel" placeholder="String(연락처)"></td>
							<td colspan="1" class="text-center">
								<button class="btn btn-success" onclick="accept()">글작성</button>
							</td>
						</tr>
					</tbody>
				</table>
			
		</div>
	</div>
</div>
<script>
	
</script>

<jsp:include page="/foot.jsp" />






