<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.model.*"%>
<%-- 로그인 여부를 체크하는 모듈. 회원들만 사용하는 페이지에 이 모듈을 include한다. --%>
<%
MemberVO member=(MemberVO)session.getAttribute("loginUser");
	  String ctx=request.getContextPath(); // /MyWeb	
	  if(member==null){
		  %>
		  <script>
		  		alert('로그인 후 이용해주세요.');
		  		location.href="<%=ctx%>/login.ao";
		  </script>
		  <%
		  return;
	  }
	  
	  if(member.getState()==1){
		  %>
		  <script>
		  		alert('정지회원 입니다. 일반회원으로 전환해야 이용가능합니다.\n회원정보를 수정하세요');
		  		location.href="<%=ctx%>/MyPage.ao";
		  </script>
		  <%
		  return;
	  }
%>




