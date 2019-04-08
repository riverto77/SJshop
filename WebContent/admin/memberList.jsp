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
<title>회원 리스트</title>
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
  width: 1200px;
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
	top: 60px;
	margin : auto;
	width : 500px;
	font-size : 15px;
	text-align : center;
	margin-bottom : 60px;
}

.search {
	position : relative;
	margin : auto;
	top : 30px;
	text-align : center;
}

</style>
</head>
<body>
<form method="post" onsubmit="return checkForm(this)">
 <div id="wrapper">
 <br>
  <h1 class="h1">관리자 회원목록 리스트</h1> 
  <br><br>
  <table id="keywords" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
		<td><span>아이디</span></td>
		<td><span>성명</span></td>
		<td><span>전화번호</span></td>
		<td><span>이메일</span></td>
		<td><span>성별</span></td>
		<td><span>생년월일</span></td>
		<td><span>가입시간</span></td>
		<td><span>수정/삭제</span></td>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="member" items="${MemberList }">
		<tr>
			<td><a href="memberInfo.mem?id=${member.id }">${member.id }</a></td>
			<td>${member.name }</td>
			<td>${member.tel }</td>
			<td>${member.email } @ ${member.email1 }</td>
			<td>${member.gender }</td>
			<td>${member.birth }</td>
			<td>${member.joindate }</td>
			<td><button class="button" type="submit" onclick="javascript: form.action='memberInfo.mem?id=${member.id }';">수정/삭제</button>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</form>
</div>
<br><br><br><br><br><br>
<form class="search" action="memberList.mem" name="search" id="search" method="post">
		<select name="select">
			<option value="id">아이디</option>
			<option value="name">이름</option>
		</select>
		<input type="text" name="search" id="search"  />
		<input type="submit" value="검색">
</form>
<section id="pageList">
<c:if test="${pageInfo.page<=1 }">
			
			</c:if>
			<c:if test="${pageInfo.page>1 }">
				<a href="memberList.mem?page=${pageInfo.page-1 }">[이전]</a>&nbsp;
			</c:if>
				
			<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				<c:choose>
					<c:when test="${a==pageInfo.page }">
						${a }
					</c:when>
					<c:otherwise>
						<a href="memberList.mem?page=${a}">${a}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						[다음]
					</c:when>
					<c:otherwise>
						<a href="memberList.mem?page=${pageInfo.page+1 }">[다음]</a>
					</c:otherwise>
				</c:choose>
</section>
</body>
</html>