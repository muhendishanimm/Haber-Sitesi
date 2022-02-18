<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
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
int deger=Integer.parseInt(request.getParameter("deger"));
System.out.println("bu degeer"+deger);
String Deger=String.valueOf(deger);
String KullaniciAdi=request.getParameter("KullaniciAdi");
String KullaniciMail=request.getParameter("KullaniciMail");
String eskiSifre=request.getParameter("eskiSifre");
String yeniSifre=request.getParameter("yeniSifre");
String yeniSifreTekrar =request.getParameter("yeniSifreTekrar");
int id=Integer.parseInt(String.valueOf(session.getAttribute("KullaniciID")));
System.out.println("Ka "+KullaniciAdi);
System.out.println("Km "+KullaniciMail);
System.out.println(eskiSifre);
System.out.println(yeniSifre);
System.out.println(yeniSifreTekrar);


ResultSet rs=islemler.kullaniciSifreselectData(id);
if(rs.next()){
	if(Deger.equals("0")){
	String sifre=rs.getString("Sifre");
	if(eskiSifre.equals(sifre)){
		if(yeniSifre.equals(yeniSifreTekrar)){
			sayiNesnesi.setSifre(yeniSifreTekrar);
			boolean islemSonucu=islemler.kullaniciupdateData(sayiNesnesi,id);
			if (islemSonucu==true){
				out.println("Güncelleme İşlemi kaydedilmiştir...");
				Cookie sifreGuncelleAdmin = new Cookie("sifreGuncellemeAdmin", request.getParameter("yeniSifreTekrar"));
			    sifreGuncelleAdmin.setMaxAge(60*60*24*30);//cookienin süresi 30 gün 60*60*24*30
			    response.addCookie(sifreGuncelleAdmin);
			    response.sendRedirect("Haberler.jsp" );
			    }
		}
	}
}}

ResultSet rsdeger=islemler.kullaniciupdateselectData(id);
if(rsdeger.next()){
	if(Deger.equals("1")){
	String sifre=rsdeger.getString("Sifre");
		if(eskiSifre.equals(sifre)){
		
			if(yeniSifre.equals(yeniSifreTekrar)){
				sayiNesnesi.setKullaniciAdi(KullaniciAdi);
				sayiNesnesi.setKullaniciMail(KullaniciMail);
				sayiNesnesi.setSifre(yeniSifre);
				boolean islemSonucu=islemler.kullaniciupdateDataIslem(sayiNesnesi,id);
				if (islemSonucu==true){
					Cookie sifreGuncelleAdmin = new Cookie("sifreGuncellemeAdmin", request.getParameter("yeniSifreTekrar"));
				    sifreGuncelleAdmin.setMaxAge(60*60*24*30);//cookienin süresi 30 gün 60*60*24*30
				    response.addCookie(sifreGuncelleAdmin);
				    response.sendRedirect("Haberler.jsp" );
				    }
			}
		}
}
	}
%>
</body>
</html>
