<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Bootstrap News Template - Free HTML Templates</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Bootstrap News Template - Free HTML Templates" name="keywords">
        <meta content="Bootstrap News Template - Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="template/img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap" rel="stylesheet"> 

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="template/lib/slick/slick.css" rel="stylesheet">
        <link href="template/lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="template/css/style.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="Login_v18/css/dene.css">   
          <jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
    </head>

    <body>
    
        <!-- Top Bar Start -->
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tb-contact">
                            <p><i class="fas fa-envelope"></i>DunyadanBirHaber@gmail.com</p>
                            <p><i class="fas fa-phone-alt"></i>Whatsapp İHbar Hattı:+90 555 666 77 88</p>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Top Bar Start -->
        
        <!-- Brand Start -->
        <div class="brand">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4">
                        <div class="b-logo">
                            <a href="index.html">
                                <img src="template/img/logo.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4">
                        <div class="b-search">
                            <input type="text" placeholder="Search">
                            <button><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Brand End -->

        <!-- Nav Bar Start -->
        <div class="nav-bar">
            <div class="container">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
            

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="" class="nav-item nav-link active">Gündem</a>
                        </div>
                       
                    </div>
                </nav>
            </div>
        </div>

<%

int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
String KullaniciAdi;
String Sifre;

ResultSet rs=sayiCrud.uyeSifreselectData(id);
if (rs.next()){
	KullaniciAdi=rs.getString("UyeKullaniciAdi");
	Sifre=rs.getString("UyeSifre");
	session.setAttribute("UyeID",id);
	System.out.println(id);
}
%>
        <div class="container">
  <form action="UyeSifreUpdate_Islem.jsp">
    <label for="usrname"> Adi</label>
   
    <input type="text" id="adminka" value="<%=rs.getString("UyeKullaniciAdi")%> " name="UyeKullaniciAdi"  disabled="disabled">
    
 <label for="usrname">Eski Sifre </label>
     <input type="password" id="eskiSifre" name="eskiSifre"  required>
  <%
    String eskisifre = request.getParameter("eskiSifre");
    		

    %>

      <label for="psw">Yeni Sifre </label>
  <input type="password" id="yeniSifre" name="yeniSifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"  required>
    
      <label for="psw">Yeni Sifre Tekrar  </label>
  <input type="password" id="yeniSifretekrar" name="yeniSifreTekrar"  required>
    
   <input type="submit" class="btn btn-primary" value="Submit">
  </form>
   <div id="message">
  <h3>Parola aşağıdakileri içermelidir:</h3>
  <p id="kucukharf" class="invalid"><b>Küçük Harf</b> </p>
  <p id="buyukharf" class="invalid"><b>Büyük Harf</b></p>
  <p id="rakam" class="invalid"><b>Rakam</b></p>
 <p id="length" class="invalid"> <b>En az8 karakter</b></p>
</div>
   <script>
var myInput = document.getElementById("yeniSifre");
var kucukharf = document.getElementById("kucukharf");
var buyukharf = document.getElementById("buyukharf");
var rakam = document.getElementById("rakam");
var length = document.getElementById("length");

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
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>

   <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="template/lib/easing/easing.min.js"></script>
        <script src="template/lib/slick/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="template/js/main.js"></script>

</body>
</html>
