<%@ page import = "mediatheque.Status" %>
<%@ page import = "mediatheque.Utilisateur" %>
<%@ include file="header.jsp"%>
<%
	if(session.getAttribute("user") != null && ((Utilisateur)session.getAttribute("user")).getId() == 0){
		String a = (String)request.getParameter("action");

		if(a != null){
			Status.setStatus((a.equals("open") ? true : false));
		}

		boolean s = Status.isOpen();
		out.println("Le service est " + (s ? "open" : "fermé") + " !");
		out.println("<a href='?action=" + (s ? "close" : "open") + "'><img src='img/" + s + ".png'></a>");
	}else{
%>
	<a href="login.jsp">LOGEZ VOUS EN TANT QU'ADMIN</a>
<%
	}
%>
