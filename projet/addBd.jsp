<%@ page import = "mdr.*" %>
<%@ page import = "mediatheque.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%
    if(request.getMethod().equals("POST")){

        List<String> mdr = new ArrayList<String>();
        Mediatheque med = Mediatheque.getInstance();
        //med.nouveauDocument(request.getParameter("type")), request.getParameterValues());

        mdr.add(request.getParameter("titre"));
        mdr.add(request.getParameter("auteur"));
        int type = Integer.parseInt(request.getParameter("type"));
        switch (type) {
            case 1: // livre
                mdr.add(request.getParameter("date"));
                mdr.add(request.getParameter("editeur"));
                mdr.add(request.getParameter("genre"));
                break;
            case 2: // cd
            mdr.add(request.getParameter("date"));
            mdr.add(request.getParameter("editeur"));
            mdr.add(request.getParameter("genre"));
                break;
            case 3: // pdf
            mdr.add(request.getParameter("date"));
            mdr.add(request.getParameter("editeur"));
            mdr.add(request.getParameter("genre"));
                break;
        }
        Object[] all = mdr.toArray();

        out.println(all.toString() + "<br>");
        for(Object i : all){
            out.println(i + "<br>");
        }
        med.nouveauDocument(type, all);
        response.sendRedirect("acc.jsp");
    }else{
        response.sendRedirect("add.jsp");
    }

%>
