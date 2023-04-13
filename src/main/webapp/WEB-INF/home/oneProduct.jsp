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
		width: 17px;
		height: 15px;
	}
	p img{
		width: 17px;
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
		height: 25px;
		width: 100%;
		background-color: #66e0ff;
		padding-top: 2px;
		padding-left: 75%;
		padding-top: 8px;
	}
	.content{
		width: 100%;
		background-color: whitesmoke;
		min-height: 1000px;
	}
	.menuV1{
		width: 20%;
		background-color: whitesmoke;
		min-height: 100%;
		display: inline-block;
		vertical-align: top;
	}
	.subcontent{
		width: 60%;
		background-color: gray;
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
	.product{
		height: 280px;
		width: 99%;
		background-color: gray;
		margin: 0px 0px 0px 1%;
		margin-bottom: 1px;
	}
 	.imag{
		height: 280px;
		width: 39%;
		background-color: #3fa5eb;
		display: inline-block;
		vertical-align: top;
		background-color: white;
    	border-radius: 20px;
	}
	.caract{
		height: 280px;
		width: 60%;
		background-color: yellow;
		display: inline-block;
		vertical-align: top;
		background-color: white;
    	border-radius: 20px;
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

	label{
		display: inline-block;
		width: 90px;
	}

.sending_area{
    vertical-align: top;
    display: inline-block;
    width: 45%!important;
    border: solid 1px;
    min-height: 30%;
    float: left;
    margin-top: 20px;
    background-color: #66e0ff;
    border-radius: 20px;
}
.comments{
    display: inline-block;
    width: 45%!important;
    border: solid 1px;
    min-height: 30px;
    float: right;
    padding-left: 15px; 
    margin-top: 20px;
    vertical-align: top;
    background-color: white;
    border-radius: 20px;
}
.comments p{
	margin-bottom: 0px;
}

.sending_area form{
    text-align: left;
    width: 100%;
    height: 60%;
    vertical-align: top;
    margin-left: 0px;
}


.sending_area #textform_id{
    border: solid 2px;
    font-size:12px !important;
}
textarea{
    font-size: 12px!important;
}
.sending_area h6{
	margin-top: 20px;
}
.under_p{
	margin-left: 6%;
}
	span{
		color: green;
	}
</style>
<!-- <link rel="stylesheet" type="text/css" href="/css/home.css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>GoodDeal, the actual best deal !</title>
</head>
<body>
<div class="menuH">
	<div class="menuH1">
		<h3 class="col-2"> Welcome <c:out value="${ sessionScope.firstName }"/> !</h3>
		
		<ul class="col-9">
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/phone.png"><a href="">+ 1.800.000.000</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/chat2.png"><a href="">Chart</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/profile.png"><a href="">My account</a></li>
			<c:if test="${user.status == 1}">
			<li class="btn btn-secondary btn-lg">
			<a href="/admin/products/pages/1"> Mode Admin</a>
			</li>
			</c:if>
			<c:if test="${user.status == 2}">
			<li class="btn btn-secondary btn-lg">
			<a href="/admin/products/pages/1">Mode Vendor</a>
			</li>
			</c:if>
		
			<li class="btn btn-secondary btn-lg">
				<a href="/cart">Cart <span>(<c:out value="${quantities.size()}"/>)</span></a>
        	</li>
			<li class="btn btn-secondary btn-lg"><a href="/logout">Logout</a></li>
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

</div>
<div class="menuH4">
</div>
<div class="content">
	<div class="menuV1">
	</div>
	<div class="subcontent">

		<div class="product">
			<div class="imag">
				<img src="/img/clothe/${ product.url }" width="100%" height="100%" alt="picture of clothe">
			</div>
			<div class="caract">
				<ul>
					<li><c:out value="${ product.name }"/></li>
					<li><c:out value="${ product.description }"/></li>
					<li> $<c:out value="${ product.price }"/></li>
					<li>
						<c:forEach var = "i" begin = "1" end ="${avgInt}">
			           		<img src="/img/star/star_yellow.png">
			         	</c:forEach>
			         	<c:if test="${avgInt < 5}">
			         	<c:forEach var = "i" begin = "1" end = "${5-avgInt}">
			           		<img src="/img/star/star_white.jpeg">
			         	</c:forEach>
			         	</c:if>
			         </li>
					<li>Ratings: <c:out value="${ avg }"/> star(s) </li>
					<li>Vendor: <i><c:out value="${ product.user.firstName}"/> <c:out value="${ product.user.lastName}"/></i></li>
				</ul>
			</div>
		</div>
<div class="under_p">
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<form:form action="/cart/add/process/${ product.id }" method="post" modelAttribute="product">  
        <label class="form-group">Quantity:
	        <select class="form-control" name="quantity">
				<c:forEach var = "i" begin = "1" end = "100">
	           <option value="${i}"> <c:out value="${i}"/> </option>
	         </c:forEach>
	         </select>
        </label>
    <input type="submit" value="Add to Cart" class="btn btn-primary"/>
</form:form> 

 <div class='sending_area'>
         <h6>Post a comment about this product or this vendor.</h6>
         <form class="send_to" action="/product/review/process/${ product.id }" method="post" >       
           <label class="form-group">Rating:
      <select class="form-control" name="star">
	<c:forEach var = "i" begin = "1" end = "5">
         <option value="${i}"> <c:out value="${i}"/> star(s) </option>
       </c:forEach>
       </select>
    		 </label>
           <div class="form-group">
               <label for="message">Comment:</label>
               <div class="textform"><textarea class="form-control" id="textform_id" name="comment"></textarea></div>
               <input class="btn btn-primary ml-5" id="sub" type="submit" value="Post" >
           </div>  
         </form> 
</div>
<div class="comments">
	 <c:forEach items="${product.reviews}" var="review">
        <p><i><c:out value="${review.user.firstName}"/> wrote: </i><c:out value="${review.comment}"/></p>
        <p>
        	<c:forEach var = "i" begin = "1" end ="${review.star}">
	           	<img src="/img/star/star_yellow.png">
	         	</c:forEach>
	         	<c:if test="${review.star < 5}">
	         	<c:forEach var = "i" begin = "1" end = "${5-review.star}">
	           		<img src="/img/star/star_white.jpeg">
	         	</c:forEach>
			</c:if>
        </p>
        <p>********************************************</p>
     </c:forEach>
</div>
</div>
</div>
	<div class="menuV2">
		
	</div>
</div>
</body>
</html>
