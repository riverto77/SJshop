<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="item.vo.Item"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="admin_menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 상품 목록</title>
<style>

li ul {
	text-align : center;
}

section {
	position: relative;
	width: 80%;
	margin : auto;
	top : 20px;
	left : 80px;
	padding: 5px;
}
#container section:nth-child(odd) {
	background: #eee;
}
.page-title {
	position: absolute;
	top: 20px;
	left: 0;
	padding: 30px 50px;
}
.page-title h1 {
	margin-bottom: 30px;
}

.prod-list {
	list-style:none;
	text-decoration: none;
	margin:0;
	padding: 0px;
	position : relative;
}
.pord-list ,p {
	color : white;
	text-align : center;
	text-decoration: none;
}

.font-white {
	color : white;
	text-align : center;
}

.prod-list li {
	position: relative;
	float: left;
 	padding: 10;
	margin: 10px;
	overflow: hidden;
}
    .prod-list img {
		width: 300px;
		height: 280px;
      margin:0;
      padding:30px;
      float:left;
      z-index:5;
    }
	.prod-list .caption {
		position: absolute;
		margin-left: 30px;
		margin-top: 30px;
		top: 200px;
		width: 240px;
		height: 220px;
		padding-top: 0px;
		background: rgba(0, 0, 0, 0.4);
		text-decoration: none;
		opacity: 0;
		-moz-transition: all 0.2s ease-in-out;
		-o-transition: all 0.2s ease-in-out;;
		-webkit-transition: all 0.2s ease-in-out;
		transition: all 0.2s ease-in-out;
	}
	.prod-list li:hover .caption {
		opacity: 1;
		-moz-transform: translateY(-200px);
		-o-transform: translateY(-200px);;
		-webkit-transform: translateY(-200px);
		transform: translateY(-200px);
	}
	.caption {
		font-size: 1.3em;
		color: white;
	}
	.content {
    	margin: 80px auto 10px;
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
		width: 90%;
    	padding: 20px;
    }

.center {
	position : relative;
	text-align : center;
	margin : auto;
	
}

.right {
	position : realtive;
	text-align : right;
	margin-right : 333px;
	margin-top : 30px;
}

/* 큰 분류 메뉴 */
input {
    vertical-align: middle;
}
input.form-text {
    border: 1px solid #bcbcbc;
    height: 28px;
}
#pageList {
	position: absolute;
	top: 1600px;
	left : 45%;
	margin : auto;
	width : 200px;
	font-size : 15px;
	margin-bottom : 100px;
}
.h2 {
	position : relative;
	left : 80px;
}

</style>
</head>
<body>
<form class="right" action="itemList.item" name="search" id="search" method="post">
				<select name="select">
					<option value="cpu">CPU</option>
					<option value="mainboard">Mainboard</option>
					<option value="vga">VGA</option>
					<option value="memory">Memory</option>
					<option value="power">Power</option>
					<option value="ssd">SSD</option>
					<option value="case">Case</option>
				</select>
			<input type="text" name="search" id="search"  />
			<input type="submit" value="검색">
</form>
<c:choose>
		<c:when test="${pageInfo.listCount>0 }">

<c:if test="${itemList != null }">
	
<section id="choice">
			<div id="container">
				<ul class="prod-list">
				<h2 class="h2"> 상품목록 </h2>
					<c:forEach var="itemList" items="${itemList }" varStatus="status">
					<li>
						<img src="../image/item/${itemList.item_image }" id="productImage" />
							<a href="../item/item_detail.item?item_code=${itemList.item_code }">
							<div class="caption">
							<input type="hidden" name="item_code" value=${itemList.item_code }">
								<h3 class="font-white">${itemList.item_name }</h2>
								<p>${itemList.comment1 } </p>
								<p>${itemList.comment2 } </p>
								<p>${itemList.comment3 } </p>
								<p><fmt:formatNumber value="${itemList.item_price }" pattern="#,###" /> 원</p></a>	
							</div>
						<ul><a href="itemModify.item?item_code=${itemList.item_code }">상품수정/삭제</a>&nbsp;&nbsp;&nbsp;</ul>
						<ul><a href="javascript:void(0)" onclick="window.open('../admin/itemStock.item?item_code=${itemList.item_code }&openInit=true','','width=600, height=260')">재고저장</a></ul>
					</li>
					
					</c:forEach>
				</div>
			
</section>
</c:if>
<section id="pageList">
<c:if test="${pageInfo.page<=1 }">
</c:if>
	<c:if test="${pageInfo.page>1 }">
		<a href="itemList.item?page=${pageInfo.page-1 }">[이전]</a>&nbsp;
	</c:if>
<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
	<c:choose>
		<c:when test="${a==pageInfo.page }">${a }</c:when>
	<c:otherwise>
		<a href="itemList.item?page=${a}">${a}</a>
	</c:otherwise>
	</c:choose>
</c:forEach>
<c:choose>
	<c:when test="${pageInfo.page>=pageInfo.maxPage }">[다음]</c:when>
	<c:otherwise>
		<a href="itemList.item?page=${pageInfo.page+1 }">[다음]</a>
	</c:otherwise>
</c:choose>
</c:when>
	<c:otherwise>
		<h2 class="center">상품이 존재하지 않습니다.</h2>
	</c:otherwise>
</c:choose>
</section>

</body>
</html>