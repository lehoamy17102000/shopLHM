<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Create Page</title>
<style type="text/css">
	.cont1{
    padding-top: 10px;
    text-align: left;
    width: 40%;
    vertical-align: top;
    display: inline-block;
    margin-right: 0.3%;
    margin-left: 5%;
    background-color: #008055;
    border-radius: 20px;
    padding: 3%;
	}
	.link{
		margin-left: 10%;
	}
	.logout{
		margin-left: 70%;
	}
	  .welc_a{
 	display: inline-block;
 	vertical-align: top;
 	margin-left: 60%;
 }
 
 
 
   /* ########################################## */
  
  .menuH{
		width: 100%;
		height: 20%;
		background-color: #e6ffe6;
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
		padding-left: 45%;
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
		margin-top: 0px;
		margin-bottom: 1px;
	}
 	.imag{
		height: 280px;
		width: 39%;
		background-color: #3fa5eb;
		display: inline-block;
		vertical-align: top;
	}
	.caract{
		height: 280px;
		width: 60%;
		background-color: yellow;
		display: inline-block;
		vertical-align: top;
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
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/phone.png"><a href=""> +1.800.000.001</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/chat2.png"><a href="">Chat</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/support.jpeg"><a href="">Support</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/profile.png"><a href="">My account</a></li>
			<li class="btn btn-secondary btn-lg"><a href="/home">Mode User</a></li>
			<li class="btn btn-secondary btn-lg"><a href="/logout">Logout</a></li>
		</ul>	
	</div>
	<div class="menuH2">
	
	</div>
	
	<div class="menuH3">
		
	</div>

</div>
<div class="menuH4">
	<c:out value= "${successMessage}"/>
</div>

<div class="content">
	<div class="menuV1">
	</div>
	<div class="subcontent">

<div class="cont1">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 


	<c:if test="${user.status == 1}">
		<h1>New Category</h1>
		<form:form action="/admin/categories/new/process" method="post" modelAttribute="category">
		    <p class="form-group">
		        <form:label path="name">Name:</form:label>
		        <form:errors path="name"/>
		        <form:input class="form-control" path="name"/>
		    </p>
		    <input type="submit" value="Create" class="btn btn-primary ml-5 mt-5"/>
		    <a href="/admin/products/pages/1" class="btn btn-primary ml-5 mt-5">Cancel</a>
		</form:form>
	</c:if>
	<c:if test="${user.status != 1}">
		<p>Create a new product</p>
	</c:if>
</div>
<div class="cont1">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<h1>New Product</h1>
<form:form action="/admin/products/new/process" method="post" modelAttribute="product">
    <p class="form-group">
        <label>Category:
	        <select class="form-control" name="cat_id">
				<c:forEach items="${categories}" var="cat">
	           <option value="${ cat.id }"> <c:out value="${cat.name}"/> </option>
	         </c:forEach>
	         </select>
        </label>
    </p>
    <p class="form-group">
        <form:label path="quantity">Quantity:</form:label>
	        <form:select class="form-control" path="quantity">
				<c:forEach var = "i" begin = "1" end = "100">
	           <option value="${i}"> <c:out value="${i}"/>
	         </c:forEach>
	       	</form:select>
    </p>
    <p class="form-group">
        <form:label path="name">Name:</form:label>
        <form:errors path="name"/>
        <form:input class="form-control" path="name"/>
    </p>
    <p class="form-group">
        <form:label path="url">Link image of product:</form:label>
        <form:errors path="url"/>
        <form:input class="form-control" path="url"/>
    </p>
    <p class="form-group">
        <form:label path="description">Description:</form:label>
        <form:errors path="description"/>
        <form:input class="form-control" path="description"/>
    </p>
    <p class="form-group">
        <form:label path="price">Price:</form:label>
        <form:errors path="price"/>
        <form:input class="form-control" type="number" path="price"/>
    </p>  
    <input type="submit" value="Create" class="btn btn-primary ml-5 mt-5"/>
    <a href="/admin/products/pages/1" class="btn btn-primary ml-5 mt-5">Cancel</a>
</form:form> 
</div>
</div>
	<div class="menuV2">
		
	</div>
</div>
</body>
</html>