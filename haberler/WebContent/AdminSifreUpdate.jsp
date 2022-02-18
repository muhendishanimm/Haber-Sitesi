<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<title>Dünyadan Bir Haber</title>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <link rel="stylesheet" href="menu29/styles.css" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="Login_v18/css/dene.css">
</head>
<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
<%

int id=Integer.parseInt(String.valueOf(session.getAttribute("KullaniciID")));
String KullaniciAdi;
String Sifre;

ResultSet rs=sayiCrud.kullaniciSifreselectData(id);
if (rs.next()){
	KullaniciAdi=rs.getString("KullaniciAdi");
	Sifre=rs.getString("Sifre");
	session.setAttribute("KullaniciID",id);
	System.out.println(id);
}
%>

<body>

   <div id="tabs">
                <ul class="nav navbar-nav">
                <li><a ><span>Dünyadan Bir Haber</span></a></li>
                <li><a href="#" ><span>Haberler</span></a></li>
                <li><a href="#" ><span>Kategoriler</span></a></li>
                <li><a href="#" ><span>Yazarlar</span></a></li>
                <li><a href="#" ><span>Uyeler</span></a></li>
                <li><a href="" ><span>Yorumlar</span></a></li>
                <li id="Log-out-li"><a href=""><span>Çıkış</span></a></li>
            </ul>
        </div>
    <br><br>
        <div class="container">
  <form action="AdminSifreUpdate_Islem.jsp">
    <label for="usrname"> Kullanıcı Adı</label>
   
    <input type="text" id="KullaniciAdi" value="<%=rs.getString("KullaniciAdi")%> " name="KullaniciAdi" required disabled="disabled">
      <input type="hidden" id="deger" value="0" name="deger" required>
    
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
  <p id="kucukharf" class="invalid"><b>kucukharf</b> </p>
  <p id="buyukharf" class="invalid"><b>buyukharf</b></p>
  <p id="rakam" class="invalid"><b>rakam</b></p>
  <p id="uzunluk" class="invalid">En az <b>8 karakter</b></p>
</div>
</div>
   <script>
var myInput = document.getElementById("yeniSifre");
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

</body>
</html>
