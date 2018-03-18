<%@ page import = "mdr.*" %>
<%@ page import = "mediatheque.*" %>
<%@ page import = "persistantdata.*" %>
<%@ page import = "java.util.List" %>
<%

	if(Status.isOpen()){
		//Doc mdr = (Livre)request.getSession(true).getAttribute("doc");
		Document mdr;
		Mediatheque med = Mediatheque.getInstance();
		List<Document> a = med.tousLesDocuments();
		out.println(a);

		for(Document b : a){
		%>
			<hr>
			<img src="<%= ((Doc)b).getType() %>.png" width='16px' height='16px' />
			<%= b %><br>
			<%
			Object[] c = ((Doc)b).affiche();
			%>
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

	}else{
		out.println("Allumez le serveur svp <a href='admin.jsp'>Page admin</a>");
	}
%>
