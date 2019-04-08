<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
@charset "UTF-8";

#header{
   font-family:"Nanum Gothic";
   text-align:center;
   margin: auto;
}

.login-page {
   width: 380px;
   padding: 8% 0 0;
   margin: auto;
}

#logo{
   text-align:center;
   margin:50px;
   padding:0 0 0 0px;
}

.form {
   text-align:left;
   position: relative;
   z-index: 1;
   border-radius: 20px;
   background-color: white;
   max-width: 420px;
   margin: 0 auto 100px;
   padding: 10px 45px 45px 45px;
   
}

.input100 {
   width: 100%;
   
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
   background-color : #00A5FF;
}

</style>
</head>
<script>
alert(f.addr1.value);
	function checkForm(f) {
	
	if (f.id.value.trim() == "" || f.id.value == null) {
			alert("아이디를 입력하세요");
			f.id.focus;
			return false;
		}
		if (f.pw.value.trim() == "" || f.pw.value == null) {
			alert("비밀번호를 입력하세요")
			f.pw.focus;
			return false;
		}
		if (f.pw.value.length < 6) {
			alert("비밀번호 6자리 이상 입력해 주세요")
			f.pw.focus;
			return false;
		}
		if (!(f.pw.value.trim() == f.pwre.value.trim())) {
			//if(f.pass.value.trim()!=f.pass1.value.trim()) {
			alert("비밀번호가 일치하지 않습니다")
			//f.pass.value="";
			//f.pass1.value="";
			f.pwre.focus;
			return false;
		}
		if (f.name.value.trim() == "" || f.name.value == null) {
			alert("이름을 입력하세요");
			f.name.focus;
			return false;
		}
		if (f.tel.value.trim() == "" || f.tel.value == null) {
			alert("연락처을 입력하세요");
			f.tel.focus;
			return false;
		}
		if (f.birth.value.trim() == "" || f.birth.value == null) {
			alert("생년월일을 입력하세요");
			f.birth.focus;
			return false;
		}
		if (f.email.value.trim() == "" || f.email.value == null) {
			alert("이메일을 입력하세요");
			f.email.focus;
			return false;
		}
		if (f.addr1.value.trim() == "" || f.addr1.value == null) {
			alert("주소를 입력하세요");
			f.addr1.focus;
			return false;
		}
		if (f.addr2.value.trim() == "" || f.addr2.value == null) {
			alert("주소를 입력하세요");
			f.addr2.focus;
			return false;
		}
		if (f.addr3.value.trim() == "" || f.addr3.value == null) {
			alert("상세주소를 입력하세요");
			f.addr3.focus;
			return false;
		}
		
		var chk1=document.joinform.req.checked;
		
		if(!chk1){
	    alert('약관에 동의해 주세요');
	    return false;
		}
		
		f.submit();
	}
		
</script>
<body>
<div class="join-page">
      <div class="form">
         <form class="login-form" id="joinform" name="joinform" action="joinPro.mem" method="post" onsubmit="return checkForm(this)">
            <div id="header">            
            <h1>회원가입</h1><br>
            </div>
      
      <label for="id">ID (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="id" id="id" onclick="window.open('idcheck.mem?openInit=true','','width=500, height=300')" placeholder="ID를 입력해 주세요"  readonly />
      <button name="check" id="check" type="button" onclick="window.open('idcheck.mem?openInit=true','','width=500, height=300')">중복검사</button>
      <br><br>

      <label for="pw">비밀번호 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="password" name="pw" id="pw" placeholder="6자리 이상" />
      <br>
      <br>
      <label for="pwre">비밀번호확인</label>
      <input type="password" name="pwre" id="pwre"/>
      <br>
      <label for="name">이름 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="name" id="name"/>
      <br>
      <label for="tel">연락처 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="tel" id="tel" 
      placeholder="ex) -없이 입력해주세요" />
      <br>      
      <label for="birth">생년월일 (*)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="birth" id="birth" 
      placeholder="ex) 19990303"/>
      <br>
      <div id="gender">
      <label for="userGen">성별</label>&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="gender" value="남" checked="checked" id="gender"/>&nbsp;남자&nbsp;
      &nbsp;&nbsp;&nbsp;
      <input type="radio" name="gender" value="여">&nbsp;여자
      
      </div>
      <br>
      <label for="email">이메일 (*)</label><br>
      <input type="text" name="email" id="email"size="10" />&nbsp;@
      <span id="emailform">
         <select name="email1" id="email1" onchange="selectEmail(this)">
                  <option value="gmail.com">gmail.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="daum.net">daum.net</option>
                  <option value="hotmail.co.kr">hotmail.co.kr</option>
                  <option value="null">직접입력</option>
         </select><br><br>
      </span>
      <label for="Addr">주소 (*)</label><br><br>
      <input type="text" name="addr1" id="addr1"size="7" / placeholder="우편번호">
      <button type="button" onclick="sample6_execDaumPostcode()">주소검색</button> 
      <br>
      <input type="text" name="addr2" id="addr2" class="input100"/ placeholder="주소">
      <input type="text" name="addr3" id="addr3" class="input100"/ placeholder="상세주소">
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
      <p style="font-size:12px;">개인정보 수집 및 이용 동의</p>
      <textarea id="use" rows="10" cols="56" readonly>
1. 개인정보 수집목적 및 이용목적

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 
요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 
물품배송 또는 청구지 등 발송 , 
금융거래 본인 인증 및 금융 서비스, 마케팅

나. 회원 관리
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 
불량회원의 부정 이용 방지와 비인가 사용 방지 , 
가입 의사 확인 , 연령확인 , 만14세 미만 아동의
개인정보 수집 시 법정 대리인 동의여부 확인, 
불만처리 등 민원처리 , 고지사항 전달


2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 
로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 
이메일 , 14세미만 가입자의 경우 법정대리인의 정보


3. 개인정보의 보유기간 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 
해당 정보를 지체 없이 파기합니다. 
단, 다음의 정보에 대해서는 아래의 이유로 
명시한 기간 동안 보존합니다.

가. 회사 내부 방침에 의한 정보 보유 사유
o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : 30년
나. 관련 법령에 의한 정보보유 사유
o 계약 또는 청약철회 등에 관한 기록
-보존이유 : 전자상거래등에서의소비자보호에관한법률
-보존기간 : 5년
o 대금 결제 및 재화 등의 공급에 관한 기록
-보존이유: 전자상거래등에서의소비자보호에관한법률
-보존기간 : 5년 
o 소비자 불만 또는 분쟁처리에 관한 기록
-보존이유 : 전자상거래등에서의소비자보호에관한법률
-보존기간 : 3년 
o 로그 기록 
-보존이유: 통신비밀보호법
-보존기간 : 3개월

※ 동의는 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
      </textarea>
      <br>
      <input type="checkbox" name="req" id="req">
      <label for="req" style="font-size:12px;">&nbsp;동의합니다</label>
<script type="text/javascript">

</script>
   
      <br><br><br>
            <button class="input100" type="submit">회원가입</button>
            <br><br><br><br>
         <div id="footer">
            &nbsp;&nbsp;<a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">개인정보처리방침</a>
            &nbsp;&nbsp;|&nbsp;&nbsp;<a href="issue.jsp">문제발생</a>&nbsp;&nbsp;
         </div>
         </form>
      </div>
   </div>
</body>

</html>