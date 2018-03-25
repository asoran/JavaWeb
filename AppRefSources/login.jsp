<%@ page import = "mediatheque.Status" %>
<%@ page import = "mediatheque.Utilisateur" %>
<%@ page import = "mediatheque.Mediatheque" %>

<%
	Mediatheque med = Mediatheque.getInstance();

    if(session.getAttribute("user") != null){
        out.println("Deja connecté ! : <a href='logout.jsp'>Logout</a>");
    }else{
        // = First arrivé sur la page
        if(request.getMethod().equals("POST")){
            String name = (String)request.getParameter("name");
            String mdp = (String)request.getParameter("mdp");

            if(name.equals("admin") && mdp.equals("admin")){
                session.setAttribute("user", new Utilisateur(0, "admin", "admin"));
                out.println("<script>alert('COUCOU ADMIN');</script>");
            }else{
                if(Status.isOpen()){
                    Utilisateur u = med.getUser(name, mdp);
                    if(u == null){
                        out.println("<script>alert('fail');</script>");
                    }else{
                        session.setAttribute("user", u);
                        out.println("<script>alert('Loged in successfuly with'" + u + ");</script>");
                    }
                }else{
                    out.println("<script>alert('DEMARRER LE SERVICE SVP');</script>");
                }
            }
		}
%>
<%@ include file="header.jsp"%>
<%
		if(session.getAttribute("user") == null){
%>
<html>
    <head>
    </head>
    <body>
        <div>
        	<form action='#' method='POST'>
                <input type="hidden" name="ok" value="ok">
            	Nom d'utilisateur:<br>
            	<input type='text' name='name' placeholder="user">
            	<br>
            	Mot de passe:<br>
            	<input type='password' name='mdp' placeholder="mdp">
            	<br>
            	<input type='submit' value='Submit'>
        	</form>
        </div>
    </body>
</html>
<%
		}else{
			out.println("Bienvenue " + ((Utilisateur)session.getAttribute("user")).getNom());
		}
    }
%>
