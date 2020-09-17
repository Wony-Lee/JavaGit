<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String myctx = request.getContextPath();
%>
<jsp:include page="/top.jsp" />

<div class="col-md-12">
	<div class="row">
		<div class="col-md-3 text-left mt-3" style="height:1610px; border:solid 2px;">
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
		<div class="col-md-9 text-left mt-3" style="height:1610px; border:solid 2px;">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"><h2>보호중 동물</h2></a></li>
				<li class="text-right"><a class="nav-link" href="<%=myctx%>/anim1InputForm.do"><h3>글작성</h3></a></li>
			</ul>
			
			<form name="addAnim" id="addAnim" action="animInsert.do" method="POST"
				enctype="multipart/form-data">
				<table style="height:750px; border:solid 5px;" class="table table-condensed table-bordered mt-1">
					<thead>
						<tr class="text-black">
							<th colspan="4" class="text-center">
								<jsp:include page="/Animal/form.jsp" />
							</th>
						</tr>
					</thead>
				</table>
			
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp" />