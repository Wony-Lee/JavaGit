<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Login Page</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
<script type="text/javascript">

</script>


<style>
	.login-form {
		max-width: 400px;
		width:100%;
		margin: 40px auto;
	}
    .login-form form {        
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .login-btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .form-page2-group.user {
        font-size: 18px;
    }
    .login-btn {
        font-size: 15px;
        font-weight: bold;
    }
  
   
</style>
</head>
<body>
   <div class="login-form">
     <form name="login" id="login" action="main.do" method="post">
       <h2 class="text-center">로그인</h2>
          <div class="form-page">
             <div class="form-page2">
                <span class="form-page2-group"><a class="userid userid-user"></a></span>
               <input type="text" class="form-control" name="id" id="id" placeholder="ID" required="required"
              oninvalid="this.setCustomValidity('아이디를 입력해주세요.')" 
              onchange="this.setCustomValidity('')" >
               
             </div>
          
          </div> 
     
     <div class="form-page">
             <div class="form-page2">
                <span class="form-page2-group"><a class="pwd pwd-lock"></a></span>
               <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password" required="required"
               oninvalid="this.setCustomValidity('비밀번호를 입력해주세요.')" 
              onchange="this.setCustomValidity('')"
               >
             </div>
          
          </div> 
          
      <div class="form-page2 m-2">
      <button type="submit" id="btlogin"  class="btn btn-outline-primary login-btn btn-block">로그인</button>
     
     <a href="Join.do">
     <button type="button" id="btjoin" class="btn btn-outline-primary signup-btn btn-block">회원가입</button>
     </a>
      </div>
     
      <div class="chicking">
    
         <label class="pull-left">
         <input type="checkbox">아이디 저장하기</label>
         <br>
        <a href="#" class="pull-center">아이디 찾기</a>
        <a href="#" class="pull-right">비밀번호 찾기</a>
      </div>
      
      
     </form>
   
   
   </div>
</body>
</html>
<script>

</script>
<jsp:include page="/foot.jsp" />	