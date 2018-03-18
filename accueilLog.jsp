
<html>
<head>
<meta charset="UTF-8">
</html>

	
	<%@ page import ="java.sql.Connection" %>
	<%@ page import ="java.sql.Date" %>
	<%@ page import ="java.sql.DriverManager" %>
	<%@ page import ="java.sql.PreparedStatement" %>
	<%@ page import ="java.sql.ResultSet" %>
	<%@ page import ="java.sql.SQLException" %>
	<%@ page import ="java.sql.Statement" %>

	
	<%@ page import ="javax.sql.*" %>

	<%
	String userid=request.getParameter("user");
	session.putValue("userid",userid);
	String pwd=request.getParameter("pwd");
	
	if (userid="admin" && pwd="admin") {
		out.println("ok");
	}
	
	else{ 
				if (validation= "ok"){
	
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@vs-oracle2:1521:ORCL","GRP201US12","GRP201US12");
	
	Statement st= con.createStatement();
	
	ResultSet rs=st.executeQuery("select * from users where login='"+userid+"'");
	
	if(rs.next()){
			if(rs.getString("MDP").equals(pwd)){ %>
					
					<% if (rs.getString("TYPEUSER").equals("biblio")){ %>
						
					<html>	
						<body>
					<meta http-equiv="refresh" content="0; url=biblio.jsp" /> 
					
						</body>
					</html> 	
					
					<% }else{ %>
						
					<html>	
						<body>
					<meta http-equiv="refresh" content="0; url=biblio.jsp" /> 
						</body>
					</html>
			
					<% }
			}else{ %>
					<html>	
						<body>
					<p>Invalid password try again</p>
					<a href="accueil.html">go back to connection</a>
					</body>
		
					</html>	
			<%}
	}
	else{ %>
		<html>	
						<body>
		<p>Invalid user name try again</p>
		<a href="accueil.html">go back to connection</a>
		</body>
		
					</html>	
	
	<%}
	
				}else {
				<html>	
						<body>
		<p>Le serveur n est pas active essayer de vous connecte ulterireurement ou appelé <br>
		la mediatheque au numero : 01-56-56-56-56 </p>
		</body>
		
					</html>	
			
					
					
	}
	}%>	
		
		

	
	
	
	
	
	
	<!--
	if(rs.next())
	{
	if(rs.getString(2).equals(pwd))
	{
	out.println("welcome"+userid);

	}
	else
	{
	out.println("Invalid password try again");
	}
	}
	else
	
	-->

	