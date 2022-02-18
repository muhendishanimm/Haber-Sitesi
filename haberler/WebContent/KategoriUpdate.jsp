<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
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
   <div class="container">
   <div><br><br></div>
<%
int id=Integer.parseInt(request.getParameter("KategoriID"));
String KtgAdi="Almadi";
ResultSet rs=sayiCrud.selectData(id);
if (rs.next()){
	KtgAdi=rs.getString("KtgAdi");
	session.setAttribute("KategoriID",id);
}
%>
 <div id="main">
<div class="container">
  <form action="KtgUpdate_Islem.jsp" method="post">
   <div>
   <label>Kategori Adi</label>
	<div> 
        <input type="text" style="width: 400px; height: 40px;" class="form-control"  id="KtgAdi" name="KtgAdi" value="<%=KtgAdi%>"/>
      
    </div>
    
    
    
    <div style="margin-top:20px">
       <button type="submit" name="save">Update<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></button>
    </div>
    </div>
  </form>
</div>
</div>
    <script>
        $('#btn1').click(function () {
            alert('Kategori Güncelleme Işlemi Yapıldı.');

        });
    </script>  
    </div>
</body>
</html>