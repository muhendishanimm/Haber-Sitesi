<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
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
                            <a href="KullaniciAnaSayfa.jsp" class="nav-item nav-link active">Gündem</a>
                            
                            	<% 

	ResultSet rskat=sayiCrud.selectAllData(); 
  	while(rskat.next()) 
  	{  	
  	%> <a href='Magazin.jsp?KtgAdi=<%=rskat.getString("KtgAdi")%>' class="nav-item nav-link active"><%=rskat.getString("KtgAdi")%></a>
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
								session.setAttribute("UyeID",id);
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

<br><br>
        <div class="main-news">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="row">
     
<%
String kategoriadi=request.getParameter("KtgAdi");
System.out.println("aldım ktg "+kategoriadi);

		ResultSet rsss=sayiCrud.kategoriyegoreaberselectAllData();
    
	    while(rsss.next()) {
	    	String al=rsss.getString("KtgAdi");
	    	System.out.println("Kategori "+al);
	    	int alid=rsss.getInt("KtgId");
	    	String aldim=Integer.toString(alid);
	    	if (kategoriadi.equals(al)){
	  %>
                            <div class="col-md-12">
                                <div class="tn-img">
                                     <img src="<%=rsss.getString("Resimyol") %>" width="700" height="400"/>
                                </div>
                                <div>
                                <h1><%=rsss.getString("Baslik") %></h1>
                                <h2><%=rsss.getString("Ozet") %></h2>
                                <h3><%=rsss.getString("Icerik") %></h3>
                                <h5><%=rsss.getString("YayimTrh") %></h5>
                                
                                <br><br>
                            </div>
   
                            <%
                            //yorum yapma
                            try{
                            int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
                            String uyeid=Integer.toString(id); 
                            System.out.println("uye id magazin "+uyeid);
                            if(uyeid!=null){%>
                            <div class="container"><br />
  
                            <form action="YorumEkle_Islem.jsp" class="form-group" method="post">
                            <label>Adınız Soyadınız </label>
                            <input type="text" style="width: 400px; height: 40px;"  class="form-control" id="UyeAdSoyad" name="UyeAdSoyad" required="" placeholder="Bu Bilginiz Gizli Kalmaktadır" />
                            <input type="hidden" style="width: 400px; height: 40px;"  class="form-control" id="HbrID" name="HbrID"  value="<%=rsss.getString("HbrID") %>" required="" />
                            <input type="hidden" style="width: 400px; height: 40px;"  class="form-control" id="UyeMail" name="UyeMail"  value="<%=String.valueOf(session.getAttribute("UyeMail"))%>" required="" />
                            <label>Yorumunuz</label> 
                            <textarea type="text" style="width: 400px; height: 80px;" class="form-control" name="YorumIcerik"  placeholder="Görüşlerinizi Bizimle Paylaşamanızdan Mutluluk Duyarız."></textarea>
                            <div style="margin-top:20px">
                            <button class="btn btn-info" id="btn1">Yorumu Gönder</button>
                            </div>
                            </form> 
                            </div> 
                           
                            </div>
                             <%}}
                             catch(Exception e) {}}}%> 
      
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
