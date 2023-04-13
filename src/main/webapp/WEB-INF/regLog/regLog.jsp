<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration and login Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <style>
body{
    margin: 0px auto;
    background-color: whitesmoke;
    color: white;
    /* padding: 20px; */
}

	.menuH{
		width: 100%;
		height: 20%;
		background-color: whitesmoke;
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

	.menuH4{
		height: 45px;
		width: 100%;
		background-color: gray;
		padding-top: 2px;
		padding-left: 75%;
		padding-top: 8px;
	}
	.content{
		width: 100%;
		background-color: white;
		min-height: 1000px;
	}

	.subcontent{
		width: 60%;
		background-color: white;
		min-height: 1000px;
		display: inline-block;
		margin-bottom: 0px;
		vertical-align: top;
	}

	.product{
		height: 280px;
		width: 99%;
		background-color: white;
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
	
	.menuH1 h3{
		display: inline-block;
		vertical-align: top;
	}
	.menuH1 ul{
		display: inline-block;
		vertical-align: top;
	}
h2{
    width: 30%;
    margin: 10px 0px 10px 35%;
    color: gray;
}

p{
    color: red;
    font-size: 12px;
}
h5{
    width: 30%;
    margin-left: 0px;
}

.cont1{
    padding: 20px;
    text-align: left;
    width: 25%;
    vertical-align: top;
    display: inline-block;
    margin-right: 0.3%;
    margin-left: 10%;
    background-color: #66e0ff;
    border-radius: 20px;

}
.cont2{
    padding: 20px;
    text-align: left;
    width: 25%;
    vertical-align: top;
    display: inline-block;
    margin-right: 0.3%;
    margin-left: 20%;
    background-color: #66e0ff;
    border-radius: 20px;
}
form{
    padding-top: 10px;
    text-align: left;
    width: 100%;
    vertical-align: top;
    display: inline-block;
    margin-right: 0.3%;
    margin-left: 0.3%;

}

#sub{
    margin-left: 0px!important;
    background-color: #4cae51;
    margin-top: 7px!important;
}

	.error{
    		color: red;
    		font-size: 12px;
    	}
 
    </style>
</head>
<body>
<div class="menuH">
	<div class="menuH1">
		<h3 class="col-2"> Welcome!</h3>	
		<ul class="col-9">
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/phone.png"><a href=""> +1.800.000.000</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/chat2.png"><a href="">Chart</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/support.jpeg"><a href="">Support</a></li>
			<li class="btn btn-secondary btn-lg"> <img alt="icon of chat" src="/icon/profile.png"><a href="">My account</a></li>
			<li class="btn btn-secondary btn-lg"><a href="/cart">Cart</a></li>
			<li class="btn btn-secondary btn-lg"><a href="/">Go Back</a></li>
		</ul>	
	</div>


</div>
<div class="menuH4">

</div>
	
        <h2>Login and Registration</h2>
	<div class="cont1">
		<h5>Register here!</h5>
        <p class="error"><form:errors path="user.*"/></p>
        <form:form class="Register" action="/registration" method="POST" modelAttribute="user">    
            <div class="form-group">
                    <form:label path="firstName">First name:</form:label>
                    <form:input type="text" class="form-control" id="first_name" aria-describedby="emailHelp" path="firstName"/>
            </div>
                <div class="form-group">
                        <form:label path="lastName">Last name:</form:label>
                        <form:input type="text" class="form-control" id="last_name" aria-describedby="emailHelp"  path="lastName"/>
                    </div>
                
            <div class="form-group">
                    <form:label path="email">Email:</form:label>
                    <form:input type="text" class="form-control" id="email" aria-describedby="emailHelp" path="email"/>
            </div>

            <div class="form-group">
                    <form:label path="address">Address:</form:label>
                    <form:input type="text" class="form-control" id="email" aria-describedby="emailHelp" path="address"/>
            </div>
            <div class="form-group">
                    <form:label path="state">State:</form:label>
                    <form:input type="text" class="form-control" id="email" aria-describedby="emailHelp" path="state"/>
            </div>
            <div class="form-group">
                    <form:label path="zipCode">Zip Code:</form:label>
                    <form:input type="number" class="form-control" id="email" aria-describedby="emailHelp" path="zipCode"/>
            </div>
            <div class="form-group">
                    <form:label path="password">Password:</form:label>
                    <form:input type="password" class="form-control" id="password" aria-describedby="emailHelp" path="password"/>
            </div> 
            <div class="form-group">
                    <form:label path="passwordConfirmation">Confirm password:</form:label>
                    <form:input type="password" class="form-control" id="confirm_pw" aria-describedby="emailHelp" path="passwordConfirmation"/>
            </div>
              <fieldset class="form-group">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="gridRadios1" value="0" checked/>
                            <label class="form-check-label" for="gridRadios1">
                                User
                            </label>
                            </div>
                            <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" value="2" id="gridRadios2" />
                            <label class="form-check-label" for="gridRadios2">
                                Vendor
                            </label>
                            </div>
                        </div>
                    </div>
                </fieldset> 
            <input class="btn btn-primary ml-5 mt-5" id="sub" type="submit" value="Register!" >
        </form:form>
	</div>
	<div class="cont2">
			<h5>Login here!</h5>
			<p class="error">${ errorLog }</p>
        <form class="login" action="/login" method="POST">       
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" class="form-control" id="email" aria-describedby="emailHelp" name="email">
            </div>
            <div class="form-group">
                <label for="Password">Password:</label>
                <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password">
            </div>  
            <input class="btn btn-primary ml-5 mt-5" id="sub" type="submit" value="Login!" >
        </form>   
        </div>  

</body>
</html>