<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.vo.MemberBean" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.PageInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../menubar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
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
	text-align : left;
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
   border-radius : 20px;
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
</script>
</head>
<body>
<div class="member-page">
      <div class="form">
         <form class="member-form" id="memberInfoform" name="memberInfoform" action="memberModify.mem" method="post" onsubmit="return checkForm(this)">
            <div id="header">            
            <h1>회원 정보</h1><br><br><br>
            </div>
<label for="id">ID (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="id" id="id" value="${member.id }" readonly >
      <br><br>
      <label for="pw">비밀번호 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="password" name="pw" id="pw" value="${member.pw }" />
      <br>
      <br>
      <label for="name">이름 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="name" id="name" value="${member.name }" />
      <br>
      <label for="tel">연락처 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="tel" id="tel" value="${member.tel }" />
      <br>      
      <label for="birth">생년월일 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="birth" id="birth" value="${member.birth }" />
      <br>
      <div id="gender">
      <label for="userGen">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
      
      <c:choose>
      <c:when test="${member.gender == '남'}">
      <input type="radio" name="gender" value="남" checked="checked" id="gender"/>&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="gender" value="여">&nbsp;여자
      </c:when>
      <c:otherwise>
      <input type="radio" name="gender" value="남" id="gender"/>&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="gender" value="여" checked="checked">&nbsp;여자
      </c:otherwise>
      </c:choose>
      
      </div>
      <br>
      <label for="email">이메일 (*)</label><br>
      <input type="text" name="email" id="email"size="10" value="${member.email }" />&nbsp;@
       <select name="email1" id="email1" onchange="">
       			  <option value="${member.email1 }">${member.email1 }</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="hotmail.co.kr">hotmail.co.kr</option>
         </select>
         <br><br>
      </span>
      <label for="Addr">주소 (*)</label><br><br>
      <input type="text" name="addr1" id="addr1"size="7" value="${member.addr1 }">&nbsp;&nbsp;
      <button type="button" onclick="sample6_execDaumPostcode()">주소검색</button> 
      <br>
      <label>상세주소</label><br><br>
      <input type="text" size="55" name="addr2" id="addr2" value="${member.addr2 }"><br>
      <input type="text" size="55" name="addr3" id="addr3" value="${member.addr3 }"><br>
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script>
          function sample6_execDaumPostcode() {
              new daum.Postcode({
                  oncomplete: function(data) {
                      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
      
                      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                      var fullAddr = ''; // 최종 주소 변수
                      var extraAddr = ''; // 조합형 주소 변수
      
                      // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                          fullAddr = data.roadAddress;
      
                      } else { // 사용자가 지번 주소를 선택했을 경우(J)
                          fullAddr = data.jibunAddress;
                      }
      
                      // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                      if(data.userSelectedType === 'R'){
                          //법정동명이 있을 경우 추가한다.
                          if(data.bname !== ''){
                              extraAddr += data.bname;
                          }
                          // 건물명이 있을 경우 추가한다.
                          if(data.buildingName !== ''){
                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                          }
                          // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                          fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                      }
      
                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
                      document.getElementById('addr2').value = fullAddr;
      
                      // 커서를 상세주소 필드로 이동한다.
                      document.getElementById('addr3').focus();
                  }
              }).open();
          }
      </script>
      <br>
      <label>가입날짜</label><br><br>
      <input type="Date" size="4" name="joindate" id="joindate" value="${member.joindate }" readonly/><br><br>
      
      <button class="input100" type="submit">회원 정보 수정</button>&nbsp;&nbsp;
      <button class="input100" type="submit" onclick="javascript: form.action='memberDelete.mem';">회원삭제</button>
      </form>
      <br><br>
</div>
</body>
</html>