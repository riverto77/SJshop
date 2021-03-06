<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="item.vo.Item"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="admin_menu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문 목록</title>
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
  width: 1300px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
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
	margin-top : 30px;
}

.search {
	position : relative;
	margin : auto;
	text-align : center;
}

</style>
</head>
<body>
<c:choose>
<c:when test="${orderList != null }">
<form method="post" onsubmit="return checkForm(this)">
 <div id="wrapper">
 <br>
  <h1 class="h1">관리자 주문 리스트</h1> 
  <br><br>
  <table id="keywords" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
      	<th><span>주문번호</span></th>
        <th><span>구매자</span></th>
        <th><span>상품이름</span></th>
        <th><span>입출고</span></th>
        <th><span>재고량</span></th>
        <th><span>날짜</span></th>
        <th><span>비고</span></th>
      </tr>
    </thead>
    <tbody>
	<c:forEach var="orderList" items="${orderList }" varStatus="status">
	<tr>
		
		<td><input type="hidden" name="detail_num" value="${orderList.order_num }">${orderList.order_num }</td>
		<td><input type="hidden" name="id" value="${orderList.id }">${orderList.id }</td>
		<td>${orderList.item_name }</td>
		<td><input type="hidden" name="item_qty" value="${orderList.amount }">${orderList.amount }</td>
		<td><input type="hidden" name="stock" value="${orderList.stock }">${orderList.stock }</td>
		<td>${orderList.date }</td>
		<td><input type="hidden" name="item_price" value="${orderList.price }">
			<input type="hidden" name="item_image" value="${orderList.item_image }">
		<button type="submit" class="button" onclick="javascript: form.action='../admin/AdOrderDetail.ord?id=${orderList.id }&detail_num=${orderList.order_num}';">상세보기</button>
	</tr>
	</c:forEach>
    </tbody>
  </table>
 </form>
 </div>	
</form>

<br><br><br><br><br><br>
<form class="search" action="itemStockView.item" name="search" id="search" method="post">
		<select name="select">
			<option value="id">아이디</option>
			<option value="item_name">상품이름</option>
		</select>
		<input type="text" name="search" id="search"  />
		<input type="submit" value="검색">
</form>
<br><br>

<section id="pageList">
<c:if test="${pageInfo.page<=1 }">
</c:if>
	<c:if test="${pageInfo.page>1 }">
		<a href="OrderList.ord?page=${pageInfo.page-1 }">[이전]</a>&nbsp;
	</c:if>
				
	<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
	<c:choose>
		<c:when test="${a==pageInfo.page }">${a }</c:when>
		<c:otherwise><a href="OrderList.ord?page=${a}">${a}</a></c:otherwise>
	</c:choose>
	</c:forEach>
	<c:choose>
		<c:when test="${pageInfo.page>=pageInfo.maxPage }">[다음]</c:when>
		<c:otherwise><a href="OrderList.ord?page=${pageInfo.page+1 }">[다음]</a></c:otherwise>
	</c:choose>
</section>
</c:when>
<c:otherwise>
<h1>주문 데이터가 없습니다</h1>
</c:otherwise>
</c:choose>
</body>
</html>