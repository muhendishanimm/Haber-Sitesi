<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.MessageDigest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="haberler.veriIslemleri" ></jsp:useBean>

<body>
<%
String eskiSifre=request.getParameter("eskiSifre");
String yeniSifre=request.getParameter("yeniSifre");
String yeniSifreTekrar =request.getParameter("yeniSifreTekrar");
int id=Integer.parseInt(String.valueOf(session.getAttribute("UyeID")));
System.out.println(eskiSifre);
System.out.println(yeniSifre);
System.out.println(yeniSifreTekrar);
//eski sifre için
String plain = eskiSifre;
System.out.println("plain "+ plain);
MessageDigest  md5 = MessageDigest .getInstance("MD5");
md5.update(plain.getBytes());
byte[] digest = md5.digest();
StringBuffer hex = new StringBuffer();
for (int j = 0; j < digest.length; j++) {
plain = Integer.toHexString(0xFF & digest[j]);
if (plain.length() < 2) {
plain = "0" + plain;
}
hex.append(plain);
}
String Md5eski=hex.toString();
System.out.println("md5eski "+Md5eski);
//yeni sifre icin
String plainyeni = yeniSifre;
MessageDigest  md5yeni = MessageDigest .getInstance("MD5");
md5yeni.update(plainyeni.getBytes());
byte[] digestyeni = md5yeni.digest();
StringBuffer hexyeni = new StringBuffer();
for (int a = 0; a < digestyeni.length; a++) {
	plainyeni = Integer.toHexString(0xFF & digestyeni[a]);
if (plainyeni.length() < 2) {
	plainyeni = "0" + plainyeni;
}
hexyeni.append(plainyeni);
}
String Md5yeni=hexyeni.toString();
System.out.println("md5yeni "+Md5yeni);
//yeni sifre tekrar için
String plainyenitekrar = yeniSifreTekrar;
MessageDigest  md5yenitekrar = MessageDigest .getInstance("MD5");
md5yenitekrar.update(plainyenitekrar.getBytes());
byte[] digestyenitekrar = md5yenitekrar.digest();
StringBuffer hexyenitekrar = new StringBuffer();
for (int b = 0; b < digestyenitekrar.length; b++) {
	plainyenitekrar = Integer.toHexString(0xFF & digestyenitekrar[b]);
if (plainyenitekrar.length() < 2) {
	plainyenitekrar = "0" + plainyenitekrar;
}
hexyenitekrar.append(plainyenitekrar);
}
String Md5yenitekrar=hexyeni.toString();
System.out.println("md5yeni "+Md5yenitekrar);

ResultSet rs=islemler.uyeSifreselectData(id);
if(rs.next()){
	String sifre=rs.getString("UyeSifre");
	if(Md5eski.equals(sifre)){
		if(Md5yeni.equals(Md5yenitekrar)){
			sayiNesnesi.setUyeSifre(Md5yenitekrar);
			boolean islemSonucu=islemler.uyeupdateData(sayiNesnesi,id);
			if (islemSonucu==true)
				out.println("Güncelleme İşlemi kaydedilmiştir...");				
				Cookie Guncelle = new Cookie("Guncelle", request.getParameter("yeniSifreTekrar"));
			    Guncelle.setMaxAge(60*60*24*30);//cookienin süresi 30 gün
			    response.addCookie(Guncelle);
			    response.sendRedirect("KullaniciAnaSayfa.jsp" );
		}
		else{%>
			 <%response.sendRedirect("UyeSifreUpdate.jsp" );
			
		}
	}
	else{%>
	 <%response.sendRedirect("UyeGiris.jsp" );
	
}
}
%>
</body>
</html>
