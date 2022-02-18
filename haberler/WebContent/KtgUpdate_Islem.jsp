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

String KtgAdi=request.getParameter("KtgAdi");
sayiNesnesi.setKtgAdi(KtgAdi);
//out.println(String.valueOf(session.getAttribute("id_no")));

int id=Integer.parseInt(String.valueOf(session.getAttribute("KategoriID")));
boolean islemSonucu=islemler.updateData(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Basariyla kaydedilmistir...");
    response.sendRedirect("Kategoriler.jsp");
%>
</body>
</html>