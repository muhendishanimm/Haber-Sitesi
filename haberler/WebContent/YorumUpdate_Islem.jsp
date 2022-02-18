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

String Onay=request.getParameter("Onay");
System.out.println("Radiodan alınan onay"+Onay);
sayiNesnesi.setOnay(Onay);
//out.println(String.valueOf(session.getAttribute("id_no")));

int id=Integer.parseInt(String.valueOf(session.getAttribute("YrmID")));
boolean islemSonucu=islemler.yorumupdateData(sayiNesnesi,id);
if (islemSonucu==true)
	out.println("Basariyla kaydedilmistir...");
    response.sendRedirect("Yorumlar.jsp");
%>
</body>
</html>