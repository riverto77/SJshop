<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="item.vo.Stock"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
<style>
table {
	border : 1px solid skyblue;
	width : 550px;
	height : 130px;
	margin : auto;
	text-align : center;
	font-size : 15px;
}

h2 {
	text-align : center;
}

</style>
</head>
<body>
<form action="itemStockPro.item" method="post">
<h2>재고저장</h2>
<table>
	<tr>
		<td>상품이름</td>
		<td>재고량</td>
		<td>비고</td>
	</tr>
	<tr>
		<td><input type="hidden" name="item_code" value="${item.item_code }">
			<input type="hidden" name="item_name" value="${item.item_name }">${item.item_name }</td>
		<td><input type="text" size=1 name="item_stock" value="${item.item_stock }">개</td>
		<td><button type="submit">저장</button></td>
	</tr>
</table>
</form>
</body>
</html>