package co.simplon.poleEmploi.decouverte.jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HelloWorld extends HttpServlet {

	private String messageGet;
	private String messagePut;
	private String ENVOI = "envoi";
	private String AFFICHER = "afficher";

	public void init() throws ServletException {
		messageGet = "Hello ";
		messagePut = "Bonjour ";
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message = messageGet;
		String parametre = request.getParameter("nom");
		if (parametre != null) {
			message += parametre;
		} else {
			message += "World";
		}

		response.setContentType("text/html");

		PrintWriter out = response.getWriter();
		out.println("<h1>" + message + "</h1>");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		List listPers = new <Personne>ArrayList();
		List<Personne> listPersSession = new <Personne>ArrayList();
		
		String message = messagePut;
		String parametre = request.getParameter("nom");
		if (parametre.length()!=0) {
			message += parametre;
		} else {
			message += "World";
		}

		String message1 = message;
		//		PrintWriter out = response.getWriter();
		//		out.println("<h1>" + message + "</h1>");

		if (session.getAttribute("listePS") !=null){
		
		listPersSession = (List) session.getAttribute("listePS");
		}
		
		Personne toto = new Personne();
		toto.setNom(request.getParameter("nom"));
		toto.setPrenom(request.getParameter("prenom"));
		parametre = request.getParameter("age");
		toto.setAge(Integer.parseInt(parametre.toString()));
		listPersSession.add(toto);
		
		session.setAttribute("listePS",listPersSession );
		
		toto = new Personne();
		toto.setAge(25);
		toto.setNom("Phil");
		toto.setPrenom("Dany");
		listPers.add(toto);

		toto = new Personne();
		toto.setAge(20);
		toto.setNom("Phil1");
		toto.setPrenom("Dany1");
    	listPers.add(toto);


		request.setAttribute("listeP", listPers);
		
		String choix = request.getParameter("choix");
		
		if (choix.equals(AFFICHER)) {
			request.setAttribute("toto",toto);
			request.setAttribute("message",message.toUpperCase());
			request.setAttribute("message1",message1);
			request.setAttribute("listeP", listPers);
			session.setAttribute("listePS",listPersSession );
			RequestDispatcher rd=request.getRequestDispatcher("./WEB-INF/NewFile.jsp");
			rd.forward(request, response);

		}
		else {  response.sendRedirect("./index.html");  } ;



		//response.sendRedirect("./hello.jsp");


	}

	public void destroy() {

	}
}
