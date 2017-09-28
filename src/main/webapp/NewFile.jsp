<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>hello page</title>
</head>
<body>
<h1>Fiche Bonjour</h1>
<h1><%= request.getAttribute("message") %></h1>
<h1><% String toto = (String)request.getAttribute("message") ;
 out.println(toto);
//  Personne toto = request.getAttribute("person");
 
 %></h1> 
<%-- <h1><%= request.getParameter("message") %></h1> --%>

</body>
</html>