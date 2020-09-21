<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="top.jsp" />
<style>
#app1 {
	text-align: left;
}

#app {
	text-align: right;
}
h2{
	color:black;
}
.p{
	font-weight:bold;
	text-align:center;
	font-size:30px;
}
</style>
<form name="demo" id="mainF" action="main.jsp">
	<div id="demo" class="carousel slide" data-ride="carousel">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/a.png" alt="Los Angeles" style="width: 100%">
			</div>
			<div class="carousel-item">
				<img src="images/b.png" alt="Chicago" style="width: 100%">
			</div>
			<div class="carousel-item">
				<img src="images/c.png" alt="New York" style="width: 100%">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<!-- image end -->
	<p></p>
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-6">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center">공지사항</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>a</td>
						</tr>
						<tr>
							<td>b</td>
						</tr>
						<tr>
							<td>c</td>
						</tr>
						<tr>
							<td>d</td>
						</tr>
						<tr>
							<td>e</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center" colspan="2">입양후기</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${appList ne null and not empty appList}">
							<c:forEach var="al" items="${appList}" begin="1" end="5">
								<tr>
									<td id="app1">신청자 : <a href="appView.do?aidx=${al.aidx}">${al.name}</a></td>
									<td id="app2">날짜 : ${al.wdate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<!-- table end -->
		</div>
	</div>
	<p></p>
	<p class="p">개</p> <!-- ------------------------------------------------------- -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<c:if test="${dogList ne null and not empty dogList}">
					<c:forEach var="dog" items="${dogList}" begin="0" end="0">
						<img src="images/${dog.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${dog.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
				<c:if test="${dogList ne null and not empty dogList}">
					<c:forEach var="dog" items="${dogList}" begin="1" end="1">
						<img src="images/${dog.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${dog.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
				<c:if test="${dogList ne null and not empty dogList}">
					<c:forEach var="dog" items="${dogList}" begin="2" end="2">
						<img src="images/${dog.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${dog.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
				<c:if test="${dogList ne null and not empty dogList}">
					<c:forEach var="dog" items="${dogList}" begin="3" end="3">
						<img src="images/${dog.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${dog.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<p></p>
	<p class="p">고양이</p> <!-- --------------------------------------------------- -->
		<div class="container">
		<div class="row">
			<div class="col-md-3">
				<c:if test="${catList ne null and not empty catList}">
					<c:forEach var="cat" items="${catList}" begin="0" end="0">
						<img src="images/${cat.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${cat.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
				<c:if test="${catList ne null and not empty catList}">
					<c:forEach var="cat" items="${catList}" begin="1" end="1">
						<img src="images/${cat.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${cat.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
				<c:if test="${catList ne null and not empty catList}">
					<c:forEach var="cat" items="${catList}" begin="2" end="2">
						<img src="images/${cat.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${cat.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3">
				<c:if test="${catList ne null and not empty catList}">
					<c:forEach var="cat" items="${catList}" begin="3" end="3">
						<img src="images/${cat.image}" class="img-responsive"
							style="width: 100%; height: 100%">
						<div class="carousel-caption">
							<h2>${cat.name}</h2>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	
</form>


<jsp:include page="foot.jsp" />