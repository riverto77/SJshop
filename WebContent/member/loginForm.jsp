<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
@charset "UTF-8";

.login-page {
   width: 380px;
   padding: 7% 0 0;
   margin: auto;
}

#logo{
   font-family:"Nanum Gothic";
   text-align:center;
   margin:13px;
   padding:0 0 0    0px;
}

.form {
   text-align:left;
   position: relative;
   z-index: 1;
   background-color: white;
   max-width: 360px;
   border-radius: 20px;
   margin: 0 auto 100px;
   padding: 30px 30px 30px 30px;
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
   background-color: #00A5FF;
   border: 0;
   padding: 13px;
   color: #FFFFFF;
   font-size: 16px;
   -webkit-transition: all 0.3 ease;
   transition: all 0.3 ease;
   cursor: pointer;
}

.form button:hover, .form button:active, .form button:focus {
   background-color: skyblue ;
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



<body>
   <div class="login-page">
      <div class="form">
         <h1 id="logo">Login</h1>
         <form action="login.log" method="POST">


            <input type="text" id="ie" name="id" placeholder="ID"
               maxlength="20" class="input100" value="" />
            <br>
            <input type="password" id="pw" name="pw" placeholder="Password"
                class="input100" />
               
            <div style="float:right;">
            <input type="checkbox" id="id_rem" name="id_rem"/><label for="id_rem" style="font-size:12px;">&nbsp;아이디 기억하기</label><br>
            </div>   
                
            <br>
            <button type="submit" class="input100" id ="selectButton">로그인</button>
            <br><br>
            <div id="footer">
               <a href= "../main.jsp">홈</a>&nbsp;&nbsp;|&nbsp;&nbsp;
               <a href="pwFind.jsp">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
               <a href="joinForm.jsp">회원가입</a>&nbsp;&nbsp;
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

         </form>
      </div>
   </div>


</body>
</html>