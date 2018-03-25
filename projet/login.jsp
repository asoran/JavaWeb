<%@ page import = "mdr.*" %>
<%@ page import = "mediatheque.*" %>
<%

	Mediatheque med = Mediatheque.getInstance();
    if(session.getAttribute("user") != null){
        out.println("Deja co ! : <a href='logout.jsp'>Logout</a>");
    }else{


        // = First arrivé sur la page
        if(request.getParameter("ok") == null){
            //HTML ici
        }else{
            String name = (String)request.getParameter("name");
            String mdp = (String)request.getParameter("mdp");
            out.println(name + mdp);

            if(name.equals("admin") && mdp.equals("admin")){
                session.setAttribute("user", new Utilisateur(0, "admin", "admin", "admin"));
                out.println("<script>alert('COUCOU ADMIN :P');</script>");
            }else{
                if(Status.isOpen()){
                    Utilisateur u = med.getUser(name, mdp);
                    if(u.getId() == -1){
                        out.println("<script>alert('fail');</script>");
                    }else{
                        session.setAttribute("user", u);
                        out.println("<script>alert('Loged in successfuly with'" + u + ");</script>");
                    }

                }else{
                    out.println("<script>alert('DEMARRER LE SERVICE LUL');</script>");
                }
            }

            //session.setAttribute("doc", "session{}");
            //out.println(session.getAttribute("doc"));
        }
%>
<%@ include file="header.jsp"%>
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

		<a href="acc.jsp">acc</a>
		<a href="admin.jsp">admin</a>
    </body>
</html>
<%

    }



%>
