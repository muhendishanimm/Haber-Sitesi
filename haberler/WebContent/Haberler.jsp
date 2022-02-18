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
                                    <a href="AdminSifresiniGuncellesin.jsp" class="dropdown-item"><span>Bilgilerimi Güncelle</span></a>
                                    <a href="AdminCikis.jsp" id="Log-out-li" class="dropdown-item"><span>Çıkış</span></a>
                                </div>
                           </div>
                 </li>
            </ul>
        </div>
        
        <div class="container"> 
    <form action="HaberAra.jsp" method="post">
    <div>
    <label>Arama Yapınız:</label>
    <input type="text" style="width: 400px; height: 40px;"  class="form-control" name="search" />
    <button type="submit" name="save"><span class="glyphicon glyphicon-search" style="font-size:24px; color:LightCoral;"></span></button>
    </div>
    </form  >
        <div><br><br></div>
        <div   id="pdflistesi">
 
     <table class="table table-bordered">
              
       <tr>
        <th>BASLIK</th>
        <th>OZET</th>
        <th>ICERIK</th>
        <th>YAYIMLANMA TARIHI</th>
        <th>YAZAR</th>
        <th>KATEGORI</th>
        <th>RESIM</th>
        <th>GUNCELLE</th>
        <th>SIL</th>
    </tr>
            
  <% 
  ResultSet rs=sayiCrud.haberselectAllData();
  while(rs.next()) { %>
  <tr>
    <td><%=rs.getString("Baslik") %></td>
    <td><%=rs.getString("Ozet") %></td>
    <td><%=rs.getString("Icerik") %></td>
    <td><%=rs.getString("YayimTrh") %></td>
    <td><%=rs.getString("AdSoyad") %></td>
    <td><%=rs.getString("KtgAdi") %></td>
    <td> <img src="<%=rs.getString("Resimyol") %>" width="100" height="100"/></td>
    <td><a href='HaberGuncellejsp.jsp?HbrID=<%=rs.getString("HbrID")%>'>Update<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
    <td><a href='HaberSil.jsp?HbrID=<%=rs.getString("HbrID")%>'>Delete<span class="glyphicon glyphicon-remove" style="font-size:24px; color:red;"></span></a></td>
  
  </tr>
  <%} %>
</table>
</div>
<a href="HaberEkle.jsp">Insert<span class="glyphicon glyphicon-check" style="font-size:24px; color:Navy;"></span></a> 
<a id=pdfolustur onclick="pdfolustur()">PDF<span class="	glyphicon glyphicon-file" style="font-size:24px; color:Navy;"></span></a> 
 <script>
    function pdfolustur() {
        var sTable = document.getElementById('pdflistesi').innerHTML;
        var style = "<style>";
        style = style + "table {width: 100%;font: 17px arial;}";
        style = style + "table, th, td {border: solid 1px #DDD; ";
        style = style + "</style>";

        // CREATE A WINDOW OBJECT.
        var win = window.open('', '', 'height=500,width=500');
        win.document.write('<html><head>');
        win.document.write('<title>Profile</title>'); 
        win.document.write(style);       
        win.document.write('</head>');
        win.document.write('<body>');
        win.document.write(sTable);        
        win.document.close(); 	 
        win.print();    
    }
</script>
                         
</div>
</body>
</html>