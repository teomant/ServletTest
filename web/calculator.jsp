<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: Teomant
  Date: 08.04.2018
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="errorMessage.jsp"%>

<html>
<head>
    <title>Calculator</title>
</head>
<body>
<%
    String firstPrefill="";
    String secondPrefill="";
    Enumeration names = request.getParameterNames();
    if (request.getParameter("First")!=null) {
        firstPrefill = request.getParameter("First");
    }
    if (request.getParameter("Second")!=null) {
        secondPrefill = request.getParameter("Second");
    }

%>
    <form name="SimpleForm" action="calculator.jsp">
        First:<input type="text" name="First" value="<%=firstPrefill%>" size="30" />
        Second: <input type="text" name="Second" value="<%=secondPrefill%>" size="30" />
    <br/>
        <input type="submit" value="+" name="operation" width="20" />
        <input type="submit" value="-" name="operation" width="20" />
        <input type="submit" value="x" name="operation" width="20" />
        <input type="submit" value="/" name="operation" width="20" />
    </form>
    <br/>
    <%
        if (names.hasMoreElements()) {
            float value=0;
            float first = Float.parseFloat(request.getParameter("First"));
            float second = Float.parseFloat(request.getParameter("Second"));
            String operation = request.getParameter("operation");
            if (operation.equals("+")){
                value=first+second;
            }
            if (operation.equals("-")){
                value=(first-second);
            }
            if (operation.equals("x")){
                value=(first*second);
            }
            if (operation.equals("/")){
                value=(first/second);
            }%>
    <p><%=first%><%=operation%><%=second%>=<%=value%></p>

     <%   }
    %>

</body>
</html>
