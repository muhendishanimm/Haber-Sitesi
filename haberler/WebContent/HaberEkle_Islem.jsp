<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri" scope="page"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="page" ></jsp:useBean>

<%
boolean sonuc=false;
DateFormat dateformat = new SimpleDateFormat("dd/MM/yy HH:mm");
Date dateobj = new Date();
String Baslik=request.getParameter("Baslik");
String Ozet=request.getParameter("Ozet");
String Icerik=request.getParameter("Icerik");
String YayimTrh=dateformat.format(dateobj);
int id =(Integer.parseInt(request.getParameter("yzr")));
int KtgId =(Integer.parseInt(request.getParameter("ktg")));
String Resim=request.getParameter("Resimyol");
//String Resimyolu=Resim.replace("D:\\Eclipse\\haberler\\WebContent\\","");
String Resimyolu="resimklasoru/"+Resim; 
String Resimyol=Resimyolu.replace("\\","\\\\");

System.out.println(Baslik);
System.out.println(Ozet);
System.out.println(Icerik);
System.out.println(YayimTrh);
System.out.println(id);
System.out.println(KtgId);
System.out.println("resim "+Resim);
System.out.println(Resimyol);

sayiNesnesi.setBaslik(Baslik);
sayiNesnesi.setOzet(Ozet);
sayiNesnesi.setIcerik(Icerik);
sayiNesnesi.setYayimTrh(YayimTrh);
sayiNesnesi.setYzrId(id);
sayiNesnesi.setKtgId(KtgId);
sayiNesnesi.setResimyol(Resimyol);

sonuc=sayiCrud.haberekle(sayiNesnesi);

if(sonuc==true)
    out.println("Veriler kaydedildi...");
    response.sendRedirect("Haberler.jsp");
%>
</body>
</html>