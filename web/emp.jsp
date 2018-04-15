<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*" %>
<%@ page import="test.ClassForRequest" %><%--
  Created by IntelliJ IDEA.
  User: Teomant
  Date: 08.04.2018
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="errorMessage.jsp"%>

<html>
<head>
    <title>empliyees</title>
</head>
<body>
<script language="javascript">
    function tableCreate(text) {
        arr1=text.split('<br/>');
        var body = document.getElementsByTagName('body')[0];
        var tbl = document.createElement('table');
        tbl.style.width = '100%';
        tbl.setAttribute('border', '1');
        var tbdy = document.createElement('tbody');
        var tr1 = document.createElement('tr');
        var empno=document.createElement('td');
        empno.appendChild(document.createTextNode('EMPNO'));
        var ename=document.createElement('td');
        ename.appendChild(document.createTextNode('ENAME'));
        var job=document.createElement('td');
        job.appendChild(document.createTextNode('JOB'));
        var mgr=document.createElement('td');
        mgr.appendChild(document.createTextNode('MGR'));
        var hiredate=document.createElement('td');
        hiredate.appendChild(document.createTextNode('HIREDATE'));
        var sal=document.createElement('td');
        sal.appendChild(document.createTextNode('SAL'));
        var comm=document.createElement('td');
        comm.appendChild(document.createTextNode('COMM'));
        var deptno=document.createElement('td');
        deptno.appendChild(document.createTextNode('DEPTNO'));
        var deptname=document.createElement('td');
        deptname.appendChild(document.createTextNode('DEPTNAME'));
        var deptloc=document.createElement('td');
        deptloc.appendChild(document.createTextNode('DEPTLOC'));
        var salgrade=document.createElement('td');
        salgrade.appendChild(document.createTextNode('SALGRADE'));
        tr1.appendChild(empno);
        tr1.appendChild(ename);
        tr1.appendChild(job);
        tr1.appendChild(mgr);
        tr1.appendChild(hiredate);
        tr1.appendChild(sal);
        tr1.appendChild(comm);
        tr1.appendChild(deptno);
        tr1.appendChild(deptname);
        tr1.appendChild(deptloc);
        tr1.appendChild(salgrade);
        tbdy.appendChild(tr1);
        for (var i = 0; i < arr1.length-1; i++) {
            var tr = document.createElement('tr');
            arr2=arr1[i].split(' ');
            for (var j = 0; j < arr2.length; j++) {
                var td = document.createElement('td');
                td.appendChild(document.createTextNode(arr2[j].split('=')[1]));
                tr.appendChild(td)
            }
            tbdy.appendChild(tr);
        }
        tbl.appendChild(tbdy);
        body.appendChild(tbl);
    }
</script>
    <form>
        <table>
            <tr>
                <td>ID to search:</td>
                <td><input type="text" name="id" value="" width="50" size="30" /></td>
                <td><input type="submit" value="Search by ID" name="operation" width="30" /></td>
            </tr>
            <tr>
                <td>Name to search:</td>
                <td><input type="text" name="name" value="" width="50" size="30" /></td>
                <td><input type="submit" value="Search by name" name="operation" width="30" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Show all" name="operation" width="30" /></td>
            </tr>
        </table>
        <%
            String result="";
            if (request.getParameter("operation")!=null) {

                if (request.getParameter("operation").equals("Search by ID")){

                    result= ClassForRequest.getById(Integer.parseInt(request.getParameter("id")));
                }
                if (request.getParameter("operation").equals("Search by name")){
                    result= ClassForRequest.getByName(request.getParameter("name"));
                }
                if (request.getParameter("operation").equals("Show all")){
                    result= ClassForRequest.getAll();
                }
            }
        %>
        <br/>
        <script language="javascript">
            tableCreate('<%=result%>');
        </script>

    </form>
</body>
</html>
