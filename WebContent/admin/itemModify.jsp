<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="item.vo.Item"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="admin_menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
</head>
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
input[type="password"],
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

.form button {
   font-family:"Nanum Gothic";
   font-weight: 700;
   text-transform: uppercase;
   outline: 0;
   background-color: gray;
   border: 0;
   padding: 13px;
   color: #FFFFFF;
   font-size: 16px;
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
	float : left;
}

</style>
<body>
<c:if test="${id == 'admin' }">
<section class="form">
		<h2 style="text-align:center">상품 수정</h2>
		<form action="itemModifyPro.item" method="post" enctype="multipart/form-data" name="itemModify">
			<table class="wrap">
				<tr>
					<td><label for="item_name">상품이름</label></td>
					<td class="td_right"><input type="text" size="40" name="item_name" id="item_name" value="${item.item_name }" /></td>
				</tr>
				<tr>
					<td><label for="item_name">상품코드</label></td>
					<td class="td_right"><input type="text" name="item_code" id="item_code" value="${item.item_code }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="item_price">상품가격</label></td>
					<td class="td_right"><input type="text" name="item_price" id="item_price" value=${item.item_price } /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="item_company">제조사</label></td>
					<td class="td_right"><input type="text" name="item_company" id="item_company" value=${item.item_company } /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="category">상품종류</label></td>
					<td class="left">
					<select name="category">
						<option>${item.category }</option>
						<option value="cpu">CPU</option>
						<option value="mainboard">Mainboard</option>
						<option value="vga">VGA</option>
						<option value="memory">Memory</option>
						<option value="power">Power</option>
						<option value="ssd">SSD</option>
						<option value="case">Case</option>
					</select></td>
				</tr>
				<tr>
					<td class="td_left"><label for="comment1">상품설명1</label></td>
					<td class="td_right"><textarea id="comment1" name="comment1" cols="21" rows="3" />${item.comment1 }</textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="comment2">상품설명2</label></td>
					<td class="td_right"><textarea id="comment2" name="comment2" cols="21" rows="3" />${item.comment2 }</textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="comment1">상품설명3</label></td>
					<td class="td_right"><textarea id="comment3" name="comment3" cols="21" rows="3" />${item.comment3 }</textarea></td>
				</tr>
				<tr>
					<td class="td_left"><label for="item_image">상품이미지</label></td>
					<td class="td_right"><input name="item_image" type="file" id="item_image" value="${item.item_image }" /></td>
				</tr>
				<tr>
					<td class="td_left"><label for="item_image">상품설명이미지</label></td>
					<td class="td_right"><input name="item_detail.image" type="file" id="item_detail.image" value="${item.item_detail_image }" /></td>
				</tr>
			</table>		
				<button class="input100" type="submit">수정하기</button>&nbsp;&nbsp;
				<button class="input100" type="submit" onclick="javascript: form.action='itemDelete.item';">상품삭제</button>
				
		</form>
	</section>
</c:if>
</body>
</html>