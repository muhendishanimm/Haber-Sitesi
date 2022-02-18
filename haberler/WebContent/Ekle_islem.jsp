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
String KtgAdi=request.getParameter("KtgAdi");

out.println(KtgAdi);

sayiNesnesi.setKtgAdi(KtgAdi);


sonuc=sayiCrud.ekle(sayiNesnesi);

if(sonuc==true)
	out.println("Veriler kaydedildi...");
    response.sendRedirect("Kategoriler.jsp");
%>
</body>
</html>