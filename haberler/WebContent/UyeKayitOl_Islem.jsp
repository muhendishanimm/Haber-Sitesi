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
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="page" ></jsp:useBean>
 <%
boolean sonuc=false;
String UyeKullaniciAdi=request.getParameter("UyeKullaniciAdi");
String UyeSifre=request.getParameter("UyeSifre");
String UyeSifreTekrar=request.getParameter("UyeSifreTekrar");
String UyeMail=request.getParameter("UyeMail");

System.out.println(UyeKullaniciAdi);
System.out.println(UyeSifre);
System.out.println(UyeSifreTekrar);
System.out.println(UyeMail);

if(UyeSifre.equals(UyeSifreTekrar)){
   sayiNesnesi.setUyeKullaniciAdi(UyeKullaniciAdi);
   sayiNesnesi.setUyeSifre(UyeSifreTekrar);
   sayiNesnesi.setUyeMail(UyeMail);
   sonuc=sayiCrud.uyeekle(sayiNesnesi);
   if(sonuc==true)
	 System.out.println("Veriler kaydedildi...");
     response.sendRedirect("KullaniciAnaSayfa.jsp");
   }
   else{
	 System.out.println("Olmadı");		
     response.sendRedirect("UyeKayitOl.jsp");
   }


%>  
</body>
</html>