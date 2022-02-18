<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:useBean id="sayiCrud" class="haberler.veriIslemleri"></jsp:useBean>
   <title>Dünyadan Bir Haber</title>
   <meta charset="utf-8">
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
   <link rel="stylesheet" href="menu29/styles.css" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div id="tabs">
                <ul class="nav navbar-nav">
                <li><a ><span>Dünyadan Bir Haber</span></a></li>
                <li><a href="Haberler.jsp" ><span>Haberler</span></a></li>
                <li><a href="Kategoriler.jsp" ><span>Kategoriler</span></a></li>
                <li><a href="Yazarlar.jsp" ><span>Yazarlar</span></a></li>
                <li><a href="" ><span>Yorumlar</span></a></li>
                <li id="Log-out-li"><a href=""><span>Çıkış</span></a> </li>
            </ul>
        </div>
   <div class="container">
<table id="myTable">
  <% 
  int id=Integer.parseInt(request.getParameter("KategoriID"));
  
  boolean sonuc=sayiCrud.deleteData(id);
 
  if (sonuc) {	  
	  response.sendRedirect("Kategoriler.jsp");
	  
  }
  %>
</table>
</div>
</body>
</html>