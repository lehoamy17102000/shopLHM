<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style type="text/css">
	.menuH{
		width: 100%;
		height: 20%;
		background-color: white;
	}
	.menuH1{
		padding-top: 12px;
		height: 30%;
		width: 100%;
		background-color: #66e0ff;
		
	}
	.menuH1 a{
		color: white;
	}
	.menuH1 h3{
		display: inline-block;
	}
	.menuH1 ul li{
		margin-left: 20px;
		display: inline;
		list_style-type:none;
	}
	li img{
		width: 20px;
		height: 15px;
	}
/* 	.menuH1 ul{
		margin-left: 30%;
	} */
	.menuH3{
		height: 50%;
		width: 100%;
		background-color: gray;
		padding-top: 15px;
	}
	#searchid{
		width: 30%;
		margin-left: 35%;
	}
	.menuH4{
		height: 45px;
		width: 100%;
		background-color: #66e0ff;
		padding-top: 2px;
		padding-left: 75%;
		padding-top: 8px;
	}
	.content{
		width: 100%;
		background-color: whitesmoke;
		min-height: 100px;
	}
	.menuV1{
		width: 20%;
		background-color: whitesmoke;
		min-height: 1000px;
		display: inline-block;
		vertical-align: top;
	}
	.subcontent{
		width: 60%;
		background-color: white;
		min-height: 1000px;
		display: inline-block;
		margin-bottom: 0px;
		vertical-align: top;
	}
	.menuV2{
		width: 19%;
		background-color: whitesmoke;
		min-height: 100%;
		display: inline-block;
		vertical-align: top;
	}
 	.imag{
		height: 280px;
		width: 39%;
		display: inline-block;
		vertical-align: top;
		margin: 10px 10% 0px 0px;
		
	}
	.caract{
		display: inline-block;
		vertical-align: top;
		position: absolute;
		margin-top: 10%;
		width: 100%;
		  
	}  
	#searchID{
		width: 50%
	}
	.menuH3 form{
		margin-left: 30%;
	}
	.menuH3 h4{
  	color: red;
  	margin-left: 45%;
	}
	.menuH1 h3{
		display: inline-block;
		vertical-align: top;
	}
	.menuH1 ul{
		display: inline-block;
		vertical-align: top;
	}

</style>
<!-- <link rel="stylesheet" type="text/css" href="/css/home.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>The actual best deal !</title>
</head>
<body>
<div class="menuH">
	<div class="menuH1">
		<h3 class="col-2"> Welcome!</h3>
		
		<ul class="col-9">
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/phone.png"><a href="">+1.800000001</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/chat2.png"><a href="">Chart</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/profile.png"><a href="">My account</a></li>
			<li class="btn btn-secondary btn-lg">
				<a href="/cart">Cart</a>
        	</li>
			<li class="btn btn-secondary btn-lg"><a href="/login">Login</a></li>
		</ul>	
	</div>
	<div class="menuH2">
	
	</div>
	
	<div class="menuH3">
		<div class="search-container">
		    <form action="/home/process/search" method="post" class="input-group md-form form-sm form-2 pl-0" id="searchid">
		      <input class="form-control my-0 py-1 lime-border" type="text" placeholder="Search.." name="search">
		      <button class="btn btn-primary" type="submit"><i class="fa fa-search">GO</i></button>
		    </form>
  		</div>
  		<h4><c:out value="${ noResult }"/></h4>
	</div>

</div>
<div class="menuH4">
<c:forEach begin="1" end="${totalPages}" var="index">
  | <a href="/home/${index}">${index}</a>
</c:forEach>
</div>
<div class="content">
	<div class="menuV1">
	</div>
	<div class="subcontent">
		<!-- <div class="product">
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/img/clothe/clothe1.jpeg" width="560" height="280" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/img/clothe/clothe2.jpeg" width="560" height="280" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/img/clothe/clothe3.jpeg" width="560" height="280" alt="First slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
		</div> -->
		<c:if test="${test == 0}">
			<c:forEach items="${ products }" var="prod">

					<div class="imag">
						<a href="/product/${ prod.id }">
						<ul class="caract">
							<li><c:out value="${ prod.name }"/></li>
							<li><c:out value="${ prod.description }"/></li>
							<li>$<c:out value="${ prod.price }"/></li>
						</ul>
						<img src="/img/clothe/${ prod.url }" width="100%" height="100%" alt="picture">
						
						</a>
					</div>

			</c:forEach>
		</c:if>
		
		<c:if test="${test == 1}">
			<c:forEach items="${ products.content }" var="prod">
				<div class="imag">
						<a href="/product/${ prod.id }">
						<ul class="caract">
							<li><c:out value="${ prod.name }"/></li>
							<li><c:out value="${ prod.description }"/></li>
							<li>$<c:out value="${ prod.price }"/></li>
						</ul>
						<img src="/img/clothe/${ prod.url }" width="100%" height="100%" alt="picture">
						
						</a>
					</div>
			</c:forEach>
		</c:if>

	</div>
	<div class="menuV2">
		
	</div>
</div>
</body>
</html>