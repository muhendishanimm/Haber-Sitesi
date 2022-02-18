<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dünyadan Bir Haber</title>
<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link rel="stylesheet" href="menu29/styles.css" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

</head>

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
   <%
int  YzrID=Integer.parseInt(request.getParameter("YzrID"));
String AdSoyad, Telefon, Mail;
int KtgId;
ResultSet rs=sayiCrud.yazarselectData( YzrID);
if (rs.next()){
	AdSoyad=rs.getString("AdSoyad");
	Telefon=rs.getString("Telefon");
	Mail=rs.getString("Mail");
	KtgId=rs.getInt("KtgId");
	session.setAttribute("YzrID", YzrID);

%>
<div class="container">
  <form action="YzrUpdate_Islem.jsp" method="post">
   <div>
   <label>Ad Soyad</label> 
        <input type="text" style="width: 400px; height: 40px;" class="form-control" id="AdSoyad" name="AdSoyad" value="<%=rs.getString("AdSoyad")%>"/>
      
    </div>
    <label>Telefon</label>
	<div> 
        <input type="text" style="width: 400px; height: 40px;"class="form-control" id="Telefon" name="Telefon" value="<%=rs.getString("Telefon")%>"/>
      
    </div>
    <label>Mail</label>
	<div> 
        <input type="email" style="width: 400px; height: 40px;" class="form-control" id="Mail" name="Mail" value="<%=rs.getString("Mail")%>"/>
      
    </div>
    <div> 
        <input type="hidden" style="width: 400px; height: 40px;" class="form-control" id="ktg" name="ktg" value="<%=rs.getString("KtgId")%>"/>
      
    </div>
    <label>Yazdığı Kategori</label>
    <div> 
   	<select id="KategoriID" style="width: 400px; height: 40px;">
   		<% 
    
	ResultSet rss=sayiCrud.selectAllData();
  	while(rss.next()) 
  	{  if(rss.getInt("KategoriID")==KtgId){%> 
    <option value="<%=rss.getInt("KategoriID")%>" selected="selected"><%=rss.getString("KtgAdi")%></option>
  	<% }else{%>
  	 <option value="<%=rss.getInt("KategoriID")%>" ><%=rss.getString("KtgAdi")%></option>
  		<%}}} %></select>	
<script>
$(function(){
$("#KategoriID").change(function() {
var deger = $(this).val();
$("#ktg").val(deger);
});
})

</script>    
    <div style="margin-top:20px">
           <button type="submit" name="save">Update<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></button>
    </div>
    </div>
  </form>
</div>
</body>
</html>