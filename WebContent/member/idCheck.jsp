<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.vo.MemberBean"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String openInit = "false";
	if (request.getParameter("openInit") != null) {
		openInit = request.getParameter("openInit");
	}
	String id = request.getParameter("id");
	MemberBean member = (MemberBean) request.getAttribute("member");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<script>
	function init() {
		if (<%=openInit%>) {
			document.getElementById("id").value = opener.document.getElementById("id").value;
		}
	}

	function ok(v) {
		opener.idcheck = v.trim();
		opener.document.getElementById("id").value = v;
		opener.chkId = true;
		window.close();
	}
</script>
</head>
<h1>아이디 중복 확인</h1>
<body onload="init()">
	<form action="idcheckPro.mem" method="post" name=f>
		<input type=text name=id id=id> <input type=submit value="중복확인">
	</form>
	<%
		if(member != null) {
			out.println("");
		} else if(id != null) {
			out.println("<h3>"+ id +" 는 사용 가능한 아이디 입니다. <a href='#'onclick=\"ok('"+ id +"')\">사용하기</a></h3>");
		}
	%>
</body>
</html>