<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <title>Dünyadan Bir Haber</title>
   <meta charset="utf-8">
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link rel="stylesheet" href="menu29/styles.css" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
                <li><a href="Haberler.jsp" ><span>Haberler</span></a></li>
                <li><a href="Kategoriler.jsp" ><span>Kategoriler</span></a></li>
                <li><a href="Yazarlar.jsp" ><span>Yazarlar</span></a></li>
                <li><a href="" ><span>Yorumlar</span></a></li>
                <li>
                <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><span><%=rs.getString("KullaniciAdi")%></span></a>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item"><span>Bilgilerimi Güncelle</span></a>
                                    <a href="#" id="Log-out-li" class="dropdown-item"><span>Çıkış</span></a>
                                </div>
                           </div>
                    </li>
            </ul>
        </div>
        <br><br>
   <div class="container">
    <form action="Ekle_islem.jsp" class="form-group" method="post" >
    <div class="form-group">
<label>Kategori Adi</label>
<div> 
        <input type="text" style="width: 200px; height: 40px;" class="form-control" id="KtgAdi" name="KtgAdi" required=""/>
     
    </div>
 <div style="margin-top:20px">
        <button class="btn btn-info" id="btn1">Kategori Ekle</button>
    </div> 
    </div>  
</form>
 </div>
</body>
</html>

