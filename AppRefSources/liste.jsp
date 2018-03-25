<%@ page import = "mediatheque.Status" %>
<%@ page import = "mediatheque.Utilisateur" %>
<%@ page import = "java.util.List" %>
<%@ page import = "mediatheque.Doc" %>
<%@ page import = "mediatheque.Document" %>
<%@ page import = "mediatheque.Mediatheque" %>

<%@ include file="header.jsp"%>
<%
	if(Status.isOpen() && session.getAttribute("user") != null){
		Utilisateur u = (Utilisateur)session.getAttribute("user");
		out.println("Bonjour " + u + "<hr>Voici tout les documents : </br>");

		Mediatheque med = Mediatheque.getInstance();
		List<Document> a = med.tousLesDocuments();

		for(Document b : a){
		%>
			<hr>
			<img src="img/<%= ((Doc)b).getType() %>.png" width='16px' height='16px' />
			<%
			Object[] c = ((Doc)b).affiche();
			%>
			<ul>
			<%
			for(int i = 0; i < c.length; i+= 2){
					%>
					<li><%= c[i] %> : <%= c[i+1] %></li>
					<%
			}
			%>
			</ul>
		<%
		}

	}else{
		out.println("Allumez le serveur svp <a href='admin.jsp'>Page admin</a>");
	}
%>
