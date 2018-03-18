package src;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/verif")
public class Verification extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse rep) throws IOException{
		HttpSession s = req.getSession(true);
		
		User u = (User) s.getAttribute("user");
		String msg = "";
		
		if(u == null)
			msg = "NON AUTHENTIFIE";
		else
			msg = "Vous etes auth avec le login : " + u.getNom();
		
		rep.setContentType("text/html");
		PrintWriter out = rep.getWriter();
		
		out.println("<html><head></head><body><h1>" + msg + "</h1></body></html>");
		
		
	}
}