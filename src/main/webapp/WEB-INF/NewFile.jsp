<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="message" scope="request" type="java.lang.String" />
<jsp:useBean id="listePS" scope="session" class="java.util.ArrayList" />

<%@ page import="co.simplon.poleEmploi.decouverte.jsp.*"%>
<%@ page import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <jsp:setProperty name = "message1" property = "message1"  
   /> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>hello page</title>
</head>
<body>
	<h1>Fiche Bonjour</h1>
	<h1>Message html:<%= request.getAttribute("message") %></h1>
	<h1>
		<% String toto = (String)request.getAttribute("message") ;
 out.println("Message out java:"+toto);
//  Personne toto = request.getAttribute("person");
 
 %>
	</h1>
	<%-- <h1><%= request.getParameter("message") %></h1> --%>

	<h1>Message scriptlet: <%=message %>
	</h1>
	<h1>Message EL: ${message1}</h1>
	<h1>Nom: ${toto.nom}</h1>
	<h1>Prénom: ${toto.prenom}</h1>
	<h1>Agent: ${toto.age}</h1>
	<h1>Navigateur: ${ header["user-agent"] }</h1>
	<h1>Message Scope ${ requestScope.message}</h1>

	<%	List<Personne> listeP = (List) request.getAttribute ("listeP");
	out.println("<h1>" + "Variable avec Ierator" + "</h1><br>");	
if (listeP!=null) {
		
		Iterator iterator = listeP.iterator();
		while ( iterator.hasNext() ) {
			Personne p = (Personne) iterator.next();
			out.println ("<b>"+p.getNom() + " " + p.getPrenom() + " " + p.getAge() + "<br>");
		
		}
	}
%>
	<%	 listeP = (List) session.getAttribute ("listePS");
	
out.println("<h1>" + "Variable session" + "</h1><br>");
if (listeP!=null) {
		
		Iterator iterator = listeP.iterator();
		while ( iterator.hasNext() ) {
			Personne p = (Personne) iterator.next();
			out.println ("<b>"+p.getNom() + " " + p.getPrenom() + " " + p.getAge() + "<br>");
		
		}
	}

%>
	<%	 
	out.println("<h1>" + "Variable session for" + "</h1><br>");
	if (listePS!=null) {	
		for (Personne p : (ArrayList <Personne>) listePS) { 
			out.println ("<b>"+p.getNom() + " " + p.getPrenom() + " " + p.getAge() + "<br>");
		};
		  } else { out.print("Fin for") ;} %> 
		
		  <%	 
	out.println("<h1>" + "Variable session for" + "</h1><br>");
			
	if (listePS!=null) {	
		String str;
		for (Personne p : (ArrayList <Personne>) listePS) {
			str = p.getNom();
			session.setAttribute("str1", p.getNom());
			request.setAttribute("str2", p.getPrenom());
			request.setAttribute("str3", p.getAge());
			pageContext.setAttribute("str4", p.getAge());
			
			%>
			
			<b>${sessionScope.str1} ${str2} ${str3}  ${str4}</b> <br>
			
	<%	};
		  } else { out.print("Fin for") ;} %> 
		  
	 <% out.println("<h1>" + "Variable session for" + "</h1><br>");	  %> 
		  
    <c:forEach var = "i" begin = "1" end = "5">
         Item <c:out value = "${i}"/><p>
      </c:forEach>
      
		<c:forEach var = "i" begin = "1" end = "5">
         Item <c:out value = "${i}"/><p>
      </c:forEach>  
      
      <% out.println("<h1>" + "Variable session for each jstl" + "</h1><br>");	  %> 
<table>
		 <c:forEach items="${listePS}" var="element"> 
 
  <tr>
    <td>${element.nom}</td>
    <td>${element.prenom}</td>
    <td>${element.age}</td>
  </tr>
</c:forEach> 
</table>
 <% out.println("<h1>" + "affichage heure" + "</h1><br>");	  %> 

 <c:set var="now" value="<%=new java.util.Date()%>" />

<p>Format 1: <fmt:formatDate type="time" 
            value="${now}" /></p>
<p>Format 2: <fmt:formatDate type="date" 
            value="${now}" /></p>
<p>Format 3: <fmt:formatDate type="both" 
            value="${now}" /></p>
<p>Format 4: <fmt:formatDate type="both" 
            dateStyle="short" timeStyle="short" 
            value="${now}" /></p>
<p>Format 5: <fmt:formatDate type="both" 
            dateStyle="medium" timeStyle="medium" 
            value="${now}" /></p>
<p>Format 6: <fmt:formatDate type="both" 
            dateStyle="long" timeStyle="long" 
            value="${now}" /></p>
<p>Format 7: <fmt:formatDate pattern="yyyy-MM-dd" 
            value="${now}" /></p>


</body>
</html>