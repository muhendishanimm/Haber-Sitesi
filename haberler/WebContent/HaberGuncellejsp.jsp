<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@page import="java.sql.ResultSet"%>
        <% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link rel="stylesheet" href="menu29/styles.css" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>

</head>
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
        <%
int id=Integer.parseInt(request.getParameter("HbrID"));
String Baslik,Ozet,Icerik,YayimTrh,Resimyol;
int YzrId,KtgId;


ResultSet rs=sayiCrud.haberselectData(id);
if (rs.next()){
	Baslik=rs.getString("Baslik");
	Ozet=rs.getString("Ozet");
	Icerik=rs.getString("Icerik");
	YayimTrh=rs.getString("YayimTrh");
    Resimyol=rs.getString("Resimyol");
	KtgId=rs.getInt("KtgId");
	YzrId=rs.getInt("YzrId");
	session.setAttribute("HbrID",id);
    System.out.println(Baslik);
    System.out.println(Ozet);
    System.out.println(Icerik);
    System.out.println(YayimTrh);
%>
<div class="container">
  <form action="HaberUpdate_Islem.jsp" method="post">
   <div>
   <label>Baslık </label>
	<div> 
        <input type="text" style="width: 400px; height: 40px;" class="form-control" id="Baslik" name="Baslik" value="<%=rs.getString("Baslik")%>"/>    
    </div>
     <label>Özet</label>
    <div> 
        <input type="text" style="width: 400px; height: 40px;" class="form-control" id="Ozet" name="Ozet" value="<%=rs.getString("Ozet")%>"/>    
    </div>
      <label>İçerik</label>
    <div> 
        <input type="text" style="width: 400px; height: 40px;" class="form-control" id="Icerik" name="Icerik" value="<%=rs.getString("Icerik")%>"/>    
    </div>
        <label>Yayim Tarihi</label>
     <div> 
        <input type="text" style="width: 400px; height: 40px;" class="form-control" id="YayimTrh" name="YayimTrh" value="<%=rs.getString("YayimTrh")%>"/>    
    </div>
      <div> 
        <input type="hidden" class="form-control" id="yzr" name="yzr" value="<%=rs.getInt("YzrId")%>"/>    
    </div> 
    <div> 
        <input type="hidden" class="form-control" id="ktg" name="ktg" value="<%=rs.getInt("KtgId")%>"/>    
    </div>
     <div> 
      <input type="hidden" class="form-control" id="secresim" name="secresim" value="<%=rs.getString("Resimyol")%>" />
       </div>
       <label>Kategori</label>
       <div>
       <select id="KategoriID" style="width: 400px; height: 40px;" >
     	<%
     	
    	ResultSet rss=sayiCrud.selectAllData();     	
      	while(rss.next()) 
      	{       	
		%>
		
		<%if (rss.getInt("KategoriID")==KtgId){ %>
      	<option value="<%=rss.getInt("KategoriID")%>" selected="selected"><%=rss.getString("KtgAdi")%></option>
      		
      	<%} else{%>
      	<option value="<%=rss.getInt("KategoriID")%>"><%=rss.getString("KtgAdi")%></option>
      	<%}} %></select>

<script>
$(function(){
$("#KategoriID").change(function() {
var deger = $(this).val();
$("#ktg").val(deger);
});
})
</script>
</div>
<label>Yazar Adı-Soyadı</label>
<div>
<select id="YzrID" style="width: 400px; height: 40px;">
     	<%
     	
    	ResultSet rsy=sayiCrud.yazarselectAllData();     	
      	while(rsy.next()) 
      	{       	
		%>
		
		<%if (rsy.getInt("YzrID")==YzrId){ %>
      	<option value="<%=rsy.getInt("YzrID")%>" selected="selected"><%=rsy.getString("AdSoyad")%></option>
      		
      	<%} else{%>
      	<option value="<%=rsy.getInt("YzrID")%>"><%=rsy.getString("AdSoyad")%></option>
      	<%}} }%></select>

<script>
$(function(){
$("#YzrID").change(function() {
var deger = $(this).val();
$("#yzr").val(deger);
});
})
</script>
</div>
<label>Resim</label>
       <div>
        <input type="file" style="width: 400px; height: 40px;" id="resim" name="resim" >
       </div>


<script>
$(function(){
$("#resim").change(function() {
var files = $("#resim").get(0).files;
document.getElementById("resim").files[0].name; }); }) 
});
})
</script>

    <div style="margin-top:20px">
         <button type="submit"id="btn1" name="save">Update<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></button>
    </div>
    </div>
  </form>
</div>
 <script>
        $('#btn1').click(function () {
            alert('Güncelleme İşlemi Başarı İle Gerçekleşti')
        });
    </script>
</body>
</html>