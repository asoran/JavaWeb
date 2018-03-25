    <div>Statu du service : <%= (Status.isOpen() ? "open" : "close") %></div>
<%
    if(session.getAttribute("user") == null){
        out.println("<a href='login.jsp'>login</a>");
    }else{
        Utilisateur u = (Utilisateur)session.getAttribute("user");
        out.println("<a href='logout.jsp'>logout</a>");
%>
        <p>Vos services :</p>
<%
        if(u.getType().equals("user")){
            out.println("<a href='acc.jsp'>Emprunter</a>");
            out.println("<a href='retour.jsp'>Collection</a>");
        }else if(u.getType().equals("biblio")){
            out.println("<a href='add.jsp'>Nouveau Doc</a>");
            out.println("<a href='acc.jsp'>Liste</a>");
        }else if(u.getType().equals("admin")){
            out.println("<a href='admin.jsp'>Pannel d'administration</a>");
        }
    }
    out.println("<hr>");

%>
