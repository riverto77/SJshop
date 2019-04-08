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
<title>SJ shop 상품 상세 페이지</title>
<style>
.floatleft { float: left }
.floatright { float: right }
.alignleft {
    float: left;
    margin-right: 15px;
}
.alignright {
    float: right;
    margin-left: 15px;
}
.aligncenter {
    display: block;
    margin: 0 auto 15px;
}
a:focus { outline: 0px solid }
img {
    max-width: 100%;
    height: auto;
}
.fix { overflow: hidden }
h1,
h2,
h3,
h4,
h5,
h6 {
    margin: 0 0 15px;
}
body { font-family:Arial, Helvetica, sans-serif; }



.header-area {
    background: none repeat scroll 0 0 #f4f4f4;
}
.header-area a {
    color: #888;
}
.user-menu ul {
    list-style: outside none none;
    margin: 0;
    padding: 0;
}
.user-menu li {
    display: inline-block;
}
.user-menu li a {
    display: block;
    font-size: 13px;
    margin-right: 5px;
    padding: 10px;
}
.user-menu li a i.fa {
    margin-right: 5px;
}
.header-right ul.list-inline {
    margin: 0;
    text-align: right;
}
.header-right ul.list-inline li a {
    display: block;
    padding: 9px;
}
.header-right ul.list-inline li ul a {
    padding: 5px 15px;
}
.header-right ul.list-inline li ul {
    border: medium none;
    border-radius: 0;
    left: 50%;
    margin-left: -50px;
    min-width: 100px;
    text-align: center;
}

.mainmenu-area {background: none repeat scroll 0 0 #fbfbfb;
font-family: "Roboto Condensed",sans-serif;
text-transform: uppercase;
width: 100%;
z-index: 999;}



.logo h1 {
    font-size: 40px;
    margin: 30px 0;font-weight: 400;
}
.logo h1 a {
    color: #999;
}
.logo h1 a:hover {text-decoration: none;opacity: .7}
.logo h1 a span {
    color: #5a88ca;
}
.shopping-item {
    border: 1px solid #ddd;
    float: right;
    font-size: 18px;
    margin-top: 40px;
    padding: 10px;
    position: relative;
}
.shopping-item a {
    color: #666;
}
.cart-amunt {
    color: #5a88ca;
    font-weight: 700;
}
.product-count {
    background: none repeat scroll 0 0 #5a88ca;
    border-radius: 50%;
    color: #fff;
    display: inline-block;
    font-size: 10px;
    height: 20px;
    padding-top: 2px;
    position: absolute;
    right: -10px;
    text-align: center;
    top: -10px;
    width: 20px;
}
.shopping-item i.fa {
    margin-left: 15px;
}


.shopping-item:hover {
    background: none repeat scroll 0 0 #5a88ca;
    border-color: #5a88ca;
}
.shopping-item:hover a {
    color: #fff;text-decoration: none
}
.shopping-item:hover .cart-amunt {
    color: #fff;
}
.shopping-item:hover .product-count {
    background: none repeat scroll 0 0 #000;
}


.mainmenu-area ul.navbar-nav li a {
    color: #6e6a6a;
    font-size: 14px;
    padding: 20px;
}

