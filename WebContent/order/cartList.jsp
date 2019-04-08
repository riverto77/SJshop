<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sun.org.apache.bcel.internal.generic.Select" %>
<%@ page import="cart.vo.Cart" %>
<%@ page import="item.vo.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../menubar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
<style type="text/css">
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
  line-height: 1;
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

table { border-collapse: collapse; border-spacing: 0; width : 1000px; font-size : 16px;  }
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
  width: 850px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
  width : 1200px;
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
	position : absolute;
	margin : auto;
	top : 900px;
	left : 770px;
	text-align : center;
}

	
#upImage {
	margin-left : 5px;
	width : 15px;
}
	
#downImage {
	width : 15px;
}

.td {
	position : relative;
	bottom : 30px;
}

hr {
	margin-left : 300px;
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
<script>
	function checkAll(theForm) {
		if(theForm.checkbox.length == underfined) {
			theForm.checkbox.checked = theForm.allCheck.checked;	
		} else {
			for(var i=0; i < theForm.checkbox.length; i++) {
				theForm.checkbox[i].checked = theForm.allCheck.checked;
			}
		}
	}
	
	function checkQty(item_name, qty) {
		if(qty != 1) {
			location.href="CartQtyDown.item?item_name="+item_name;
		}
	}

</script>
</head>
<body>
<br><br>
<div id="wrapper">
<form method="post">
<h1 class="h1">장바구니</h1> 
<table id="keywords" cellspacing="0" cellpadding="0">
<thead>
    <tr>
		<td><input type="checkbox" id="allCheck" name="allCheck" onclick="checkAll(this.form)" /></td>
		<td><span>번호</span></td>
		<td><span>상품 이미지</span></td>
		<td><span>상품명</span></td>
		<td><span>가격</span></td>
		<td><span>수량</span></td>
		<td><span>재고량</span></td>
	</tr>
	</thead>
    <tbody>		
		<c:forEach var="cart" items="${cartList }" varStatus="status">
		
		<tr>
			<td>
				<input type="checkbox" id="checkbox" name="checkbox" value="${cart.item_name }" />
				<input type="hidden" name="item_code" value="${cart.item_code }"/>
			</td>
			<td>
				${status.index+1 } <!-- 번호값 계산 -->
			</td>
			<td>
				<img src="../image/item/${cart.item_image }" id="cartImage" width="100px" height="100px" />
				<input type="hidden" name="item_image" value="${cart.item_image }"/>
			</td>
			<td>
				${cart.item_name }
				<input type="hidden" name="item_name" value=${cart.item_name } />
			</td>
			<td>
				<fmt:formatNumber value="${cart.item_price }" pattern="#,###" />원
				
				<input type="hidden" name="item_price" value=${cart.item_price } />
			</td>
			<td class="td">
				<a href="CartQtyUp.item?item_name=${cart.item_name }">
				<img src="../image/button/up.jpg" id="upImage" border=0 />
				</a><br>
				${cart.qty }<br>
				<input type="hidden" name="item_qty" value=${cart.qty } />
				<a href="javascript:checkQty('${cart.item_name }',${cart.qty });">
				<img src="../image/button/down.jpg" id="downImage" border=0 />
				</a>
			</td>
			<td><input type="hidden" name="stock" value=${cart.stock }>${cart.stock } 개 </td>
		</tr>
		</c:forEach>
		</tbody>
		<tr>
			<td colspan="7" style="text-align:right;">
				<br><br>
				<hr>
				총 금액 : ${totalMoney }원
				<input type="hidden" name="totalMoney" value="totalMoney">
			</td>
		</tr>
		<tr>
			<td colspan="7" style="text-align:center;">
			<br><br>
				<input type="submit" value="구매하기" formaction="../order/orderPro.ord" />
				<input type="submit" value="삭제" formaction="cartRemove.item" />
			</td>
		</tr>
	</table>
	</form>
	<c:if test="${cartList == null }">
		<section class="div_empty">
		상품 정보가 없습니다
		</section>
	</c:if>
	<nav id="commandList">
		<br><br>
		<a href="javascript:history.back()">쇼핑 계속하기</a>
	</nav>
</section>
</body>
</html>