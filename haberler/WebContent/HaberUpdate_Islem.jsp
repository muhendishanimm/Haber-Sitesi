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
String Baslik=request.getParameter("Baslik");
String Ozet=request.getParameter("Ozet");
String Icerik=request.getParameter("Icerik");
String YayimTrh=request.getParameter("YayimTrh");
int YzrId=(Integer.parseInt(request.getParameter("yzr")));
int KtgId=(Integer.parseInt(request.getParameter("ktg")));
String resimyolu=request.getParameter("resim");
String Resimyolu="resimklasoru/"+resimyolu; 
String resimyol=Resimyolu.replace("\\","\\\\");

System.out.println(Baslik);
System.out.println(Ozet);
System.out.println(Icerik);
System.out.println(YayimTrh);
sayiNesnesi.setBaslik(Baslik);
sayiNesnesi.setOzet(Ozet);
sayiNesnesi.setIcerik(Icerik);
sayiNesnesi.setYayimTrh(YayimTrh);
sayiNesnesi.setYzrId(YzrId);
sayiNesnesi.setKtgId(KtgId);
sayiNesnesi.setResimyol(resimyol);

//out.println(String.valueOf(session.getAttribute("id_no")));

int id=Integer.parseInt(String.valueOf(session.getAttribute("HbrID")));
boolean islemSonucu=islemler.haberupdateData(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Basariyla kaydedilmistir...");
    response.sendRedirect("Haberler.jsp");
%>
</body>
</html>