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
	.create{
		margin-bottom: 20px;
	}

	.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}
img{
	margin-left: 0px;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #2196F3;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

  .create{
  	margin-left: 40%;
  }
  .create h4{
  	color: red;
  	}
  	
  .welc h3{
 	display: inline-block;
 	vertical-align: top;
 }


@media screen and (max-width: 600px) {
	  .topnav .search-container {
	    float: none;
	  }
	  .topnav a, .topnav input[type=text], .topnav .search-container button {
	    float: none;
	    display: block;
	    text-align: left;
	    width: 100%;
	    margin: 0;
	    padding: 14px;
	  }
	  .topnav input[type=text] {
	    border: 1px solid #ccc;  
	  }
  }
  table{
  	margin-bottom: 40px;
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
		background-color: whitesmoke;
		min-height: 1000px;
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
		background-color: #e6ffe6;
		min-height: 1000px;
		display: inline-block;
		margin-bottom: 0px;
		vertical-align: top;
	}
	.menuV2{
		width: 19%;
		background-color: whitesmoke;
		min-height: 1000px;
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
	.dig{
		margin-left: 60%;
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
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/phone.png"><a href=""> 09445086129</a></li>
<%--			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/chat2.png"><a href="">Chat</a></li>--%>
<%--			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/support.jpeg"><a href="">Support</a></li>--%>
<%--			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/profile.png"><a href="">My account</a></li>--%>
			<li class="btn btn-secondary btn-lg"><a href="/home">Mode User</a></li>
			<li class="btn btn-secondary btn-lg"><a href="/logout">Logout</a></li>
		</ul>	
	</div>
	<div class="menuH2">
	
	</div>
	
	<div class="menuH3">
		<div class="search-container">
		    <form action="/admin/process/search" method="post" class="input-group md-form form-sm form-2 pl-0" id="searchid">
		      <input class="form-control my-0 py-1 lime-border" type="text" placeholder="Search.." name="search">
		      <button class="btn btn-primary" type="submit"><i class="fa fa-search">GO</i></button>
		    </form>
  		</div>
  		<h4><c:out value="${ noResult }"/></h4>
	</div>

</div>
<div class="menuH4">
<c:forEach begin="1" end="${totalPages}" var="index">
  <a href="/admin/products/pages/${index}">| ${index}</a>
</c:forEach>
</div>
<div class="content">
	<div class="menuV1">
	</div>
	<div class="subcontent">
		<div class="create"> 
			<a href="/admin/createProduct/">Create Product or Category</a> || <c:if test="${user.status == 1}"><a href="/admin/users/pages/1">Manage Users</a> || </c:if><a href="/admin/categories/add">Add products into categories</a>
		</div>
		
		
		<h1>Products</h1>
		<div class="dig">
		<c:forEach begin="1" end="${totalPages}" var="index">
		  <a href="/admin/products/pages/${index}">| ${index}</a>
		</c:forEach>
		</div>
		<table class="table table-striped w-800">
		    <thead>
		        <tr>
		            <th scope="col">Picture</th>
		            <th scope="col">Name</th>
		            <th scope="col">Description</th>
		            <th scope="col">Price</th>
		            <th scope="col">Category Count</th>
		            <th scope="col">Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:if test="${test == 0}">
			        <c:forEach items="${products}" var="prod">
				        <c:if test="${user.status == 1 || prod.user.id == user.id}">
					        <tr>
					            <td><img src="/img/clothe/${ prod.url }" width="30px" height="30px" alt="picture"></td>
					            <td><c:out value="${prod.name}"/></td>
					            <td><c:out value="${prod.description}"/></td>
					            <td><c:out value="${prod.price}"/></td>
					            <td><c:out value="${prod.categories.size()}"/> categories</td>
					            <td><a href="/admin/updateProduct/${ prod.id }">Update</a> <a href="/admin/deleteProduct/${ prod.id }">Delete</a></td>
					        </tr>
				        </c:if>
			        </c:forEach>
		        </c:if>
		        
		        
		        <c:if test="${test == 1}">
			        <c:forEach items="${products.content}" var="prod">
				        <c:if test="${user.status == 1 || prod.user.id == user.id}">
					        <tr>
					            <td><img src="/img/clothe/${ prod.url }" width="30px" height="30px" alt="picture"></td>
					            <td><c:out value="${prod.getName()}"/></td>
					            <td><c:out value="${prod.description}"/></td>
					            <td><c:out value="${prod.price}"/></td>
					            <td><c:out value="${prod.categories.size()}"/> categories</td>
					            <td><a href="/admin/updateProduct/${ prod.id }">Update</a> <a href="/admin/deleteProduct/${ prod.id }">Delete</a></td>
					        </tr>
				        </c:if>
			        </c:forEach>
		        </c:if>
		    </tbody>
		</table>
		<h1>Categories</h1>
		<table class="table table-striped w-800">
		    <thead>
		        <tr>
		            <th scope="col">Category Name</th>
		            <th scope="col">Product Count</th>
		            <c:if test="${user.status == 1}">
		            <th scope="col">Actions</th>
		            </c:if>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items="${categories}" var="cat">
		        <tr>
		            <td><c:out value="${cat.name}"/></td>
		            <td><c:out value="${cat.products.size()}"/> products</td>
		            <c:if test="${user.status == 1}">
		            	<td><a href="/admin/updateCategory/${ cat.id }">Update</a> <a href="/admin/deleteCategory/${ cat.id }">Delete</a></td>
		            </c:if>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
	<div class="menuV2">
		
	</div>
</div>
</body>
</html>
