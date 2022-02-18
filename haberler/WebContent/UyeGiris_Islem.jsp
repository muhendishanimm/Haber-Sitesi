<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.security.MessageDigest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="session" ></jsp:useBean>
<jsp:useBean id="islemler" class="haberler.veriIslemleri" scope="session"></jsp:useBean>
</head>
<body>

 <% 

boolean sonuc=false;

  //  int id=Integer.parseInt(String.valueOf(session.getAttribute("HbrID")));
    String ad = request.getParameter("UyeKullaniciAdi");
    String sifre = request.getParameter("UyeSifre");
    int i=0;
    int kayitsayisi=0;
    System.out.println("ad"+ad);
    System.out.println("Sifre"+sifre);
String plain = sifre;
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
String Md5=hex.toString();
System.out.println("md5 "+Md5);
    ResultSet rs=islemler.uyeselectAllData();
    	while(rs.next())
    	{
    		kayitsayisi+=1;
    		String dbad=rs.getString("UyeKullaniciAdi");
    		String dbsf=rs.getString("UyeSifre");
    	
    		
    	if(ad.equals(dbad)&& Md5.equals(dbsf))
    	{
    		
    		String saklananuye= "Guncelle";
    		int uye=0;
    		Cookie cookiesuye [] = request.getCookies ();
    		System.out.println("sayisi"+cookiesuye.length);
    		 
    		for (int c = 0; c<cookiesuye.length; c++){
    			uye+=1;
    			System.out.println("cookieadi"+cookiesuye[c].getName());
        		if (cookiesuye[c].getName().equals(saklananuye)){
        	   
        		String bulunan = cookiesuye[c].getName();
        		int id=rs.getInt("UyeID");
        		String UyeMail=rs.getString("UyeMail");
            	System.out.println("uyeid"+id);
            	System.out.println("hosgeldin");
            	response.sendRedirect("KullaniciAnaSayfa.jsp" );
            	session.setAttribute("UyeID",id);
            	session.setAttribute("UyeMail",UyeMail);
        		break;
        		}}
	 		    if(uye==cookiesuye.length){	
	     	    int id=rs.getInt("UyeID");
	     	    String UyeMail=rs.getString("UyeMail");
	         	System.out.println(id);
	         	System.out.println("hosgeldin");
	         	response.sendRedirect("UyeSifreUpdate.jsp" );
	         	session.setAttribute("UyeID",id);
	         	session.setAttribute("UyeMail",UyeMail);
	         	break;
            	}
    	}
    	else if(!ad.equals(dbad)|| !Md5.equals(dbsf))
    	{
    		i+=1;	
    		System.out.println("hatali kullanici adi veya sifre"); 
    	}       
    	}
    	if (i==kayitsayisi){
    		System.out.println("Böyle bir kullanıcı yok"); 
    		response.sendRedirect("UyeGiris.jsp" );
    	}
    %>
</body>
</html>