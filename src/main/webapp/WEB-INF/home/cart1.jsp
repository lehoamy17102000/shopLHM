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
  .create h4{
  	color: red;
  	}
  	
  .welc h3{
 	display: inline-block;
 	vertical-align: top;
 }
  .welc_a{
 	display: inline-block;
 	vertical-align: top;
 	margin-left: 60%;
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
  .cart{
  	width: 80%;
  	margin-left: 10%;
  	min-height: 200px;
  }
    .tax{
  	width: 50%;
  	margin-left: 40%
  }
      .tax #total{
  	font-weight: bold;
  }
  
  /* #############################################  */
  
  
  
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
		padding-left: 82%;
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
		background-color: #ccffff;
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
		background-color: whitesmoke;
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
	.confirm{
		background-color: green;
		width: 30%;
		height: 20%;
		margin-left: 30%;
	}
	.infoDelivery{
		background-color: green;
		width: 80%;
  		margin-left: 10%;
  		border-radius: 20px;
	}
	.cont1{
		display: inline-block;
		vertical-align: top;
		width: 45%;
		margin-left: 3.3%;
	}
	.cont2{
		display: inline-block;
		vertical-align: top;
		width: 45%;
		margin-left: 3.3%;
	}
	.infoDelivery #sub{
		margin-left: 35%!important;
	}
	.bankDelivery{
		margin-left: 10%;
		margin-top: 5%;
		background-color: green;
		border-radius: 20px;
		width: 80%;
	}
	.bankDelivery h5{
		margin-left: 20%;
		margin-bottom: 5%;
	}
	.bankDelivery span{
		width: 40%;
		font-weight: bold;
		
	}
	.zip{
		margin-left: 25%
	}
	.bank{
		width: 45%;
		display: inline-block;
		vertical-align: top;
		margin-left: 5%;
	}
	.delivery{
		width: 45%;
		display: inline-block;
		vertical-align: top;
	}
	.confUpdate{
		margin-left: 30%;
	}
	

</style>
</head>
<body>
<div class="welc">
<div class="menuH">
	<div class="menuH1">
		<h3 class="col-2"> Welcome <c:out value="${ sessionScope.firstName }"/> !</h3>
		
		<ul class="col-9">
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/phone.png"><a href=""> +1.800.000.000</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/support.jpeg"><a href="">Support</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/profile.png"><a href="">My account</a></li>
			<li class="btn btn-secondary btn-lg">
			<c:if test="${user.status == 1}">
			<a href="/admin/products/pages/1">Mode Admin</a>
			</c:if>
			<c:if test="${user.status == 2}">
			<a href="/admin/products/pages/1">Mode Vendor</a>
			</c:if>
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
<a class="btn btn-secondary btn-lg" href="/home/1">Continue Shopping</a>
</div>

</div>

