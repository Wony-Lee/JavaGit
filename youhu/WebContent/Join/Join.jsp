<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("UTF-8"); %>
<!-- 회원가입  -->
<jsp:include page="/top.jsp"/>
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Bootstrap -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> -->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via  -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script type="text/javascript">
     var find=null;
        function chicking(){
          a.ch.value="false";
          find=window.open("idCheck.do","idCheck","width=500,height=500,top=100,left=100");
        	
        }
	 

$(function(){
	$('#joinUp').click(function(){
		if(!$('#name').val()){
			alert('이름을 확인해주세요.');
			$('#name').focus();
			return false;
		}
		if(!$('#id').val()){
			alert('아이디를 확인해주세요.');
			$('#id').focus();
			return false;
		}
		if(!$('#pwd').val()){
			alert('비밀번호를 확인해주세요.');
			$('#pwd').focus();
			return false;
		}
		if(!$('#tel').val()){
			alert('연락처를 확인해주세요.');
			$('#tel').focus();
			return false;
		}
		if(!$('#addr1').val()){
			alert('주소를 입력해주세요.');
			$('#addr1').focus();
			return false;
		}
		if(!$('#addr2').val()){
			alert('상세주소를 입력해주세요.');
			$('#addr2').focus();
			return false;
		}
	})
	
})

function openDaumZipAddress() {

	new daum.Postcode({

		
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=post]").val(data.zonecode);
                $("[name=addr1]").val(fullRoadAddr);
                
                jQuery("#addr2").focus();

                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }


</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


  <h1 class="text-primary m-4 text-center">회원가입</h1>
   <form name="a" action="JoinEnd.do" method="post">
   <div class="border solid 1px">
   	<div class="row m-3">
			<div class="col-md-3 text-right">
			<label for="email"><span class="glyphicon glyphicon-user "></span> 이름</label>
			</div>			
			<div class="col-md-5">
				<input type="text" name="name" id="name" placeholder="Name" class="form-control"
				>
			</div>
		</div>
		
		<div class="row m-3">
			<div class="col-md-3 text-right">
			<label for="email"><span class="glyphicon glyphicon-user "></span> 아이디</label>
			</div>			
			<div class="col-md-5">
				<input type="text" name="id" id="id"
				 placeholder="User ID" class="form-control">
				 <!-- hidden data -------------- -->
				 <input type="hidden" name="ch" value="false">
				 <!-- -------------------------- -->
			</div>
			<div>
			  <button type="button" onclick="chicking()" class="btn btn-info">아이디 중복 확인</button>
			</div>
			
		</div>
		
		<div class="row m-3">
			<div class="col-md-3 text-right">
			<label for="email"><span class="glyphicon glyphicon-lock "></span> 비밀번호</label>
			</div>			
			<div class="col-md-5">
				<input type="password" name="pwd" id="pwd"
				 placeholder="Password" class="form-control">
			</div>
		</div>
		
		<div class="row m-3">
			<div class="col-md-3 text-right">
			<label for="email"><span class="glyphicon glyphicon-phone "></span> 연락처</label>
			</div>			
			<div class="col-md-5">
				<input type="text" name="tel" id="tel" maxlength="11"
				 placeholder="HP1" class="form-control">
			</div>
			
		</div>
		<div class="row m-3">
		  <div class="col-md-3 text-right" >
		   <label for="sex"><span class="glyphicon glyphicon-toilet"></span>성별</label>
		   </div>
		   <div class="col-md-5">
		   남성 <input type="radio" name="sex" value="1" checked />
		   여성 <input type="radio" name="sex" value="2" checked />
		 
		  </div>
		
		</div>
		
		<div class="row m-3">
			<div class="col-md-3 text-right">
			<label for="email"><span class="glyphicon glyphicon-post "></span> 우편번호</label>
			</div>			
			<div class="col-md-5">
				<input type="text" name="post" id="post" maxlength="5"
				 placeholder="Post" class="form-control" readonly>
			</div>
			<div class="col-md-3">
				<button type="button" onClick="openDaumZipAddress();" class="btn btn-info">우편번호 찾기</button>
			</div>
		</div>
		
		<div class="row m-3">
			<div class="col-md-3 text-right">
			<label for="email"><span class="glyphicon glyphicon-home "></span> 주소</label>
			</div>			
			<div class="col-md-5">
				<input type="text" name="addr1" id="addr1" placeholder="Address1"
				 class="form-control"><p></p>
				 <input type="text" name="addr2" id="addr2" placeholder="Address2"
				 class="form-control">
				 
			</div>
		</div>
		<div class="row m-3">
            <div class="col-md-3 text-right">	
            <label for="email"><span class="glyphicon glyphicon-envelope"></span> 이메일</label>
		 </div>
		  <div class="col-md-5">
		    <input type="text" name="email" id="email" placeholder="Email" class="form-control">
   			<input type="text" name="state" id="state" class="form-control" readonly value="0">
		    </div>
		    
		  </div>
		  
		
		
		<div class="row m-3">
			<div class="col-md-12 text-center">
				<button type="submit" class="btn btn-primary" id="joinUp" name="joinUp">회원가입</button>
				<button type="reset" class="btn btn-danger">다시쓰기</button>
			</div>
		</div>
   
     </div>
   
   </form>

<jsp:include page="/foot.jsp"/>