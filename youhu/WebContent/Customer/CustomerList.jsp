<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/top.jsp" />

<script type="text/javascript"
src="http://ajax.googleapis.com/ajax/libs/
jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
 $(function(){
			    
	 $('#a1').hide();
	 
	 $('#q1').click(function(){
         
		 if($(this).next().css('display')=='none'){
             $('#a1').slideUp();
             //$(this).next().slideDown(1000);
             $('+#a1',this).slideDown();
         }
         else if($('#a1').not().hide()){
        	 $('#a1').hide();
         }
     })
  })
</script>

<style>
#FAQ {
	font-size: 20px;
	font-weight: bold;
}
</style>
<div class="container">
	<div class="row">
		<p></p>
		<div class="col-md-2">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link" href="appList.do">FAQ</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="ReviewList.do">호에엑</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="BoardList.do">1:1
						문의</a></li>
			</ul>
		</div>
		<div class="col-md-10">
			<div class="text-center" id="FAQ">FAQ</div>
			<hr color="black">
			<div class="row">
				<div class="col-md-5">asd</div>
				<div class="col-md-5">dsa</div>
			</div>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<table class="table">
				<tr>
					<th colspan="8" class="text-center">자주물어봄</th>
				</tr>
				<tr>
					<td></td>
					<td colspan="7">저도모름1</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<jsp:include page="/foot.jsp" />