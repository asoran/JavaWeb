

	
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
	
	if(verif){
		session.set("user", new Users(userid));
	}
	
	Class.forName("oracle.jdbc.OracleDriver");
	
	java.sql.Connection con = DriverManager.getConnection("jdbc:oracle:thin:@vs-oracle2:1521:ORCL","GRP201US12","GRP201US12");
	
	Statement st= con.createStatement();
	
	ResultSet rs=st.executeQuery("select * FROM users ");
	

	
	
	while(rs.next()){
				int id = rs.getInt("IDUSER");
				String log= rs.getString("LOGIN");
				String mdp = rs.getString("MDP");
				String typ = rs.getString("TYPEUSER");  %>
		
	<html>
		<body>
	Bonjour, ID  : <%=id %> , log : <%=log %> , mdp: <%=mdp %> , type: <%=typ %> <br>
	
		</body>
	</html>
	
	<% }%>		
				
			
	
	
	
	
	
	
	
	
	
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

	