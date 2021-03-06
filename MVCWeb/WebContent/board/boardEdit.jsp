<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp" />

<div class="text-left p-5">
	<h1 class="text-center">MVC Board Edit</h1>
	<p class="text-center">
		<a href="write.do">글쓰기</a>|<a href="list.do">글목록</a>
	</p>
	<!--  파일업로드. 메소드는 post, enctype 은 multipart/form-data 
	첨부파일 데이터가 서버에 함께 전송된다. 
	nctype="multipart/form-data-->
	<form name="bf" id="bf" action="editEnd.do" method="post"
	enctype="multipart/form-data">
		<table class="table table-bordered">
			
			<tr>
				<th style="width:20">글번호</th>
				<td style="width:80%">
					<input type="text" name="idx" id="idx" value="${board.idx}" readonly placeholder="Idx" class="form-control">
				</td>
			</tr>
			
			<tr>
				<th style="width:20">제목</th>
				<td style="width:80%">
					<input type="text" name="subject" id="subject" value="${board.subject}" placeholder="Subject" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td style="width:20">글쓴이</td>
				<td style="width:80%">
					<input type="text" name="name" id="name" value="${board.name}" placeholder="Name" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td style="width:20">글내용</td>
				<td style="width:80%">
					<textarea rows="10" cols="50" name="content" id="content" placeholder="Content" class="form-control">${board.content}</textarea>
				</td>
			</tr>
			
			<tr>
				<td style="width:20">비밀번호</td>
				<td style="width:80%">
					<input type="password" name="pwd" id="pwd" placeholder="Password" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td style="width:20">첨부파일</td>
				<td style="width:80%">
					${board.originFilename} [${board.filesize} bytes]<br>
					<!-- hidden data-------------------------- -->
					<input type="hidden" name="old_filename" value="${board.filename}">
					<!-- ------------------------------------- -->
					<input type="file" name="filename" id="filename" placeholder="Attach File" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" class="text-center">
					<button class="btn btn-success" id="btnWrite">글수정</button>
					<button type="reset" class="btn btn-warning" id="btnReset">다시쓰기</button>
				</td>
			</tr>
			
		</table>
	</form>
</div>
<script>
	$(function(){
		$('#bf').on('submit',function(e){
			//e.preventDefault();
			if(!$('#subject').val()){
				alert('글제목을 입력하세요.')
				$('#subject').focus();
				return false;
			}
		
			if(!$('#name').val()){
				alert('작성자 이름을 입력하세요.')
				$('#name').focus();
				return false;
			}
			
			if(!$('#pwd').val()){
				alert('비밀번호를 입력하세요.')
				$('#pwd').focus();
				return false;
			}
		})
	})
</script>

<jsp:include page="/foot.jsp" />