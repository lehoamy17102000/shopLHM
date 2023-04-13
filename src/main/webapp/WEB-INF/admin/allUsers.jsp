<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Admin Page</title>
<style type="text/css">
	h3{
		margin-bottom: 20px;
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
		padding-left: 75%;
		padding-top: 8px;
	}
	.content{
		width: 100%;
		background-color: gray;
		min-height: 900px;
	}
	.menuV1{
		width: 20%;
		background-color: gray;
		min-height: 100%;
		display: inline-block;
		vertical-align: top;
	}
	.subcontent{
		width: 60%;
		background-color: #e6ffe6;
		min-height: 1000px;
		display: inline-block;
		margin-bottom: 0px;
		vertical-align: top;
	}
	.menuV2{
		width: 19%;
		background-color: gray;
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
	.manage{
		margin-left: 70%;
	}
	.page{
		margin-left: 70%;
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

</div>

<div class="content">
	<div class="menuV1">
	</div>
	<div class="subcontent">
	<div class="manage"> || <a href="/admin/products/pages/1">Manage Products</a> ||
	</div>

<h1>List of Users</h1>
<div class="page">
	<c:forEach begin="1" end="${totalPages}" var="index">
  		| <a href="/admin/users/pages/${index}">${index}</a>
	</c:forEach>
</div>

<table class="table table-striped w-800">
    <thead>
        <tr>
        	<th scope="col">Status</th>
            <th scope="col">First name</th>
            <th scope="col">Last name</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">State</th>
            <th scope="col">Zip Code</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
    	<c:if test="${test == 0}">
    	<c:forEach items="${users}" var="user">
        <tr>
            <td><a href="/admin/users/status/${ user.status }">
	            <c:if test="${user.status == 1}">Admin</c:if>
	            <c:if test="${user.status == 2}">Vendor</c:if>
	            <c:if test="${user.status == 0}">User</c:if> 
            </a></td>
            <td><c:out value="${user.firstName}"/></td>
            <td><c:out value="${user.lastName}"/></td>
            <td><a href="/admin/users/email/${user.email}"><c:out value="${user.email}"/></a></td>
            <td><c:out value="${user.address}"/></td>
            <td><a href="/admin/users/state/${user.state}"><c:out value="${user.state}"/></a></td>
            <td><a href="/admin/users/zipCode/${user.zipCode}"><c:out value="${user.zipCode}"/></a></td>
            <td><a href="/admin/deleteUser/${user.id}">Delete</a></td>
        </tr>
        </c:forEach>
    	</c:if>
    	<c:if test="${test == 1}">
    	<c:forEach items="${users.content}" var="user">
        <tr>
            <td><a href="/admin/users/status/${ user.status }"><c:out value="${user.status}"/></a></td>
            <td><c:out value="${user.firstName}"/></td>
            <td><c:out value="${user.lastName}"/></td>
            <td><a href="/admin/users/email/${user.email}"><c:out value="${user.email}"/></a></td>
            <td><c:out value="${user.address}"/></td>
            <td><a href="/admin/users/state/${user.state}"><c:out value="${user.state}"/></a></td>
            <td><a href="/admin/users/zipCode/${user.zipCode}"><c:out value="${user.zipCode}"/></a></td>
            <td>
            	<c:if test="${user.status !=1}"><a href="/admin/deleteUser/${user.id}">Delete</a></c:if>
            </td>
        </tr>
        </c:forEach>
    	</c:if>
        
    </tbody>
</table>
	</div>
	<div class="menuV2">
		
	</div>
</div>
</body>
</html>