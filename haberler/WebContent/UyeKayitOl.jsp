<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <title>Dünyadan Bir Haber</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Login_v18/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login_v18/css/main.css">
	<link rel="stylesheet" type="text/css" href="Login_v18/css/dene.css">
<!--===============================================================================================-->

</head>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="UyeKayitOl_Islem.jsp" class="login100-form validate-form" method="post">
					<span class="login100-form-title p-b-43">
						Uye Kayıt Ol 
					</span>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input  type="email" class="input100" type="text" name="UyeMail">
						<span class="focus-input100"></span>
						<span class="label-input100">Mail Adresi</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="UyeKullaniciAdi">
						<span class="focus-input100"></span>
						<span class="label-input100">Kullanıcı Adi</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
					    <input class="input100" type="password" id="UyeSifre" name="UyeSifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" >
						<span class="focus-input100"></span>
						<span class="label-input100">Şifre</span>
					
						
					</div>
					<div class="wrap-input100 validate-input" data-validate="Password is required">
					    <input class="input100" type="password" name="UyeSifreTekrar">
						<span class="focus-input100"></span>
						<span class="label-input100">Şifre Tekrar</span>
						
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							
						</div>
						
					</div>
					<div class="container-login100-form-btn">
						  <input type="submit" class="btn btn-primary" value="Submit">
					</div>
					</form>	
					
					<div class="login100-more" style="background-image: url('Login_v18/images/bg-01.jpg');">
				<div id="message">
  <h3>Parola aşağıdakileri içermelidir:</h3>
  <p id="kucukharf" class="invalid"><b>kucukharf</b> </p>
  <p id="buyukharf" class="invalid"><b>buyukharf</b></p>
  <p id="rakam" class="invalid"><b>rakam</b></p>
  <p id="uzunluk" class="invalid">En az <b>8 karakter</b></p>
</div>
 <script>
var myInput = document.getElementById("UyeSifre");
var kucukharf = document.getElementById("kucukharf");
var buyukharf = document.getElementById("buyukharf");
var rakam = document.getElementById("rakam");
var uzunluk = document.getElementById("uzunluk");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate kucukharfgonderme
  var kucukharfgonderme = /[a-z]/g;
  if(myInput.value.match(kucukharfgonderme)) {
	  kucukharf.classList.remove("invalid");
	  kucukharf.classList.add("valid");
  } else {
	  kucukharf.classList.remove("valid");
	  kucukharf.classList.add("invalid");
}

  // Validate buyukharfgonderme
  var buyukharfgonderme = /[A-Z]/g;
  if(myInput.value.match(buyukharfgonderme)) {
	  buyukharf.classList.remove("invalid");
	  buyukharf.classList.add("valid");
  } else {
	  buyukharf.classList.remove("valid");
	  buyukharf.classList.add("invalid");
  }

  // Validate rakamlar
  var rakamlar = /[0-9]/g;
  if(myInput.value.match(rakamlar)) {
	  rakam.classList.remove("invalid");
	  rakam.classList.add("valid");
  } else {
	  rakam.classList.remove("valid");
	  rakam.classList.add("invalid");
  }

  // Validate length
  if(myInput.value.uzunluk >= 8) {
	  uzunluk.classList.remove("invalid");
	  uzunluk.classList.add("valid");
  } else {
	  uzunluk.classList.remove("valid");
	  uzunluk.classList.add("invalid");
  }
}
</script>
			</div>
				</div>
				
		</div>
	</div>
 
<!--===============================================================================================-->
	<script src="Login_v18/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/bootstrap/js/popper.js"></script>
	<script src="Login_v18/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/daterangepicker/moment.min.js"></script>
	<script src="Login_v18/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/js/main.js"></script>

</body>
    </html>

