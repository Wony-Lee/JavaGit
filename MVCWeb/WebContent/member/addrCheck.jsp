<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,user.domain.*,user.persistence.*"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="addrDao" class="user.persistence.AddrDAO"
	scope="session" />
<%
	String apStr = request.getParameter("apage");
	if(apStr ==null)
	{
		apStr="1";
	}
	int apage = Integer.parseInt(apStr.trim());
	if(apage<=0)
	{
		apage=1;
	}
%>
<div class="container">

	<%
		String method = request.getMethod();
	if (method.equalsIgnoreCase("GET"))

	{
	%>
	<div class="row p-3">
		<div class="col-md-10 offset-md-1">
			<form name="adc" action="addrCheck.jsp" method="POST">
				<label>주소 : </label> <input type="text" name="addr"
					class="form-control m-3" placeholder="주소 입력" autofocus="autofocus">
				<button class="btn btn-outline-primarty m-1">확인</button>
			</form>
		</div>
	</div>
	<%
		} else {
		//post 방식의 요청일 경우 => 주소 사용 가능 여부를 알려줌.
		String addr = request.getParameter("addr");
		//out.println(addr);
		
		String search = request.getParameter("addr");
		AddrDAO adao = new AddrDAO();
		ArrayList<AddrVO> avo = adao.searchAddr(search);
	%>
	<div class="row">
		<div class="col-md-10 offset-md-1">
			<table class="table table-striped mt-2">
				<h4>검색[<span style="font-weight: bold; color: red"><%=addr%></span>]
				</h4>
				<!-- <button class="btn btn-warning" onclick="setAddr('<%=addr%>')">확인</button> -->
				<div class="row p-3">
					<div class="col-md-10 offset-md-1">
						<form name="adc" action="addrCheck.jsp" method="POST">
							<label>주소 : </label> <input type="text" name="addr"
								class="form-control m-3" placeholder="Addr"
								autofocus="autofocus">
							<button class="btn btn-outline-primary m-1">확인</button>
						</form>
					</div>
				</div>


				<tr>
					<th>우편번호</th>
					<th>시도명</th>
					<th>도로명</th>
					<th>지번</th>
					<th>확인</th>
				</tr>
				<%--
				int totalCount = addrDao.getTotalUserCount();
				int pageSize = 5;
				int pageCount = 1;
				
				pageCount = (totalCount - 1)/pageSize+1;
				if(apage>pageCount)
				{
					apage = pageCount; // 마지막 페이지를 보여줌
				}
				// DB에서 끊어오기 위한 시작값과 끝 값.
				
				int end = apage*pageSize;
				int start = end - (pageSize - 1);
				
				List<addrVO> arr = addrDao --%>
				<%
				if (avo != null) {
					for (AddrVO advo : avo) {
						int post = advo.getNew_post_code();
						String sido = advo.getSido_kor();
						String doro = advo.getDoro_kor();
						int jb1 = advo.getJibeon_bonbeon();
						int jb2 = advo.getJibeon_bubeon();
				%>
				<tr onclick="setAd('<%=post%>','<%=sido%> <%=doro%> <%=jb1%>-<%=jb2%>')">
					<td><%=post%></td>
					<td><%=sido%></td>
					<td><%=doro%></td>
					<td><%=jb1%>-<%=jb2%></td>
					<td><button onclick="setAddr">확인</button></td>
				</tr>
				<%
					}
				}
				%>
			</table>
			<%
			}
			%>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var setAd = function(post, juso)
	{
		opener.document.f.post.value = post;
		opener.document.f.juso.value = juso;
	}
<%--	var setAddr = function(addr) {
		//부모창(opener ==> window 객체)의 addr 텍스트 박스에 addr 값을 넣어줌.
		opener.document.f.addr.value = addr;
		opener.document.f.flag.value = true;			//팝업창 닫기
		self.close();
} --%>
	</script>