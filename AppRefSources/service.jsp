<%@ page import = "mediatheque.Mediatheque" %>
<%@ page import = "mediatheque.Status" %>
<%@ page import = "mediatheque.Document" %>
<%@ page import = "mediatheque.Utilisateur" %>
<%@ page import = "mediatheque.EmpruntException" %>

<%
    Mediatheque med = Mediatheque.getInstance();

    if(Status.isOpen()){
        if(session.getAttribute("user") != null){
            Utilisateur u = (Utilisateur)session.getAttribute("user");
            if(request.getParameter("action") != null && request.getParameter("id") != null){
                String req = request.getParameter("action");
                int id = Integer.parseInt(request.getParameter("id"));
                // On récupère l'objet document
                Document d = med.getDocument(id);

                if(req.equals("emprunt")){
                    //if(u.getType)
                    try{
                        med.emprunt(d, u);
                        //out.println("<script>alert('OK :d');</script>");
                        response.sendRedirect("emprunt.jsp");
                    }catch(EmpruntException e){
                        // Le livre à déjà été emprunté :/
                        //out.println("<script>alert('deja prit');</script>");
                        response.sendRedirect("emprunt.jsp");
                    }
                }else if(req.equals("retour")){
                    med.retour(d);
                    response.sendRedirect("retour.jsp");
                }else{

                }
            }
        }
    }

%>