<div class="content">
	<div class="menuV1">
	</div>
	<div class="subcontent">
	<c:if test="${testForm != 3}">
		<div class="cart">
		
		<h1>Cart</h1>
		<table class="table table-striped w-800">
		    <thead>
		        <tr>
		        	<th scope="col">Picture</th>
		            <th scope="col">Name</th>
		            <th scope="col">Description</th>
		            <th scope="col">Price</th>
		            <th scope="col">Quantity</th>
		            <th scope="col">Total</th>
		            <th scope="col">Actions</th>
		        </tr>
		    </thead>
		 
		    <tbody>
		    	<c:if test="${ quantities.size()>0 }">
			        <c:forEach var="i" begin="0" end="${quantities.size() - 1}">
				        <tr>
				            <td><img src="/img/clothe/${ productsOne.get(i).getUrl() }" width="30px" height="30px" alt="picture"></td>
				            <td><c:out value="${productsOne.get(i).getName()}"/></td>
				            <td><c:out value="${productsOne.get(i).getDescription()}"/></td>
				            <td><c:out value="${productsOne.get(i).getPrice()}"/></td>
				            <td><c:out value="${quantities.get(i)}"/></td>
				            <td><c:out value="${quantities.get(i) * productsOne.get(i).getPrice()}"/></td>
				            <td><a href="/cart/updateProduct/${ productsOne.get(i).getId() }">Update</a> <a href="/cart/deleteProduct/${ productsOne.get(i).getId() }">Delete</a></td>
				        </tr>
			        </c:forEach>  
			    </c:if>        
		    </tbody>
		</table>
		
		</div>
		
		<div class="tax">
		<table class="table table-striped w-800">
		     <tr>
		         <td>Total Price without Tax: </td>
		         <td>$<c:out value="${ sumPrice}"/> </td>
		     </tr>
		     <tr>
		         <td>Tax $<c:out value="${ sumPrice }"/> x 10%:</td>
		         <td><c:out value="${ sumPrice * 10/100 }"/> </td>
		     </tr>
		     <tr id="total">
		         <td>Total Price with Tax:</td>
		         <td>$<c:out value="${ sumPrice * 110/100}"/> </td>
		     </tr>   
		</table>
		</div>
		</c:if> 
		
	<div class="infoDelivery">
		<c:if test="${testForm == 0}">
		     <form class="Register" action="/cart/infoPayment/process" method="POST" >    
			     <div class="cont1">
					<h5>Payment information</h5>
					<p class="error">${ errorLog }</p> 
			            <div class="form-group">
			                    <label>Name Card Holder:</label>
			                    <input type="text" class="form-control" id="cardHolder" aria-describedby="emailHelp" name="cardHolder" placeholder="Card Holder"/>
			            </div>
			                <div class="form-group">
			                        <label>Card number:</label>
			                        <input type="number" class="form-control" id="cardNumber" aria-describedby="emailHelp"  name="cardNumber" placeholder="Enter the 16 digits Card Number"/>
			                    </div>
			                
			                <div class="form-group">
			                     <label>Security Code:</label>
			                     <input type="number" class="form-control" id="securityCode" aria-describedby="emailHelp"  name="securityCode" placeholder="Security Code"/>
			                 </div>
			               <div class="form-group">
			                     <label>Expiration Date:</label>
			                     <input type="text" class="form-control" id="cardExpiration" aria-describedby="emailHelp"  name="cardExpiration" placeholder="mm/yyyy"/>
			                 </div>
			
				</div>
				<div class="cont2">
						<h5>Address of delivery</h5>
						<p class="error">${ errorLog }</p> 
			             <div class="form-group">
			                    <label>Address:</label>
			                    <input type="text" class="form-control" id="addressDelivery" aria-describedby="emailHelp" name="addressDelivery" placeholder="Address"/>
			            </div>
			            <div class="form-group">
			                    <label>State:</label>
			                    <input type="text" class="form-control" id="stateDelivery" aria-describedby="emailHelp" name="stateDelivery" placeholder="State"/>
			            </div>
			            <div class="form-group">
			                    <label>Zip Code:</label>
			                    <input type="number" class="form-control" id="zipCodeDelivery" aria-describedby="emailHelp" name="zipCodeDelivery" placeholder="Zip Code"/>
			            </div>
			            <div class="form-check">
						    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" value="true">
						    <label class="form-check-label" for="exampleCheck1">Use my personal address</label>
						  </div>
			            <input class="btn btn-primary ml-5 mt-5" id="sub" type="submit" value="Submit for payment!" >
			       
			     </div>  
			</form> 
		</c:if>
		
		<c:if test="${testForm == 1}">
		     <form class="Register" action="/cart/infoPayment/update/process" method="POST" >    
			     <div class="cont1">
					<h5>Payment information</h5>
					<p class="error">${ errorLog }</p> 
			            <div class="form-group">
			                    <label>Name Card Holder:</label>
			                    <input type="text" class="form-control" id="cardHolder" aria-describedby="emailHelp" name="cardHolder" placeholder="Card Holder" value="${user.checkout.cardHolder }"/>
			            </div>
			                <div class="form-group">
			                        <label>Card number:</label>
			                        <input type="number" class="form-control" id="cardNumber" aria-describedby="emailHelp"  name="cardNumber" placeholder="Enter the 16 digits Card Number" value="${user.checkout.cardNumber }"/>
			                    </div>
			                
			                <div class="form-group">
			                     <label>Security Code:</label>
			                     <input type="number" class="form-control" id="securityCode" aria-describedby="emailHelp"  name="securityCode" placeholder="Security Code" value="${user.checkout.securityCode }"/>
			                 </div>
			               <div class="form-group">
			                     <label>Expiration Date:</label>
			                     <input type="text" class="form-control" id="cardExpiration" aria-describedby="emailHelp"  name="cardExpiration" placeholder="mm/yyyy" value="${user.checkout.cardExpiration }"/>
			                 </div>
			
				</div>
				<div class="cont2">
						<h5>Address of delivery</h5>
						<p class="error">${ errorLog }</p> 
						  
			             <div class="form-group">
			                    <label>Address:</label>
			                    <input type="text" class="form-control" id="addressDelivery" aria-describedby="emailHelp" name="addressDelivery" placeholder="Address" value="${user.checkout.addressDelivery }"/>
			            </div>
			            <div class="form-group">
			                    <label>State:</label>
			                    <input type="text" class="form-control" id="stateDelivery" aria-describedby="emailHelp" name="stateDelivery" placeholder="State" value="${user.checkout.stateDelivery }"/>
			            </div>
			            <div class="form-group">
			                    <label>Zip Code:</label>
			                    <input type="number" class="form-control" id="zipCodeDelivery" aria-describedby="emailHelp" name="zipCodeDelivery" placeholder="Zip Code" value="${user.checkout.zipCodeDelivery }"/>
			            </div>
			            <div class="form-check">
						    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" value="true">
						    <label class="form-check-label" for="exampleCheck1">Use my personal address</label>
						</div>
			     </div>  
			     <input class="btn btn-primary ml-5 mt-5" id="sub" type="submit" value="Submit for payment!" >
			</form> 
		</c:if>
	</div>	
		<c:if test="${testForm == 2}">
		<div class=bankDelivery>
		<h5>Bank Info || Address of Delivery: </h5>
		    <div class="bank">
			    <p><span>Card holder:</span> <c:out value="${ user.checkout.cardHolder }"/></p>
			    <p><span>Card number:</span> <c:out value="${ user.checkout.cardNumber }"/></p>
			    <p><span>Security Code:</span> <c:out value="${ user.checkout.securityCode }"/></p>
			    <p><span>Date Expiration:</span> <c:out value="${ user.checkout.cardExpiration }"/></p>
		    </div>

		    <div class="delivery">
		    	<p><span>Address:</span> <c:out value="${ user.checkout.addressDelivery }"/></p>
			    <p class="zip"><c:out value="${ user.checkout.stateDelivery }"/> <c:out value="${ user.checkout.zipCodeDelivery }"/></p>
		    </div>
		    <div class="confUpdate">
		    <a class="btn btn-primary ml-9" href="/cart/infoPayment/update">Update Info</a> <a class="btn btn-primary ml-2" href="/cart/checkout">Confirm Payment</a>
		    </div>
		    </div>
		</c:if>
		
		<c:if test="${testForm == 3}">
		    <p class="confirm">Transaction complete. <br> Thank you for the payment!</p>    
		</c:if>
		
		</div>
		
		<div class="menuV1">
		</div>
</div>

</body>
</html>