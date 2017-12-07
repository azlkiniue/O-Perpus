<%-- 
    Document   : test2
    Created on : Jun 19, 2017, 8:46:59 AM
    Author     : Diknas 113
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!${userSession.getUser_id()}</h1>
        <!--${list.get(1).getBiaya()}-->
    </body>
</html>
