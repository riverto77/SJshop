<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String openInit="false";
	String code = "false";
	String item_code = null;
	if(request.getParameter("openInit")!=null){
		openInit = "true";
	}
	if((String)request.getAttribute("item_code")!=null){
		code = "true";
		item_code = (String)request.getAttribute("item_code");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품코드 생성</title>
<style>

.form {
 	top : 130px;
	text-align: center;
   	position: relative;
   	z-index: 1;
   	border-radius: 20px;
   	border : 3px solid gray;
   	background-color: #D8D8D8;
   	max-width: 550px;
   	margin : auto;
   	bottom : 100px;
   	padding: 10px 45px 45px 45px;
   	margin-bottom : 100px;
}

input[type="text"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="time"],
input[type="url"],
input[type="button"],
input[type="file"],
textarea,
select {
	border-bottom: 2px solid #00A5FF;
	border-radius: 16px;
}

.input100 {
   width: 30%;
   margin : auto;
   text-align : center;
   border-radius: 16px;
}   

.form input {
   outline: 0;
   background-color: white;
   border-bottom: 2px solid #00A5FF;
   border-top: none;
   border-left: none;
   border-right: none;
   margin: 0 0 15px;
   padding: 15px;
   box-sizing: border-box;
   font-size: 14px;
}

button {
   font-family:"Nanum Gothic";
   font-weight: 700;
   text-transform: uppercase;
   outline: 0;
   background-color: white;
   border: 0;
   padding: 13px;
   border-radius: 20px;
   border-top : 1px solid #00A5FF;
   border-bottom: 2px solid #00A5FF;
   color: black;
   font-size: 14px;
   -webkit-transition: all 0.3 ease;
   transition: all 0.3 ease;
   cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
   background: #c0c0c0;
}

.form a {
   margin: 15px 0 0;
   font-size: 12px;
   font-color: blue;
   text-decoration: none;
}

#footer{
   text-align:center;
   font-size: 12px;
   color: #4CAF50;
}

body {
	width : 95%;
	height : 1000px;
}

label {
	font-weight: bolder;
}
</style>
<script>
function init() {
	if (<%=openInit%>) {
		document.getElementById("item_code").value = opener.document.getElementById("item_code").value;
	}
}

function ok(v) {
	opener.idcheck = v.trim();
	opener.document.getElementById("item_code").value = v;
	opener.chkId = true;
	window.close();
}
</script>
</head>
<body onload='init()'>
<form action="itemCodeCreate.item" method="post" name="codeCreate">
<table id="addRow">
	<tr>
		<td><h3>상품코드 생성</h3></td>
	</tr>
	<tr>
		<td class="td_left"><label for="category">상품종류</label>
		<select name="category">
			<option value="cpu">CPU</option>
			<option value="mainboard">Mainboard</option>
			<option value="vga">VGA</option>
			<option value="memory">Memory</option>
			<option value="power">Power</option>
			<option value="ssd">SSD</option>
			<option value="case">Case</option>
		</select>
		<button type=submit value="코드생성">코드생성</button>
		</td>
	</tr>
	<tr>
		<td>
		<%
		if(item_code == null) {
			out.println("");
		} else {
			out.println("<h3>"+ item_code +" 는 사용 가능한 코드 입니다. <a href='#'onclick=\"ok('"+ item_code +"')\">사용하기</a></h3>");
		}
		 %>
		</td>
	</tr>
</table>
</form>
</body>
</html>