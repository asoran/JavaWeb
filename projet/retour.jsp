<%@ page import = "mdr.*" %>
<%@ page import = "mediatheque.*" %>
<%@ page import = "java.util.List" %>
<%@ include file="header.jsp"%>
<%

	if(Status.isOpen() && session.getAttribute("user") != null){
		//Doc mdr = (Livre)request.getSession(true).getAttribute("doc");
		Utilisateur u = (Utilisateur)session.getAttribute("user");
		out.println("Bonjour " + u + "<hr>Voici vos docs : </br>");

		Document mdr;
		Mediatheque med = Mediatheque.getInstance();
		List<Document> a = med.tousLesDocuments();

		out.println(a);

		for(Document b : a){
			if(((Doc)b).getTaken() == u.getId()){
		%>
			<hr>
			<img src="<%= ((Doc)b).getType() %>.png" width='16px' height='16px' />
			<%= b %><br>
			<%
			Object[] c = ((Doc)b).affiche();
			%>
			<a href="service.jsp?action=retour&id=<%= ((Doc)b).getId() %>">Retour</a>
			<ul>
			<li><%= c[0] %></li>
			<li><%= c[1] %></li>
			<%
			for(int i = 2; i < c.length; i+= 2){
					%>
					<li><%= c[i] %> : <%= c[i+1] %></li>
					<%
			}
			%>
			</ul>
		<%
			}
		}

	}else{
		out.println("Allumez le serveur svp <a href='admin.jsp'>Page admin</a>");
	}
%>
<a href="add.jsp">AJOUTER UN DOC</a>
