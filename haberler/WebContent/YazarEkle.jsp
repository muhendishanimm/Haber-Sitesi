<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
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
</head>
 <link href="template/denemecss.css" rel="stylesheet">
 <jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
 <%

int idd=Integer.parseInt(String.valueOf(session.getAttribute("KullaniciID")));
String KullaniciAdi;
String Sifre;

ResultSet rskul=sayiCrud.kullaniciSifreselectData(idd);
if (rskul.next()){
	KullaniciAdi=rskul.getString("KullaniciAdi");
	Sifre=rskul.getString("Sifre");
	session.setAttribute("KullaniciID",idd);
	System.out.println(idd);
}
%>
<body>

  <div id="tabs">
                <ul class="nav navbar-nav">
                <li><a ><span>Dünyadan Bir Haber</span></a></li>
                <li><a href="Haberler.jsp" ><span>Haberler</span></a></li>
                <li><a href="Kategoriler.jsp" ><span>Kategoriler</span></a></li>
                <li><a href="Yazarlar.jsp" ><span>Yazarlar</span></a></li>
                <li><a href="Uyeler.jsp" ><span>Uyeler</span></a></li>
                <li><a href="Yorumlar.jsp" ><span>Yorumlar</span></a></li>
               <li>
                <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><span><%=rskul.getString("KullaniciAdi")%></span></a>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item"><span>Bilgilerimi Güncelle</span></a>
                                    <a href="#" id="Log-out-li" class="dropdown-item"><span>Çıkış</span></a>
                                </div>
                           </div>
                 </li>
            </ul>
        </div>
   <div class="container">
   <div><br><br></div>

<form action="YazarEkle_Islem.jsp" class="form-group" method="post">
<label>Yazar Adı-Soyadı</label>
<div> 
        <input type="text" style="width: 400px; height: 40px;"  class="form-control" id="AdSoyad" name="AdSoyad" required="" />
      
    </div>
 	<label>Telefon Numarası</label>
<div> 
        <input type="text" style="width: 400px; height: 40px;" class="form-control" id="Telefon" name="Telefon" placeholder="05XXXXXXXXX"required="" maxlength="11"/>
      
    </div>
    <label>Mail Adresi</label>
<div> 
        <input type="email" style="width: 400px; height: 40px;" class="form-control" id="Mail" name="Mail" placeholder="ornek@gmail.com" required="" />
      
    </div>
     <label>Yazdığı Kategori</label>
    <div> 
   	<select id="KategoriID" style="width: 400px; height: 40px;" >
   		<% 

	ResultSet rs=sayiCrud.selectAllData();
  	while(rs.next()) 
  	{ %> 
  <option value="<%=rs.getInt("KategoriID")%>"><%=rs.getString("KtgAdi")%></option>
  	<% } %></select>
<script>
$(function(){
$("#KategoriID").change(function() {
var deger = $(this).val();
$("#ktg").val(deger);
});
})
</script>

  <div> 
     <input type="hidden" class="form-control" id="ktg" name="ktg" value="3487" />
       </div>
   
 <div style="margin-top:20px">
         <button type="submit" name="save">Insert<span class="glyphicon glyphicon-check" style="font-size:24px; color:Navy;"></span></button>
    </div>
    </div>

 
</form> 
  </div>
</body>
</html>