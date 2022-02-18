<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


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
                                    <a href="#" id="Log-out-li" class="dropdown-item"><span>Çıkış</span></a>
                                </div>
                           </div>
                 </li>
            </ul>
        </div>
       
        <div class="container"> 
        <div><br><br></div>
<form action="HaberAra.jsp" method="post">
<div>
<label>Arama Yapınız:</label>
<input type="text" style="width: 400px; height: 40px;"  class="form-control" name="search" />
<button type="submit" value="Search"class="btn btn-info">Search</button>
</div>
</form>
    <%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/";
String database = "habersitesi_db";
String userid = "root";
String password = "123456";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
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
try{
String aranan=request.getParameter("search");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql =("SELECT haber.HbrID, haber.Baslik, haber.Ozet, haber.Icerik, haber.YayimTrh, yazar.Adsoyad, kategori.KtgAdi, haber.Resimyol FROM haber INNER JOIN yazar ON haber.YzrID=yazar.YzrID INNER JOIN kategori ON haber.KtgId=kategori.KategoriID WHERE Baslik LIKE '%"+aranan+"%'");
resultSet = statement.executeQuery(sql);


  while(resultSet.next()) {
%>
  <tr>
    <td><%=resultSet.getString("Baslik") %></td>
    <td><%=resultSet.getString("Ozet") %></td>
    <td><%=resultSet.getString("Icerik") %></td>
    <td><%=resultSet.getString("YayimTrh") %></td>
    <td><%=resultSet.getString("AdSoyad") %></td>
    <td><%=resultSet.getString("KtgAdi") %></td>
    <td> <img src="<%=resultSet.getString("Resimyol") %>" width="100" height="100"/></td>
    <td><a href='HaberGuncellejsp.jsp?HbrID=<%=resultSet.getString("HbrID")%>'>Update<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
    <td><a href='HaberSil.jsp?HbrID=<%=resultSet.getString("HbrID")%>'>Delete<span class="glyphicon glyphicon-remove" style="font-size:24px; color:red;"></span></a></td>
  
  </tr>
  <%
  }
  connection.close();

  }
  catch (Exception e) {
  e.printStackTrace();
  }
 %>
</table>
<a href="HaberEkle.jsp" class="btn btn-primary">HABER EKLE</a> 
</div>
</body>
</html>