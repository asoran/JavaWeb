<%@ page import = "mediatheque.Status" %>
<%@ page import = "mediatheque.Utilisateur" %>

<%@ include file="header.jsp"%>
<%
    String a = request.getParameter("type");

    if(a == null){
        response.sendRedirect("./add.jsp?type=livre");
    }else{
%>
<html>
    <head>
        <title>Ajouter doc</title>
        <script>
            function mdr(a){
                console.log(a.selectedOptions[0].value);
                window.location.href = "./add.jsp?type=" + a.selectedOptions[0].value;
            }

        </script>
    </head>
    <body>
        <h1>Remplissez le formulaire d'ajoute de document svp (<%= a %>)</h1>
        <select name="text" onChange="mdr(this);">
            <option value="cd" <%= (a.equals("cd") ? "selected" : "") %>>CD</option>
            <option value="pdf" <%= (a.equals("pdf") ? "selected" : "") %>>PDF</option>
            <option value="livre" <%= (a.equals("livre") ? "selected" : "") %>>Livre</option>
        </select>

        <form action = "addBd.jsp" method = "POST">
            Titre: <input type = "text" name = "titre" />
            <br />
            Auteur: <input type = "text" name = "auteur" />
            <br />
    <%
    // Date parution / editeur / genre

    if(a.equals("livre")){
    %>
            Date Parution <input type = "text" name = "date">
            <br />
            Editeur: <input type = "text" name = "editeur" />
            <br />
            Genre: <input type = "text" name = "genre" />
            <input type="hidden" name="type" value="1"/>
    <%
    }else if(a.equals("cd")){
    %>
            Longueur (secondes) <input type = "number" name = "long">
            <br />
            Qualite (blueray / cd...): <input type = "text" name = "quality" />
            <br />
            <input type="hidden" name="type" value="2"/>
    <%
    }else if(a.equals("pdf")){
    %>
            Taille (pages): <input type = "number" name = "taille">
            <br />
            <input type="hidden" name="type" value="3"/>
    <%
    }else{
        response.sendRedirect("./add.jsp?type=livre");
    }
    %>

            <input type = "submit" value = "Submit" />
        </form>
    <%
    }
    %>
    </body>
</html>
