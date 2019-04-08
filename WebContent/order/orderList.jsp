<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="../menubar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<style>
table {
	width : 650px;
	margin : auto;
}

h1 {
	text-align : center;
}
</style>
</head>
<body>
<h1>내 주문리스트</h1>
<table>
<tr>
	<td>상품 이미지</td>
	<td>상품명</td>
	<td>가격</td>
	<td>수량</td>
	<td>총 가격</td>
<c:forEach var="orderList" items="${orderList }" varStatus="status">
	<tr>
		<td><img src="../image/item/${orderList.item_image }" width="100px" height="80px"/></td>
		<td id="leftalign"><a href="../item/item_detail.item?item_name=${orderList.item_name }">${orderList.item_name }</a></td>
		<td><fmt:formatNumber value="${orderList.price }" type="number"/>원</td>
		<td>${orderList.amount }개</td>
		<td><fmt:formatNumber value="${orderList.price*orderList.amount }" type="number"/>원</td>
	</tr>
</c:forEach>
</table>
</body>
</html>