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
           
    <jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
</head>
<%

int id=Integer.parseInt(String.valueOf(session.getAttribute("KullaniciID")));
String KullaniciAdi;
String Sifre;

ResultSet rskul=sayiCrud.kullaniciSifreselectData(id);
if (rskul.next()){
	KullaniciAdi=rskul.getString("KullaniciAdi");
	Sifre=rskul.getString("Sifre");
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
      <form action="KategoriAra.jsp" method="post" >
<select id="KategoriID" style="width: 200px; height: 30px;" >  	    
   	<% 

	ResultSet rsk=sayiCrud.selectAllData();
  	while(rsk.next()) 
  	{ %> 
  <option  value="<%=rsk.getString("KtgAdi")%>"  ><%=rsk.getString("KtgAdi")%></option>
  	<% } %> glyphicon glyphicon-search
</select>
<input type="hidden" class="form-control" id="ktg" name="ktg"  />
<button type="submit" name="save"><span class="glyphicon glyphicon-search" style="font-size:24px; color:LightCoral;"></span></button>

<script>
$(function(){
$("#KategoriID").change(function() {
var deger = $(this).val();
$("#ktg").val(deger);
});
})
</script>

</form>
      <br><br>
      <table class="table table-bordered">
        
       <tr>
        <th>KATEGORI ADI</th>
        <th>GUNCELLE</th>
        <th>SIL</th>
    </tr>

  <% 
  ResultSet rs=sayiCrud.selectAllData();
  while(rs.next()) { %>
  <tr>
    <td><%=rs.getString("kategori.KtgAdi") %></td>
  
    <td><a href='KategoriUpdate.jsp?KategoriID=<%=rs.getString("KategoriID")%>'>Update<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
    <td><a href='KategoriSil.jsp?KategoriID=<%=rs.getString("KategoriID")%>'>Delete<span class="glyphicon glyphicon-remove" style="font-size:24px; color:red;"></span></a></td>
  
  </tr>
  <%} %>

</table>
<a href="Ekle.jsp">Insert<span class="glyphicon glyphicon-check" style="font-size:24px; color:Navy;"></span></a> 

</div>
</body>
</html>