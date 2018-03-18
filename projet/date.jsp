<%@ page import = "java.util.Date" %>
<%
	Date today = new Date();
%>
<html>
	<head>
		<title>Test JSP</title>
	</head>
	<body>
		
		<h1>Bonjour <%= request.getParameter("name") %>, on est le <%= today.toString() %></h1>
		
	</body>
</html>