<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>

<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="page" ></jsp:useBean>
<jsp:useBean id="islemler" class="haberler.veriIslemleri" scope="session"></jsp:useBean>

<%
boolean sonuc=false;
String UyeMail=request.getParameter("UyeMail");
out.println(UyeMail);
if(sonuc==true)
	out.println("Veriler kaydedildi...");

%>
<%
int i=0;
int kayitsayisi=0;
ResultSet rs=sayiCrud.uyeselectAllData();
	while(rs.next()) {
		kayitsayisi+=1;
		String dbUyeMail=rs.getString("UyeMail");
		System.out.println(dbUyeMail);
	if(UyeMail.equals(dbUyeMail)){
	session.setAttribute("dbUyeMail",dbUyeMail);
    response.sendRedirect("UyeGiris.jsp");
   //Creating a result for getting status that messsage is delivered or not!
    String result;
    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = UyeMail;
    final String subject = "Yeni Şifre";
    final String messg ="http://localhost:8080/haberler/UyeSifreLink.jsp";
    // Sender's email ID and password needs to be mentioned
    final String from = "sunucuproje@gmail.com";
    final String pass = "Sunucu123";
    // Defining the gmail host
    String host = "smtp.gmail.com";
    // ozellik nesnesi olusturuluyor
    Properties properties = System.getProperties();
    // mail server ayarlari yapiliyor
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");//587
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.auth", "true"); 
    // Authorized the Session object.
    Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });
    try {

        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        System.out.println(from);
        message.setFrom(new InternetAddress(from));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        // Set Subject: header field
        message.setSubject(subject);
        // Now set the actual message
        message.setText(messg);
        // Send message
        Transport.send(message);
        result = "Mail Gönderme Başarılı....";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Mail Gönder Başarısız....";
    }
%>
<title>Mail Gönderiliyor... </title>

<h1><center><font color="blue">Mail Gönderiliyor...</font></h1>

<b><center><font color="red"><% out.println(result);%></b>

<%}
	else if(!UyeMail.equals(dbUyeMail))
	{
		i+=1;	
		System.out.println("hatalı üye mail"); 
	}  
	}
	if (i==kayitsayisi){
		System.out.println("Böyle bir mail yok"); 
		response.sendRedirect("UyeSifremiUnuttum.jsp" );
	}
	%>