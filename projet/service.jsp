<%@ page import = "mdr.*" %>
<%@ page import = "mediatheque.*" %>
<%@ page import = "java.util.List" %>
<%
    Mediatheque med = Mediatheque.getInstance();

    if(Status.isOpen()){
        if(session.getAttribute("user") != null){
            Utilisateur u = (Utilisateur)session.getAttribute("user");
            if(request.getParameter("action") != null && request.getParameter("id") != null){
                String req = request.getParameter("action");
                int id = Integer.parseInt(request.getParameter("id"));
                Document d = med.getDocument(id);

                if(req.equals("emprunt")){
                    //if(u.getType)
                    try{
                        med.emprunt(d, u);
                        //out.println("<script>alert('OK :d');</script>");
                        response.sendRedirect("acc.jsp");
                    }catch(EmpruntException e){
                        // Le livre à déjà été emprunté :/
                        //out.println("<script>alert('deja prit');</script>");
                        response.sendRedirect("acc.jsp");
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
