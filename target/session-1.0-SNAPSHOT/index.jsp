<%@page import="java.util.ArrayList"%>
<%@page import="com.emergente.session.Producto"%>
<%
    if(session.getAttribute("lista") == null){
        ArrayList<Producto> listaAux = new ArrayList<Producto>();
        session.setAttribute("lista", listaAux);
        
    }
    
    ArrayList<Producto> lista = (ArrayList<Producto>)session.getAttribute("lista");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Tareas Pendientes</h1>
    </center>

                <form action="MainServlet" method="POST">
            <table>
                <tr>
                    <th>Id</th>
                    <th><input type="text" name="id" value=""> </th>
                </tr>
                <tr>
                    <th>Tarea</th>
                    <th><input type="text" name="tarea" value=""> </th>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Procesar"></td>
                </tr>
            </table>
        </form>
        
        <a href="MainServlet?op=vaciar">Vaciar lista</a>
        <center>
        <h2>Lista de Pendientes</h2>
            
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th></th>
            </tr>
            <tr>
            <%
            if(lista != null){
                for(Producto p: lista){
            %>
                <td><%= p.getId() %></td>
                <td><%= p.getTarea() %></td>
                
                <td><a href="MainServlet?op=check&id=<%= p.getId() %>"><input type="checkbox"<%= (p.isCompletado())? "checked":"" %>/>check</a> </td>
                <td><a href="MainServlet?op=eliminar&id=<%= p.getId() %>">eliminar</a></td>
            </tr>
            <%
                }    
            }
            %>
        </table>   
    </center>     
    </body>
</html>
