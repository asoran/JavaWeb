
	<%
	string idPage = session.getAttribute("user", userid); 
	%>

<html>	
	<body>
		<p>welcome <%=idPage%></p>
		<p>Vous etes connecte en tant que bibliothecaire</p>
	</body>
</html>