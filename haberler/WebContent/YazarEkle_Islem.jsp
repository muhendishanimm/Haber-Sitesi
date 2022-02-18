<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding ("UTF-8"); %>
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
String AdSoyad=request.getParameter("AdSoyad");
String Telefon=request.getParameter("Telefon");
String Mail=request.getParameter("Mail");
int KtgId =(Integer.parseInt(request.getParameter("ktg")));
//String kategori=request.getParameter("KtgAdi");
//int uKategori=Integer.valueOf(kategori);

out.println(AdSoyad);
out.println(Telefon);
out.println(Mail);
sayiNesnesi.setAdSoyad(AdSoyad);
sayiNesnesi.setTelefon(Telefon);
sayiNesnesi.setMail(Mail);
sayiNesnesi.setKtgId(KtgId);

sonuc=sayiCrud.yazarekle(sayiNesnesi);

if(sonuc==true)
	out.println("Veriler kaydedildi...");
    response.sendRedirect("Yazarlar.jsp");
%>
</body>
</html>