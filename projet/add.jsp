<%@ page import = "mdr.*" %>
<%@ page import = "mediatheque.*" %>
<%@ include file="header.jsp"%>
<%
    String a = request.getParameter("type");
    //out.println(a == null ? "lol" : a);

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
            Date Parution <input type = "text" name = "date">
            <br />
            Editeur: <input type = "text" name = "editeur" />
            <br />
            Genre: <input type = "text" name = "genre" />
            <input type="hidden" name="type" value="2"/>
    <%
    }else if(a.equals("pdf")){
    %>
            Date Parution <input type = "text" name = "date">
            <br />
            Editeur: <input type = "text" name = "editeur" />
            <br />
            Genre: <input type = "text" name = "genre" />
            <input type="hidden" name="type" value="3"/>
    <%
    }else{
        response.sendRedirect("./add.jsp?type=livre");
    }
    %>

            <input type = "submit" value = "Submit" />
        </form>
    <%
        out.println("Coucou");
    }
    %>


    </body>
</html>
