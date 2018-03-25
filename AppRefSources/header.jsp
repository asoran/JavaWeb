    <div>Ceci est une navbar, sans css (pas le temps desole)</div>
    <div>Statu du service : <%= (Status.isOpen() ? "open" : "close") %></div>
    <p>Vos services :</p>
<%
    if(session.getAttribute("user") == null){
        out.println("Connectez-vous pour accede au contenu<br>");
        out.println("<a href='login.jsp'>login</a>");
    }else{
        Utilisateur u = (Utilisateur)session.getAttribute("user");
        out.println("<a href='logout.jsp'>logout</a>");

        if(u.getType().equals("user")){
            out.println("<a href='emprunt.jsp'>Emprunter</a>");
            out.println("<a href='retour.jsp'>Collection</a>");
        }else if(u.getType().equals("biblio")){
            out.println("<a href='add.jsp'>Nouveau Doc</a>");
            out.println("<a href='liste.jsp'>Liste</a>");
        }else if(u.getType().equals("admin")){
            out.println("<a href='admin.jsp'>Pannel d'administration</a>");
        }
    }
%>
    <hr>
