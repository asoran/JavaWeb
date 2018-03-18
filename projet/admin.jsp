<%@ page import = "mdr.Status" %>
<%@ page session="false" import = "mdr.Livre" %>
<%

	String a = (String)request.getParameter("action");
	//out.println(a);
	if(a != null){
		Status.setStatus((a.equals("open") ? true : false));
	}

	boolean s = Status.isOpen();
	//out.println(s);
	out.println("<a href='?action=" + (s ? "close" : "open") + "'><img src='" + s + ".png'></a>");

	HttpSession session = request.getSession(true);
	session.setAttribute("doc", new Livre("Gobathy", "La vie"));
%>

<a href="acc.jsp">Retour</a>
