<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Dünyadan Bir Haber</title>
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
                    <form action="AnaSayfadaAra.jsp" method="post">
                        <div class="b-search">
                            <input type="text" name="search" placeholder="Search">
                            <button type="submit" > <i class="fa fa-search"></i></button>
                         </div>
                        </form>
                        
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
                            <a href="KullaniciAnaSayfa.jsp" class="nav-item nav-link active">Gündem</a>

 <% 

	ResultSet rskat=sayiCrud.selectAllData(); 
  	while(rskat.next()) 
  	{  	
  	%> <a href='Magazin.jsp?KtgAdi=<%=rskat.getString("KtgAdi")%>' class="nav-item nav-link"><%=rskat.getString("KtgAdi")%></a>
  	<% } %>
               

               
                         </div>
                  
                            <%
							try{
							int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
                            String idal=Integer.toString(id);
							String UyeKullaniciAdi;		
							
							
							if(idal!=null){
							ResultSet rsuye=sayiCrud.uyeSifreselectData(id);
							if (rsuye.next()){
								UyeKullaniciAdi=rsuye.getString("UyeKullaniciAdi");	
								System.out.println("uye id kullanıcı anasayfa "+id);
								
								%>
								 <div class="navbar-nav mr-auto"><a href="#" class="nav-item nav-link"><%=rsuye.getString("UyeKullaniciAdi")%></a> </div>
							
								 
							<%}}%>
						<%		
							}
                            catch(Exception e) {
                            	System.out.println("gör beni");%>
                            	<div class="social ml-auto">
								   <a href="UyeGiris.jsp" class="login-btn"><i class="fa fa-user"></i></a>
								    </div>

                          <%	  }%>
	                            
                    </div>
                </nav>
            </div>
        </div>
        <!-- Nav Bar End -->

        <!-- Top News Start-->

        <div class="top-news">
            <div class="container">
                <div class="row">
<!-- bu slider -->
                    <div class="col-md-6 tn-left">
            
                        <div class="row tn-slider">
                               
  <% 
  //burası slider
  ResultSet rs=sayiCrud.haberselectAllData();
  while(rs.next()) { %>
                            <div class="col-md-6">
                                <div class="tn-img">
                                 <img src="<%=rs.getString("Resimyol") %>" width="400" height="400"/>
                                </div>
                            </div>
                            
                         <%} %>
                        </div>    
                    </div>
                    <!-- bu slider  yanı -->
                    <div class="col-md-6 tn-right">
                        <div class="row">
                        <% 
                        //slider yanı
                        ResultSet rss=sayiCrud.haberselectAllData();
                        int a=0;
                        while(rss.next()) {
                      	if(a<4){  %>
                                                  <div class="col-md-6">
                                                      <div class="tn-img">
                                                           <img src="<%=rss.getString("Resimyol") %>" width="200" height="200"/>
                                                      </div>
                                                  </div>
                                                   <%a++;}}
                        System.out.println(a);%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="main-news">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
     <% 
     //içerik kısmı
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
try{
String aranan=request.getParameter("search");
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql =("SELECT haber.HbrID, haber.Baslik, haber.Ozet, haber.Icerik, haber.YayimTrh, yazar.Adsoyad, kategori.KtgAdi, haber.Resimyol FROM haber INNER JOIN yazar ON haber.YzrID=yazar.YzrID INNER JOIN kategori ON haber.KtgId=kategori.KategoriID WHERE Baslik LIKE '%"+aranan+"%'");
ResultSet rsss = statement.executeQuery(sql);


  //ResultSet rsss=sayiCrud.haberselectAllData();
  while(rsss.next()) {
	  int hbrid=rsss.getInt("HbrID");  
	  String haberdekiid=Integer.toString(hbrid);
	  System.out.println(haberdekiid);
	  session.setAttribute("HbrID",haberdekiid);

  %>
                            <div class="col-md-12">
                                <div class="tn-img">
                                     <img src="<%=rsss.getString("Resimyol") %>" width="400" height="400"/>   
                                </div>
                                <div>
                                <h1><%=rsss.getString("Baslik") %></h1>
                                <h2><%=rsss.getString("Ozet") %></h2>
                                <h3><%=rsss.getString("Icerik") %></h3>
                                <h5><%=rsss.getString("YayimTrh") %></h5>
                                </div>
                                <br><br>
                                 <%}
  connection.close();

  }
  catch (Exception e) {
  e.printStackTrace();
  }%>
                               
                            </div>  
                                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="template/lib/easing/easing.min.js"></script>
        <script src="template/lib/slick/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="template/js/main.js"></script>
<script>
$(function(){
$("#KategoriID").change(function() {
var deger = $(this).val();
$("#ktg").val(deger);
});
})
</script>

        
    </body>
</html>