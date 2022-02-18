<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
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
    String ad = request.getParameter("KullaniciAdi");
    String sifre = request.getParameter("Sifre");
    int i=0;
    int kayitsayisi=0;
    ResultSet rs=islemler.kullaniciselectData();
    	while(rs.next())
    	{
    		kayitsayisi+=1;
    		String dbad=rs.getString("KullaniciAdi");
    		String dbsf=rs.getString("Sifre");
    	if(ad.equals(dbad)&& sifre.equals(dbsf))
    	{	
    		String saklanan= "sifreGuncellemeAdmin";
            int a=0;
    		Cookie cookies [] = request.getCookies ();
    		System.out.println("sayisi "+cookies.length);
    		for (int c = 0; c < cookies.length; c++){
    			a+=1;
        		if (cookies[c].getName().equals(saklanan)){
        	    System.out.println("cookieadi "+cookies[c].getName());
        		String bulunan = cookies[c].getName();
        		int id=rs.getInt("KullaniciID");
            	System.out.println(id);
            	System.out.println("hosgeldin "+ad);
            	//response.sendRedirect("AdminSifreUpdate.jsp" );
            	response.sendRedirect("Haberler.jsp" );
            	session.setAttribute("KullaniciID",id);
        		break;
        		}
        		}
        		if(a==cookies.length){        	   
        	    int id=rs.getInt("KullaniciID");
            	System.out.println(id);
            	System.out.println("hosgeldin "+ ad);
            	response.sendRedirect("AdminSifreUpdate.jsp" );
            	//response.sendRedirect("Haberler.jsp" );
            	session.setAttribute("KullaniciID",id);           	
            	}
    	}
    	else if(!ad.equals(dbad)|| !sifre.equals(dbsf))
    	{
    		i+=1;	
    		System.out.println("hatali kullanici adi veya sifre"); 
    	}       
    	}
    	if (i==kayitsayisi){
    		System.out.println("hatali kullanici adi veya sifre"); 
    		response.sendRedirect("Admingiris.jsp" );
    	}
    %>
</body>
</html>