.mainmenu-area ul.navbar-nav li:hover a, .mainmenu-area ul.navbar-nav li.active a {background: #5a88ca; color:#FFF;}
.mainmenu-area .nav > li > a:focus {color: #FFF;}

.slider-area { width:80%; position:relative; margin:0 auto; padding:5px;}
/*-------------------------
[9. Block slider]
---------------------------*/
.block-slider{
	border:none;
	width: 100%;
}
.block-slider ul li{
	list-style: none;
}
.block-slider .bx-pager{
	display: none;
}
.block-slider .bx-prev,
.block-slider .bx-next{
	width: 32px;
	height: 32px;
	border: 1px solid #eaeaea;
	text-align: center;
	display: block;
	border-radius: 50%;
	font-size: 30px;
	position: absolute;
	top: 50%;
	-ms-transform: translateY(-50%);
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	line-height: 29px;
	-moz-transition: all 0.45s ease;
	-webkit-transition: all 0.45s ease;
	-o-transition: all 0.45s ease;
	-ms-transition: all 0.45s ease;
	transition: all 0.45s ease;
}
.block-slider img{
	width: 1000px;
	height: 550px;
	margin : auto;
	margin-left : 270px;
}
.block-slider .bx-prev{
	left: 0px;
	padding-right: 3px;
}
.block-slider .bx-next{
	right: 0px;
	padding-left: 3px;
}
.block-slider:hover .bx-prev{
	left: 10px;
}
.block-slider:hover .bx-next{
	right: 10px;
}
.block-slider .bx-prev:hover,
.block-slider .bx-next:hover{
	background: #5a88ca;
	color: #fff;
	border-color: #5a88ca;
}

/*------------------
[4. Slidershow]
------------------*/

.block-slider .bx-pager{
	display: block;
    text-align: center;
}
.block-slider .bx-pager-item{
	width: 15px;
	height: 15px;
	background: #fff;
	font-size: 0;
	display: inline-block;
	border-radius: 50%;
	margin: 0 3px;
}
.block-slider .bx-pager-item a{
	width: 100%;
	height: 100%;
	background: #999;
	display: block;
	border-radius: 50%;
}
.block-slider .bx-pager-item a.active{
	background: #1bd172;
}
.block-slider .caption-group{
	position: absolute;
    top: 26%;
    right: 16%;
}
.block-slider .caption-group .title{
	margin: 0;
}
.block-slider .caption-group .subtitle{
	margin: 0;
	margin-top: 5px;
}
.block-slider .caption-group .button-radius{
	margin-top: 27px;
}
.block-slider .caption-group .primary{
	color: #1bd172;
}
.block-slider .caption-group .caption{

}

/*----------------------
[10. Block top seller ]
------------------------*/
.button-radius{
  position: relative;
  border: 1px solid #eaeaea;
  padding: 1px;
  min-height: 34px;
  background: #fff;
  display: inline-block;
  width: auto;
  line-height: 30px;
  padding-left: 40px;
  padding-right: 20px;
  margin: 0;
  color: #666666;
  -webkit-border-radius: 17px;
  -moz-border-radius: 17px;
  border-radius: 17px;
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -o-transition: all 1s ease;
  -ms-transition: all 1s ease;
  transition: all 1s ease;
  margin-top: 10px;
  font-size: 14px;
}
.button-radius .icon{
  -webkit-transition: all 1s ease-out;
  -moz-transition: all 1s ease-out;
  -o-transition: all 1s ease-out;
  -ms-transition: all 1s ease-out;
  transition: all 1s ease-out;
  position: absolute;
  left: 2%;
  top: 2px;
  overflow: hidden;
}

.button-radius .icon:before{
  font-family: 'FontAwesome';
  content: "\f105";
  font-size: 14px;
  color: #fff;
  width: 28px;
  height: 28px;
  background-color: #5a88ca;
  border-radius: 90%;
  text-align: center;
  line-height: 26px;
  float: left;
  -webkit-transition: all 1s ease-out;
  -moz-transition: all 1s ease-out;
  -o-transition: all 1s ease-out;
  -ms-transition: all 1s ease-out;
  transition: all 1s ease-out;
}

.button-radius.white{
  border-color: #fff;
  color: #fff;
  background: transparent;
}
.button-radius.white .icon:before{
  background: #fff;
  color: #333;
}

.button-radius:hover .icon{
  left: 100%;
  margin-left: -30px;
}
.button-radius:hover{
  padding-left: 20px;
  padding-right: 40px;
}

.promo-area {
  background:#fbfbfb;
  color: #fff;
  padding: 40px 0 40px;
}

.brands-area {
  border-top:1px solid #e5e5e5;
  border-bottom:1px solid #e5e5e5;
  color: #fff;
  padding: 20px 0 20px;
}

.promo-area .zigzag-bottom, .brands-area .zigzag-bottom{background: #f4f4f4}
.single-promo {
    font-size: 25px;
    font-weight: 200;
    padding: 20px 10px;
    text-align: center;
}
.single-promo i {
  font-size: 50px;
}

.single-promo:hover {color: #fff;background: #222;}
.promo1 { background:#5a88ca;}
.promo2 { background:#ffd900;}
.promo3 { background:#fa8072;}
.promo4 { background:#4abebd;}
.section-title {
  font-family: "Raleway",sans-serif;
  font-size: 50px;
  font-weight: 100;
  margin-bottom: 50px;
  text-align: center;
}


.product-f-image {
    position: relative;
}
.product-hover {
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;overflow: hidden;border: 1px solid #ddd;
}
.product-hover:after {
  background: none repeat scroll 0 0 #000;
  content: "";
  height: 100%;
  left: -100%;
  opacity: 0.6;
  position: absolute;
  top: 0;
  width: 100%;transition: .4s;
}
.product-hover a {
    background: none repeat scroll 0 0 #5a88ca;
    border-radius: 5px;
    color: #fff;
    display: block;
    font-size: 16px;
    left: 10%;
    margin: 0;
    padding: 10px;
    position: absolute;
    text-align: center;
    text-transform: uppercase;
    border: 1px solid #5a88ca;
    width: 80%;z-index: 99;transition: .4s;
}
.product-hover a:hover {
  background: #000;
  text-decoration: none;border-color: #444;
}
.product-carousel-price ins {
  color: #5a88ca;
  font-weight: 700;
  margin-right: 5px;
  text-decoration: none;
}
.product-hover a i.fa {
    margin-right: 5px;
}
.product-hover a.add-to-cart-link {top: -25%;}
.product-hover a.view-details-link { bottom: -25%;}
.single-product h2 {
    font-size: 18px;
    line-height: 25px;
    margin-bottom: 10px;
    margin-top: 15px;
}


.single-product h2 a {
    color: #222;
}
.single-product p {
    color: #5a88ca;
    font-weight: 700;
}

.single-product {
  overflow: hidden;
}
.single-product:hover {}
.single-product:hover .product-hover a.add-to-cart-link {top: 32%;}
.single-product:hover .product-hover a.view-details-link {bottom: 32%;}
.single-product:hover .product-hover:after{left: 0}


.product-carousel {
  padding-top: 40px;
}

.brand-wrapper .owl-nav div {
  border: 1px solid #fff;
  color: #fff;
  display: inline-block;
  margin-left: 15px;
  padding: 1px 10px;
}

.brand-wrapper .owl-nav div {
  background:#fa8072;
  color:#FFF;
  display: inline-block;
  margin-left: 15px;
  padding: 1px 10px;
}

.maincontent-area {padding-bottom: 50px; padding-top:20px;}

.product-wid-title {
  font-family: raleway;
  font-size: 30px;
  font-weight: 100;
  margin-bottom: 40px;
}


.single-wid-product {
    margin-bottom: 31px;
    overflow: hidden;
}
.product-thumb {
    float: left;
    height: 90px;
    margin-right: 15px;
    width: 100px;
}
.single-wid-product h2 {
    font-size: 14px;
    margin-bottom: 12px;
}
.product-wid-rating {
    color: #ffc808;
    margin-bottom: 10px;
}
.product-wid-price ins {
    color: #5a88ca;
    font-weight: 700;
    margin-right: 10px;
    text-decoration: none;
}
.single-wid-product h2 a {
    color: #222;
}
.single-wid-product h2 a:hover, .single-product h2 a:hover {
    color: #5a88ca;
}
.wid-view-more {
    background: none repeat scroll 0 0 #5a88ca;
    color: #fff;
    padding: 3px 15px;
    position: absolute;
    right: 10px;
    top: 3px;
}
.wid-view-more:hover {color: #fff;background-color: #222;text-decoration: none}
.single-product-widget {
    position: relative;
}
.product-widget-area {
  padding-bottom: 30px;
  padding-top: 30px;
}
.product-widget-area .zigzag-bottom{background: #f4f4f4;}
.footer-top-area .zigzag-bottom{background: #f4f4f4}
.footer-top-area {background: none repeat scroll 0 0 #333;
color: #999;
padding: 35px 0 180px;}


.footer-bottom-area {background: #000;color: #fff}
.footer-about-us span {
  color: #5a88ca;
}
.footer-wid-title {
  font-family: raleway;
  font-size: 30px;
  font-weight: 100;color: #fff
}

.footer-about-us h2 {
  font-weight: 200;
}
.footer-menu ul {
    list-style: outside none none;
    margin: 0;
    padding: 0;
}
.footer-menu ul li {
    border-bottom: 1px dashed #555;
    padding: 5px 0;
}
.footer-menu a {
    display: block;
    padding: 5px 0;color: #999
}


.footer-social a {
  background: none repeat scroll 0 0 #5a88ca;
  color: #fff;
  display: inline-block;
  font-size: 20px;
  height: 40px;
  margin-bottom: 10px;
  margin-right: 10px;
  padding-top: 5px;
  text-align: center;
  width: 40px;border: 1px solid #5a88ca;
}

.footer-social a:hover {background-color: #222;border-color: #666}

.footer-social {margin-top: 20px}


.newsletter-form input[type="email"] {
    background: none repeat scroll 0 0 #fff;
    border: medium none;
    margin-bottom: 10px;
    padding: 10px;
    width: 100%;
}
.newsletter-form input[type="submit"] {
    background: none repeat scroll 0 0 #5a88ca;
    border: medium none;
    color: #fff;
    display: inline-block;
    font-size: 18px;
    padding: 7px 20px;
    text-transform: uppercase;border: 1px solid #5a88ca;
}
.newsletter-form input[type="submit"]:hover {background: #222;border-color: #666}
.newsletter-form {
    margin-top: 25px;
}
a {color: #5a88ca}
a:hover, a:focus {color: #17a78b}
.footer-bottom-area {
  background: none repeat scroll 0 0 #000;
  color: #fff;
  padding-bottom: 40px;
}


.slide-bulletz {
    bottom: 30px;
    left: 0;
    position: absolute;
    text-align: center;
    width: 100%;
    z-index: 99;
}
ol.slide-indicators {
left: inherit;
list-style: outside none none;
margin: 0;
padding: 0;
position: relative;
width: 100%;
}
ol.slide-indicators li {
background: none repeat scroll 0 0 #222;
border: medium none;
border-radius: 0;
cursor: pointer;
display: inline-block;
height: 10px;
margin: 0 0 0 5px;
width: 10px;
}
ol.slide-indicators li.active {
background: none repeat scroll 0 0 #fff;
height: 10px;
margin: 0 0 0 5px;
width: 10px;
}


.carousel.carousel-fade .item { transition: opacity 1s ease-in-out }
.carousel.carousel-fade .active.left,
.carousel.carousel-fade .active.right {
    left: 0;
    z-index: 2;
    opacity: 0;
    filter: alpha(opacity=0);
}

.footer-card-icon {
  font-size: 30px;
  text-align: right;
}

.copyright > p {
  margin: 10px 0 0;
}

.product-big-title-area {background: url(img/crossword.png) repeat scroll 0 0 #5a88ca}

.product-bit-title h2 {
  font-family: raleway;
  font-size: 50px;
  font-weight: 200;
  margin: 0;
  padding: 50px 0;color: #fff;
}

.single-product-area .zigzag-bottom {background-color: #f4f4f4}

.single-product-area {
  padding: 80px 0 130px;
}





.sidebar-title {
    color: #fead53;
    font-size: 25px;
    margin-bottom: 30px;
    text-transform: uppercase;
}
.single-sidebar {
    margin-bottom: 50px;
}
input[type="text"], input[type="password"], input[type="email"], textarea {
    border: 1px solid #ddd;
    padding: 10px;
}
input[type="submit"], button[type=submit] {
    background: none repeat scroll 0 0 #5a88ca;
    border: medium none;
    color: #fff;
    padding: 11px 20px;
    text-transform: uppercase;
}
input[type="submit"]:hover, button[type=submit]:hover {background-color: #222}
.single-sidebar input[type="text"] {
    margin-bottom: 10px;
    width: 100%;
}
.thubmnail-recent {
    margin-bottom: 30px;
    overflow: hidden;
}
.recent-thumb {
    float: left;
    height: auto;
    margin-right: 15px;
    width: 63px;
}
.thubmnail-recent > h2 {
    font-size: 20px;
    margin-bottom: 10px;
}
.thubmnail-recent > h2 a {
    color: #222;
}
.product-sidebar-price > ins {
    color: #5a88ca;
    font-weight: 700;
    margin-right: 10px;
    text-decoration: none;
}
.single-sidebar > ul {
    list-style: outside none none;
    margin: 0;
    padding: 0;
}
.single-sidebar li {
    border-bottom: 1px solid #f1f1f1;
    padding: 10px 0;
}
.single-sidebar a {
    display: block;
}

.quantity {
    float: left;
    margin-right: 15px;
}
.quantity input[type="number"] {
    border: 1px solid #5a88ca;
    padding: 5px;
    width: 50px;
}
.add_to_cart_button {
    background: none repeat scroll 0 0 #5a88ca;
    border: medium none;
    color: #fff;
    padding: 6px 25px;display: inline-block
}
.add_to_cart_button:hover {background-color: #222;color: #fff;text-decoration: none}
form.cart {
    margin-bottom: 25px;
}
.product-inner-category {
    margin-bottom: 30px;
}
.product-tab {
    border-bottom: 1px solid #ddd;
    list-style: outside none none;
    margin: 0 0 30px;
    padding: 0;
    text-align: center;
}
.product-tab li {
    display: inline-block;
}
.product-tab li.active {
    background: none repeat scroll 0 0 #5a88ca;
}
.product-tab li.active a {
    color: #fff;
}
.product-tab li a {
    color: #222;
    display: block;
    font-size: 16px;
    padding: 10px 30px;
}
.product-tab li a:hover {
    text-decoration: none;
}
.product-tab li a:focus {
    text-decoration: none;
}
.tab-content h2 {
    font-size: 20px;
}
.tab-content {
    margin-bottom: 30px;
}
.submit-review label {
    display: block;
}
.submit-review input[type="text"], .submit-review input[type="email"], .submit-review textarea {
    margin-bottom: 20px;
    width: 100%;
}
.rating-chooser {
    margin-bottom: 30px;
}
.rating-chooser p {
    font-weight: 700;
}
.rating-wrap-post {
    font-size: 20px;
}

.submit-review textarea {
    height: 105px;
}

.related-products-wrapper {
  margin-top: 30px;
}
.related-products-title {color: #feae52;
font-size: 25px;
margin-bottom: 30px;
text-transform: uppercase;}

.related-products-wrapper .owl-nav {
  position: absolute;
  right: 0;
  top: -56px;
}



table.shop_table {
    border-bottom: 1px solid #ddd;
    border-right: 1px solid #ddd;
    margin-bottom: 50px;
    width: 100%;
}
table.shop_table th, table.shop_table td {
    border-left: 1px solid #ddd;
    border-top: 1px solid #ddd;
    padding: 15px;
    text-align: center;
}
table.shop_table th {
    background: none repeat scroll 0 0 #f4f4f4;
    font-size: 15px;
    text-transform: uppercase;
}
td.product-thumbnail img {
    height: auto;
    width: 70px;
}
td.product-name {
    font-size: 18px;
}
div.quantity input.plus, div.quantity input.minus {
    background: none repeat scroll 0 0 #5a88ca;
    border: medium none;
    color: #fff;
    height: 25px;
    line-height: 15px;
    width: 25px;
}
td.product-quantity div.quantity {
    float: none;
    margin: 0;
}
td.actions div.coupon {
    float: left;
}
.cart-collaterals {
    overflow: hidden;
}
.cross-sells {
    float: left;
    margin-right: 3%;
    width: 57%;
}
.cart_totals {
    float: right;
    margin-bottom: 50px;
    width: 40%;
}
.cart-collaterals h2 {
    color: #5a88ca;
    font-size: 25px;
    margin-bottom: 25px;
    text-transform: uppercase;
}
div.cart-collaterals ul.products {
    list-style: outside none none;
    margin: 0 0 0 -30px;
    padding: 0;
}
div.cart-collaterals ul.products li.product {
    float: left;
    margin-left: 30px;
    position: relative;
    width: 198px;
}
.cart_totals table {
    border-bottom: 1px solid #ddd;
    border-right: 1px solid #ddd;
    width: 100%;
}
.cart_totals table th, .cart_totals table td {
    border-left: 1px solid #ddd;
    border-top: 1px solid #ddd;
    padding: 10px;
}
.cart_totals table th {
    background: none repeat scroll 0 0 #f4f4f4;
}
.onsale {
}
div.cart-collaterals ul.products li.product .onsale {
    background: none repeat scroll 0 0 #5a88ca;
    color: #fff;
    padding: 5px 10px;
    position: absolute;
    right: 0;
}
div.cart-collaterals ul.products li.product h3 {
    color: #333;
    font-size: 20px;
    margin-top: 15px;
}
div.cart-collaterals ul.products li.product .price {
    color: #333;
    display: block;
    margin-bottom: 10px;
    overflow: hidden;
}
.price > ins {
}
div.cart-collaterals ul.products li.product .price ins {
    color: #5a88ca;
    font-weight: 700;
    margin-left: 10px;
    text-decoration: none;
}



.woocommerce-info {
    background: none repeat scroll 0 0 #f4f4f4;
    font-size: 18px;
    margin-bottom: 20px;
    padding: 15px;
}
.col2-set {
    margin-left: -30px;
    overflow: hidden;
}
.col-1, .col-2 {
    float: left;
    margin-left: 30px;
    width: 360px;
}
#customer_details label {
    display: block;
    margin: 0 0 5px;
}
#customer_details input[type="text"], #customer_details textarea, .shipping_calculator input[type=text] {
    margin-bottom: 10px;
    width: 100%;
}
#customer_details h3 {
    color: #5a88ca;
    font-size: 20px;
    text-transform: uppercase;
}
.create-account {
    background: none repeat scroll 0 0 #f4f4f4;
    margin-bottom: 50px;
    padding: 15px;
}
#order_review_heading {
    color: #5a88ca;
    font-size: 20px;
    text-transform: uppercase;
}
#payment ul.payment_methods {
    list-style: outside none none;
    margin: 0 0 30px;
    padding: 0;
}
#payment ul.payment_methods li {
    margin-bottom: 15px;
}
a.about_paypal {
    font-size: 12px;
    margin-left: 15px;
}


#customer_details select, .shipping_calculator select {
  border: 1px solid #ddd;
  margin-bottom: 15px;
  padding: 10px;
  width: 100%;
}


table.shop_table td.product-remove a {
  display: inline-block;
  padding: 0 5px 2px;
  text-transform: uppercase;
}


table.shop_table td.product-remove a:hover {color: #fff;background: red;text-decoration: none}
table.shop_table td.product-name a{color: #222;}
table.shop_table td.product-name a:hover {color: #5a88ca;text-decoration: none}
div.quantity input.plus:hover, div.quantity input.minus:hover {background-color: #222}
div.cart-collaterals ul.products li.product a:hover h3 {color: #5a88ca}
div.cart-collaterals ul.products li.product a:hover {text-decoration: none}

div.cart-collaterals ul.products li.product:hover .add_to_cart_button{background-color: #222}


.cart-collaterals .shipping_calculator {
  float: right;
  width: 40%;
}


#login-form-wrap, #coupon-collapse-wrap {
    background: none repeat scroll 0 0 #f4f4f4;
    margin-bottom: 30px;
    padding: 25px;
}
#login-form-wrap label {
    display: block;
    margin-bottom: 5px;
}
#login-form-wrap input[type="text"], #login-form-wrap input[type="password"] {
    margin-bottom: 10px;
    width: 250px;
}
#login-form-wrap input[type="submit"] {
    margin-bottom: 15px;
}



.single-shop-product h2 {
    font-size: 20px;
    margin: 10px 0;
}
.product-option-shop {
    margin-top: 15px;
}

.single-shop-product {margin-bottom: 50px}

.pagination > li > a, .pagination > li > span {
  color: #5a88ca;
}

.imagesize {
	width : 450px;
	height : 200px;
}

.logoimage {
	margin : auto;
	margin-left : 500px;
	width : 200px;
	height : 150px;
}

* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

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

table {
	padding : 5px;
	margin : auto;
	text-align : center;
	font-size : 20px;
}

label {
	text-align : center;
	font-size : 15px;
}

.h2 {
	position : relative;
	text-align : left;
	margin-top : 0;
	margin-left : 300px;
}

.img-button {
   font-family:"Nanum Gothic";
   font-weight: 700;
   text-transform: uppercase;
   outline: 0;
   background-color: #2E9AFE;
   border: 0;
   padding: 13px;
   color: #FFFFFF;
   font-size: 16px;
   -webkit-transition: all 0.3 ease;
   transition: all 0.3 ease;
   cursor: pointer;
   width : 150px;
}

.hr {
	margin-left : 270px;
	border: 2px outset #A9D0F5;
	radius: 10px 10px 10px 10px;
	float : left;
	width : 600px;
}

.image {
	margin-right : 60px;
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
<div>
<br><br><br>
<h2 class="h2">상품</h2>
<br><br><br><br><br><br><br>
<form action="order.ord" method="post">
<table>
	<tr>
		<td rowspan=6 colspan=3><input type="hidden" name="item_image" value="${detail.item_image }">
			<img class="image" src="../image/item/${detail.item_image }" width="400px" height="300px" /></td>
		<td><input type="hidden" name="item_code" value="${detail.item_code }"></td>
		<td><label>상품 이름 : </label><input type="hidden" name="item_name" value="${detail.item_name }">${detail.item_name }</td>
	</tr>
	<tr>
	<td></td>
		<td><label>제조사 : </label>${detail.item_company }</td>
	</tr>
	<tr>
	<td></td>
		<td><label>가격 : </label><input type="hidden" name="item_price" value="${detail.item_price }">${detail.item_price }원</td>
	</tr>
	<tr>
	<td></td>
		<td><label>수량 : </label>
		<select name="item_qty">
		<c:forEach var="a" begin="01" end="${detail.stock }" step="1" varStatus ="status">
			
			<option><fmt:formatNumber pattern="0" value="${a }"/></option>
			
		</c:forEach>
		</select>
		<td>
		</td>
	</tr>
	<tr>
	<td></td>
		<td><label>재고수 : </label><input type="hidden" name="stock" value="${detail.stock }">${detail.stock }개</td>
	</tr>
	<tr>
	<td></td>
		
		<td><button class="img-button" type="submit" onclick="javascript: form.action='../item/cartAdd.item?item_code=${detail.item_code}';">장바구니 담기</button>
		<button class="img-button" type="submit" onclick="javascript: form.action='../order/order.ord?item_code=${detail.item_code}';">바로구매</button>
	</tr>
</table>
</form>
<br>
<hr class="hr">
<br><br><br>
<h2 class="h2">상품 안내</h2>
<table>
	<tr>
		<td>
		<img src="../image/item/${detail.item_detail_image }" ></td>
	</tr>
</table>
<hr class="hr">
<br><br><br>
<h2 class="h2">구매 후기</h2>
<table>
</table>
</div>
</body>
</html>