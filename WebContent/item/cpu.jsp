<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo"%>
<%@ page import="item.vo.Item"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SJ shop CPU 상품페이지</title>
<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle; max-width:100%; height:auto;}

/* Slideshow container */
.slideshow-container {
  max-width: 1376px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

.slideimage {
	width : 1376px;
	height : 500px;
}

.center {
	text-align : center;
	font-weight : bolder;
}

.itemimage {
	width : 200px;
	height : 180px;
}

.search {
	text-align : right;
	position : relative;
	margin-top : 30px;
	margin-right : 260px;
}

#pageList {
	position : relative;
	margin : auto;
	margin-top = 0;
	margin-bottom : 30px;
	width : 500px;
	font-size : 15px;
	text-align : center;
}

</style>
</head>
<body>
<head>
<jsp:include page="../menubar.jsp"/>
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
<div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>CPU</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.3.min.js"></script>

<br><br>

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 2</div>
  <img class="slideimage" src="../image/banner/intel slide.png">
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 2</div>
  <img class="slideimage" src="../image/banner/intel 9900k slide.png">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 

</div>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
    
<br><br>
	<c:choose>
	<c:when test="${pageInfo.listCount>0 }">
	<c:if test="${cpuList != null }">		
	<div class="section1">
	<form class="search" action="cpu.item?category=cpu" name="search" id="search" method="post">
		<select name="select">
			<option value="intel">Intel</option>
			<option value="amd">AMD</option>
		</select>
		<input type="text" name="search" id="search"  />
		<input type="submit" value="검색">
	</form>
	</div>
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
             <c:forEach var="cpuList" items="${cpuList }" varStatus="status">
                <div class="col-md-3 col-sm-6">
                    <div class="single-shop-product">
                   
                        <div class="product-upper">
                            <a href="item_detail.item?item_code=${cpuList.item_code }">
                            <img class="itemimage" src="../image/item/${cpuList.item_image }" id="productImage" />
                            </a>
                        </div>
                        <h2>
							${cpuList.item_name }
						</h2>
                        <div class="product-carousel-price">
                            <fmt:formatNumber value="${cpuList.item_price }" pattern="#,###" /> 원
                        </div>  
                        
                        <div class="product-option-shop">
                            <a class="add_to_cart_button"
								data-quantity="1" data-product_sku="" data-product_id="70"
								rel="nofollow" href="../item/cartAdd.item?item_code=${cpuList.item_code}">Add to cart</a>
                        </div>
					           
                    </div>
                </div>
                </c:forEach>
             </div>
         </div> 
      </div>
</c:if>
<section id="pageList">
<c:if test="${pageInfo.page<=1 }">
			
			</c:if>
			<c:if test="${pageInfo.page>1 }">
				<a href="cpu.item?category=cpu&page=${pageInfo.page-1 }">[이전]</a>&nbsp;
			</c:if>
				
			<c:forEach var="a" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				<c:choose>
					<c:when test="${a==pageInfo.page }">
						${a }
					</c:when>
					<c:otherwise>
						<a href="cpu.item?category=cpu&page=${a}">${a}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						[다음]
					</c:when>
					<c:otherwise>
						<a href="cpu.item?category=cpu&page=${pageInfo.page+1 }">[다음]</a>
					</c:otherwise>
				</c:choose>
</section>
		</c:when>
		<c:otherwise>
			<h2 class="center">상품이 존재하지 않습니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>