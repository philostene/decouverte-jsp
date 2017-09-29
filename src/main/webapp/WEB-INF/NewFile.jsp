<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="message" scope="request" type="java.lang.String" />
<jsp:useBean id="listePS" scope="session" class="java.util.ArrayList" />

<%@ page import="co.simplon.poleEmploi.decouverte.jsp.*"%>
<%@ page import="java.util.*"%>

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
			
			%>
			
			<b>${sessionScope.str1} ${str2} ${str3}  </b> <br>
			
	<%	};
		  } else { out.print("Fin for") ;} %> 
		  
    
		  
		  
</body>
</html>