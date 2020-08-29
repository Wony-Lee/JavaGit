<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/example/myerror.jsp" %>
<%	request.setCharacterEncoding("UTF-8");%>    


<jsp:useBean id="user" class="user.model.MemberVO" scope="page" />

<jsp:setProperty name="Member" property="*"/>	

<jsp:useBean id="userDao" class="youhu.parsistence.MemberDAO" scope="session"/>
<% 

    int n=0;
	
        n=userDao.insertMember(user);

	String msg=(n>0)?"회원가입 성공":"실패";
	String loc=(n>0)?"members.jsp":"javascript:history.back()";
%>
<script type="text/javascript">
<!--
	alert('<%=msg%>');
	location.href='<%=loc%>';
//-->
</script>
