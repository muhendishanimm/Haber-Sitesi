<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="haberler.veriIslemleri" scope="session"></jsp:useBean>
</head>
<body>
<%

String AdSoyad=request.getParameter("AdSoyad");
String Telefon=request.getParameter("Telefon");
String Mail=request.getParameter("Mail");
int KtgId=(Integer.parseInt(request.getParameter("ktg")));
sayiNesnesi.setAdSoyad(AdSoyad);
sayiNesnesi.setTelefon(Telefon);
sayiNesnesi.setMail(Mail);
sayiNesnesi.setKtgId(KtgId);

//out.println(String.valueOf(session.getAttribute("id_no")));

int id=Integer.parseInt(String.valueOf(session.getAttribute("YzrID")));
boolean islemSonucu=islemler.yazarupdateData(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Basariyla kaydedilmistir...");
    response.sendRedirect("Yazarlar.jsp");
%>
</body>
</html>