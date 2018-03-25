<%
    if(session.getAttribute("user") != null){
        session.removeAttribute("user");
        response.sendRedirect("login.jsp");
        return;
    }
%>
