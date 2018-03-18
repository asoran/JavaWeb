<%@ page import ="accueilLog.jsp" %>	
	<%
	String userid=request.getParameter("user");
	session.putValue("userid",userid);
%>

<html>	
	<body>
		<p>welcome <%=userid%></p>
		<p>Vous etes connecte en tant qu'utilisateur</p>
	</body>
</html>