<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/top.jsp"/>
<p></p>
<div class="container">
	<div class="col-md-12">
		<div class="row">

				<!-- nav start -->
				<div class="col-md-2">
					<ul class="nav flex-column">
					  <li class="nav-item">
					    <a class="nav-link" href="../Application/Application.jsp">봉사신청</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="../Review/Review.jsp">분양후기</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="Board.jsp">자유게시판</a>
					  </li>
					</ul>
				</div>
				<!-- nav end -->
				<div class="col-md-10">
					<table class="table table-hover">
						<tr>
							<th class="text-center" colspan="4">
							<h2>게시글 작성</h2></th>
						</tr>
						<tr>
							<td class="text-right m" style="vertical-align: middle;">제목 :</td>
							<td><input class="form-control" placeholder="subject" readonly></td>
							<td class="text-right m" style="vertical-align: middle;">작성자 :</td>
							<td><input class="form-control" placeholder="Name" readonly></td>
						</tr>
						<tr>
							<td colspan="4"><textarea class="form-control" cols="4" rows="15"
							placeholder="Content" readonly></textarea>
						</tr>
						<tr>
							<td class="text-right" colspan="2">
							<button type="button" class="btn btn-outline-success">수정</button></td>
							<td class="text-left" colspan="2">
							<button type="button" class="btn btn-outline-danger">목록으로</button></td>
						</tr>
					</table>
				</div>
				
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp"/>