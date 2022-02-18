<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri" scope="page"></jsp:useBean> 
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="page" ></jsp:useBean> 
<% 
boolean sonuc=false; 
DateFormat dateformat = new SimpleDateFormat("dd/MM/yy HH:mm"); 
Date dateobj = new Date(); 
String UyeAdSoyad=request.getParameter("UyeAdSoyad"); 
String YorumIcerik=request.getParameter("YorumIcerik"); 
int UyeId=Integer.parseInt(String.valueOf(session.getAttribute("UyeID"))); 
String UyeMail=String.valueOf(session.getAttribute("UyeMail")); 
int HaberID=Integer.parseInt(String.valueOf(request.getParameter("HbrID"))); 
String Tarih=dateformat.format(dateobj); 
String Onay="False";
sayiNesnesi.setUyeAdSoyad(UyeAdSoyad);
sayiNesnesi.setYorumIcerik(YorumIcerik); 
sayiNesnesi.setUyeId(UyeId); 
sayiNesnesi.setHaberID(HaberID); 
sayiNesnesi.setTarih(Tarih);
sayiNesnesi.setUyeMail(UyeMail);
sayiNesnesi.setOnay(Onay);
sonuc=sayiCrud.yorumekle(sayiNesnesi); 
if(sonuc==true) 
response.sendRedirect("KullaniciAnaSayfa.jsp");
 %>
</body>
</html>