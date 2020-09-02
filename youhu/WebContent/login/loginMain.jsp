<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../top.jsp"/>

		<form name="mainF" id="mainF" action="main.jsp">
				<div id="carousl_main" class="carousel slide" data-ride="carousel" 
		    data-interval="2000">
		        <!-- data-interval속성을 주면 자동으로 슬라이딩이 된다. -->
		
		        <!-- Indicators -->
		        <ul class="carousel-indicators">
		          <li data-target="#demo" data-slide-to="0" class="active"></li>
		          <li data-target="#demo" data-slide-to="1"></li>
		          <li data-target="#demo" data-slide-to="2"></li>
		        </ul>
		      
		        <!-- The slideshow -->
		        <div class="carousel-inner">
		          <div class="carousel-item active">
		            <img src="images/a.png" alt="Los Angeles" style="width:100%">
		          </div>
		          <div class="carousel-item">
		            <img src="images/b.png" alt="Chicago" style="width:100%">
		          </div>
		          <div class="carousel-item">
		            <img src="images/c.png" alt="New York" style="width:100%">
		          </div>
		        </div>
		      
		        <!-- Left and right controls -->
		        <a class="carousel-control-prev" href="#demo" data-slide="prev">
		          <span class="carousel-control-prev-icon"></span>
		        </a>
		        <a class="carousel-control-next" href="#demo" data-slide="next">
		          <span class="carousel-control-next-icon"></span>
		        </a>
		      </div> <!-- image end -->
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
						 	<div id="carousl_bot" class="carousel slide" data-ride="carousel" 
			    data-interval="2000">
				        <!-- data-interval속성을 주면 자동으로 슬라이딩이 된다. -->
				
				        <!-- Indicators -->
				        <ul class="carousel-indicators">
				          <li data-target="#demo" data-slide-to="0" class="active"></li>
				          <li data-target="#demo" data-slide-to="1"></li>
				          <li data-target="#demo" data-slide-to="2"></li>
				        </ul>
				      
				        <!-- The slideshow -->
				        <div class="carousel-inner">
				          <div class="carousel-item active">
				            <img src="images/a1.jpg" alt="a1" style="width:100%">
				          </div>
				          <div class="carousel-item">
				            <img src="images/b1.jpg" alt="b1" style="width:100%">
				          </div>
				          <div class="carousel-item">
				            <img src="images/c1.jpg" alt="c1" style="width:100%">
				          </div>
				        </div>
				      
				        <!-- Left and right controls -->
				        <a class="carousel-control-prev" href="#demo" data-slide="prev">
				          <span class="carousel-control-prev-icon"></span>
				        </a>
				        <a class="carousel-control-next" href="#demo" data-slide="next">
				          <span class="carousel-control-next-icon"></span>
				        </a>
				      </div> <!-- image end -->
					</div>
				</div>
			</div>
			<p></p>
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<img src="images/a2.jpg" class="img-responsive"style="width:100%">
						<div class="carousel-caption"><h2>끝</h2></div>
					</div>
		
					<div class="col-md-3">
						<img src="images/b2.jpg" class="img-responsive" style="width:100%">
						<div class="carousel-caption"><h2>끝</h2></div>
					</div>
		
					<div class="col-md-3">
						<img src="images/c2.jpg" class="img-responsive" style="width:100%">
						<div class="carousel-caption"><h2>끝</h2></div>
					</div>
					<p></p>
					<div class="col-md-3">
						<img src="images/d2.jpg" class="img-responsive" style="width:100%">
						<div class="carousel-caption"><h2>끝</h2></div>
					</div>
				</div>
			</div>
		</form>

	
<jsp:include page="../foot.jsp"/>