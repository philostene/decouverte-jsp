package co.simplon.poleEmploi.decouverte.jsp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorld extends HttpServlet {

	private String messageGet;
	private String messagePut;

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
		String message = messagePut;
		String parametre = request.getParameter("nom");
		if (parametre.length()!=0) {
			message += parametre;
		} else {
			message += "World";
		}

		response.setContentType("text/html");

		
//		PrintWriter out = response.getWriter();
//		out.println("<h1>" + message + "</h1>");
		 Personne toto = new Personne();
		 toto.setAge(20);
		 toto.setNom("Phil");
		 toto.setPrenom("Dany");
		 request.setAttribute("person",toto);
		 request.setAttribute("message",message.toUpperCase());
		 RequestDispatcher rd=request.getRequestDispatcher("./NewFile.jsp");
				 rd.forward(request, response);
		
	
		//response.sendRedirect("./hello.jsp");
		
		
	}

	public void destroy() {

	}
}
