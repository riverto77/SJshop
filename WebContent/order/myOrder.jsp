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
<title>내 주문 목록</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Amarante');

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  text-align : center;
}
html { overflow-y: scroll; }
body { 
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 14px;
  color: #585858;
  padding-bottom: 55px;
}

::selection { background: #5f74a0; color: #fff; }
::-moz-selection { background: #5f74a0; color: #fff; }
::-webkit-selection { background: #5f74a0; color: #fff; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
  font-size : 16px;
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; width : 1200px; font-size : 16px;  }
img { border: 0; max-width: 100%; }

.h1 { 
  font-family: 'Amarante', Tahoma, sans-serif;
  font-weight: bold;
  font-size: 1.7em;
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
}


/** page structure **/
#wrapper {
  display: block;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
  width : 1400px;
}

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 15px;
}


#keywords thead {
  cursor: pointer;
  background: #c9dff0;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url('https://i.imgur.com/SP99ZPJ.png');
}
#keywords thead tr th.headerSortDown span {
  background-image: url('https://i.imgur.com/RkA9MBo.png');
}


#keywords tbody tr { 
  color: #555;
}
#keywords tbody tr td {
  text-align: center;
  padding: 15px 10px;
}
#keywords tbody tr td.lalign {
  text-align: left;
}

#pageList {
	position:relative;
	margin : auto;
	width : 500px;
	font-size : 15px;
	text-align : center;
	margin-bottom : 40px;
}

.search {
	position : relative;
	margin : auto;
	text-align : center;
}

</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SJ Shop</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/owl.carousel.css">
    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<br><br>
<div id="wrapper">
<form method="post">
<h1 class="h1">내 주문목록</h1><br><br>
<c:choose>
<c:when test="${myOrder != null }">
<table id="keywords" cellspacing="0" cellpadding="0">
<thead>
    <tr>
	<td><span>주문번호</span></td>
	<td><span>상품 이미지</span></td>
	<td><span>상품명</span></td>
	<td><span>가격</span></td>
	<td><span>수량</span></td>
	<td><span>총 가격</span></td>
	<td><span>주문날짜</span></td>
	<td><span>주문취소</span></td>
	</tr>
	</thead>
    <tbody>
	<c:forEach var="orderList" items="${myOrder }" varStatus="status">
	<tr>
		<td><input type="hidden" name="item_code" value="${orderList.item_code }">
		<input type="hidden" name="detail_num" value="${orderList.order_num }">${orderList.order_num }</td>
		<td><img src="../image/item/${orderList.item_image }" width="100px" height="80px"/></td>
		<td id="leftalign"><a href="../item/item_detail.item?item_name=${orderList.item_name }">${orderList.item_name }</a></td>
		<td><fmt:formatNumber value="${orderList.price }" type="number"/>원</td>
		<td><input type="hidden" name="stock" value="${orderList.stock }">
		<input type="hidden" name="order_amount" value="${orderList.amount }">${orderList.amount }개</td>
		<td><fmt:formatNumber value="${orderList.price*orderList.amount }" type="number"/>원</td>
		<td>${orderList.date }</td>
		<td><button class="img-button" type="submit" onclick="javascript: form.action='orderCancle.ord?detail_num=${orderList.order_num }';">주문취소</button></td>
	</tr>
	</c:forEach>
	</tbody>
</table>
<section id="pageList">
<c:if test="${pageInfo.page<=1 }">
</c:if>
	<c:if test="${pageInfo.page>1 }">
		<a href="orderMyOrder.ord?page=${pageInfo.page-1 }">[이전]</a>&nbsp;
	</c:if>
	<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
	<c:choose>
		<c:when test="${a==pageInfo.page }">${a }</c:when>
		<c:otherwise>
			<a href="orderMyOrder.ord?page=${a}">${a}</a>
	</c:otherwise>
	</c:choose>
	</c:forEach>
<c:choose>
		<c:when test="${pageInfo.page>=pageInfo.maxPage }">[다음]</c:when>
	<c:otherwise>
		<a href="orderMyOrder.ord?page=${pageInfo.page+1 }">[다음]</a>
	</c:otherwise>
</c:choose>
</section>
</c:when>
	<c:otherwise>
		<h1>주문 목록이 없습니다</h1>
	</c:otherwise>
</c:choose>
</form>
</body>
</html>