<%@ page import = "mdr.*" %>
<%@ page import = "mediatheque.Utilisateur" %>
<%@ include file="header.jsp"%>
<%
	if(session.getAttribute("user") != null && ((Utilisateur)session.getAttribute("user")).getId() == 0){
		String a = (String)request.getParameter("action");
		//out.println(a);
		if(a != null){
			Status.setStatus((a.equals("open") ? true : false));
		}

		boolean s = Status.isOpen();
		//out.println(s);
		out.println("<a href='?action=" + (s ? "close" : "open") + "'><img src='" + s + ".png'></a>");
	}else{
%>

	<a href="login.jsp">LOGEZ VOUS EN TANT QU'ADMIN</a>

<%
	}
%>
