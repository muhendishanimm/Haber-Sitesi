<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<%@page import="java.security.MessageDigest" %>
<!DOCTYPE html>
<html>
<head>
<title>Yeni Sifre</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}

table.center {
  margin-left: auto; 
  margin-right: auto;
}
</style>
</head>
<body>
<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
<jsp:useBean id="sayiNesnesi" class="haberler.sayiBilgisi" scope="page" ></jsp:useBean>
<jsp:useBean id="islemler" class="haberler.veriIslemleri" scope="session"></jsp:useBean>
<%  
//Minimum length for a decent password
final int max_uzunluk = 9;

/**
* The random number generator.
*/
java.util.Random random = new java.util.Random();

/**
* I, L and O are good to leave out as are numeric zero and one.
*/
final String number= "123456789";
final String kucuk_karakter = "abcdefghjkmnpqrstuvwxyz";
final String buyuk_karakter = "ABCDEFGHJKMNPQRSTUVWXYZ";
final String ALL = number + kucuk_karakter + buyuk_karakter;
final char[] buyuk_karakterArray = buyuk_karakter.toCharArray();
final char[] kucuk_karakterArray = kucuk_karakter.toCharArray();
final char[] numberArray = number.toCharArray();
final char[] allArray = ALL.toCharArray();

StringBuilder sb = new StringBuilder();

// get at least one lowercase letter
sb.append(kucuk_karakterArray[random.nextInt(kucuk_karakterArray.length)]);

// get at least one uppercase letter
sb.append(buyuk_karakterArray[random.nextInt(buyuk_karakterArray.length)]);

// get at least one digit
sb.append(numberArray[random.nextInt(numberArray.length)]);

// fill in remaining with random letters
for (int i = 0; i < max_uzunluk - 4; i++) {
    sb.append(allArray[random.nextInt(allArray.length)]);
}

String randomsifre=sb.toString();
System.out.println("random sifre "+randomsifre);


%>
  <div class="container"> 
<table class="center">
        
       <tr>
        <th>YENİ ŞİFRENİZ</th>
        
    </tr>
    <tr>
      <td><%out.println(randomsifre);%></td>
    </tr>
</table>
<%


//out.println(String.valueOf(session.getAttribute("id_no")));

String UyeMail=String.valueOf(session.getAttribute("dbUyeMail"));
//String UyeMail="aylinnurel98@gmail.com";
System.out.println("bu mail "+UyeMail);
String plainText = randomsifre;

MessageDigest  mdAlgorithm = MessageDigest .getInstance("MD5");
mdAlgorithm.update(plainText.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    plainText = Integer.toHexString(0xFF & digest[i]);

    if (plainText.length() < 2) {
        plainText = "0" + plainText;
    }

    hexString.append(plainText);
}
String md5=hexString.toString();
System.out.print("md5li "+hexString.toString());
sayiNesnesi.setUyeSifre(md5);
boolean islemSonucu=islemler.uyesifreupdateData(sayiNesnesi,UyeMail);
%>
</div>
</body>
</html>