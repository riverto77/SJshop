<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="item.vo.Item" %>
<jsp:include page="admin_menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<br><br><br>
<title>주문페이지</title>
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

table { border-collapse: collapse; border-spacing: 0; width : 900px; font-size : 16px;  }
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


.form {
 	top : 130px;
	text-align: center;
   	position: relative;
   	z-index: 1;
   	border-radius: 20px;
   	background-color: white;
   	max-width: 350px;
   	margin : auto;
   	margin-right : 700px;
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
}

.button {
	margin-bottom : 50px;
}
</style>
<script>

</script>
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
<div id="wrapper">
<form method="post">
<h1 class="h1">상품 정보</h1>
<br>
<table id="keywords" cellspacing="0" cellpadding="0">
<thead>
    <tr>
		<td class="td"><input type="checkbox" id="allCheck" name="allCheck" onclick="checkAll(this.form)" /></td>
		<td><span>번호</span></td>
		<td><span>상품 이미지</span></td>
		<td><span>상품명</span></td>
		<td><span>가격</span></td>
		<td><span>수량</span></td>
		<td><span>재고량</span></td>
	</tr>
	</thead>
    <tbody>
		<tr>
			<td>
				<input type="hidden" name="detail_num" value="${orderList.order_num }">
				<input type="checkbox" id="checkbox" name="checkbox" value="${orderList.item_name }" />
			</td>
			<td>
				${status.index+1 } <!-- 번호값 계산 -->
			</td>
			<td>
				<img src="../image/item/${orderList.item_image }" id="itemImage" width="200px" height="100px" />
			</td>
			<td>
				${orderList.item_name }
			</td>
			<td>
				<fmt:formatNumber value="${orderList.price }" pattern="#,###" />원
			</td>
			<td>
					<input type="hidden" name="item_price" value="${orderList.price }">
				<input type="hidden" name="item_image" value="${orderList.item_image }">
				<input type="hidden" name=item_code value="${orderList.item_code }">
				<input type="hidden" name=item_name value="${orderList.item_name }">
				<input type="hidden" name=item_qty value="${orderList.amount }">
				<input type="hidden" name="order_amount" value="${orderList.amount }">${orderList.amount } 개			
			</td>
			<td><label><input type="hidden" name="stock" value="${orderList.stock }">${orderList.stock } 개</label></td>
		</tr>
		<tr>
		<td colspan="6">
		<hr color="skyblue" width=100%>
		</td>
		</tr>
		<tr class="td">
		<td colspan="7" style="text-align:right;">
			총 금액 : <fmt:formatNumber value="${orderList.price * orderList.amount }" pattern="#,###" />원
		</td>
		</tr>
		</tbody>
</table>
<section class="form">
<table class="wrap">
<tr>
<td colspan="3">
<hr  color="skyblue" width=100%>
</td>
</tr>
<tr>
<td colspan="3"><h2>구매자 정보</h2></td>
</tr>
	<tr>
		<td><label>아이디 : </label></td>
		<td><label>${member.id }</label></td>
	</tr>
	<tr>
		<td><label>구매자 이름 : </label></td>
		<td><label>${member.name }</label></td>
	</tr>
	<tr>
		<td><label>전화번호 : </label></td>
		<td><input type="text" name="tel" id="tel" value="${member.tel }" /></td>
	</tr>
	<tr>
		<td><label>이메일 : </label></td>
		<td><label>${member.email } @ ${member.email1 }</label></td>
	<tr>
		<td><label>주소 : </label></td>
		<td><input type="text" name="addr1"id="addr1" size="3"  value="${member.addr1 }" /></td>
	</tr>
	<tr>
		<td><label>상세 주소 : </label></td>
		<td><input type="text" name="addr2" id="addr2" size="60" value="${member.addr2 }" /></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="text" name="addr3" id="addr3" size="60" value="${member.addr3 }" /></td>
	<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
		<tr class="tr_center">
			<td colspan="5" style="text-align:center;">
				<!-- <input class="img-button" type="submit" value="구매하기" formaction="../order/orderPro.ord" />
				<input class="img-button" type="submit" value="삭제" formaction="cartRemove.item" /> -->
			</td>
		</tr>
</table>
</section>
	<c:if test="${orderList == null }">
		<section class="div_empty">
		주문정보가 정보가 없습니다
		</section>
	</c:if>

	<nav id="commandList">
	<br><br>
		<button class="button" type="submit" onclick="javascript: form.action='../order/orderCancle.ord?detail_num=${orderList.order_num }';">주문취소</button>
	</nav>
</form>
</body>
</html>