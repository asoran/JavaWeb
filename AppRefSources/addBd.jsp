<%@ page import = "mediatheque.Mediatheque" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>

<%
    if(request.getMethod().equals("POST")){

        List<Object> envoie = new ArrayList<Object>();
        Mediatheque med = Mediatheque.getInstance();
        //med.nouveauDocument(request.getParameter("type")), request.getParameterValues());

        envoie.add(request.getParameter("titre"));
        envoie.add(request.getParameter("auteur"));
        int type = Integer.parseInt(request.getParameter("type"));
        switch (type) {
            case 1: // livre
                envoie.add(request.getParameter("date"));
                envoie.add(request.getParameter("editeur"));
                envoie.add(request.getParameter("genre"));
                break;
            case 2: // cd
            envoie.add(Integer.parseInt(request.getParameter("long")));
            envoie.add(request.getParameter("quality"));
                break;
            case 3: // pdf
            envoie.add(Integer.parseInt(request.getParameter("taille")));
                break;
        }
        out.println(envoie);
        Object[] all = envoie.toArray();
        med.nouveauDocument(type, all);

        out.println("<a href='liste.jsp'>Ajoute reussie, cliquez ici pour retournez à la liste !</a>");
        //response.sendRedirect("liste.jsp");
    }else{
        out.println("<a href='add.jsp'>Ajoute rate..., cliquez ici pour retournez au formulaire !</a>");
        //response.sendRedirect("add.jsp");
    }

%>
