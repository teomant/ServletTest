package test;

import java.sql.*;

public class ClassForRequest {

    public static String getAll() throws SQLException, ClassNotFoundException{
        String result="";
        Connection c;
        Statement stmt;
        Class.forName("org.postgresql.Driver");
        c = DriverManager
                .getConnection("jdbc:postgresql://localhost:5432/netcracker","postgres", "tempus");
        c.setAutoCommit(false);
        String sql;
        stmt = c.createStatement();
        sql = "SELECT DISTINCT * FROM EMP, SALGRADE, dept " +
                "WHERE (SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL) AND" +
                "(dept.deptno=emp.deptno)"+
                "ORDER BY empno";
        ResultSet rs =stmt.executeQuery(sql);
        while (rs.next()) {
            result+="EMPNO="+rs.getInt("EMPNO")+" NAME="+rs.getString("ename")+
                    " JOB="+rs.getString("job")+" MGR="+rs.getString("mgr") +
                    " HIREDATE=" +rs.getDate("hiredate")+" SAL="+rs.getDouble("sal")+
                    " COMM="+rs.getDouble("comm")+" DEPTNO="+rs.getInt("deptno")+
                    " DEPTNAME="+rs.getString("dname")+" DEPTLOC="+rs.getString("loc").replaceAll(" ","-")+
                    " SALGRADE="+rs.getInt("grade")+"<br/>";
        }
        rs.close();
        stmt.close();
        c.commit();
        c.close();

        return result;
    }

    public static String getById(int id) throws SQLException, ClassNotFoundException{
        String result="";
        Connection c;
        Class.forName("org.postgresql.Driver");
        c = DriverManager
                .getConnection("jdbc:postgresql://localhost:5432/netcracker","postgres", "tempus");
        c.setAutoCommit(false);
        PreparedStatement preparedStatement = c.prepareStatement(
                "SELECT DISTINCT * FROM EMP, SALGRADE, dept " +
                        "WHERE (emp.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL) AND" +
                        "(emp.deptno=dept.deptno) AND (emp.EMPNO=?)");
        preparedStatement.setInt(1, id);
        ResultSet rs =preparedStatement.executeQuery();
        c.commit();

        while (rs.next()) {
            result += "EMPNO=" + rs.getInt("EMPNO") + " NAME=" + rs.getString("ename") +
                    " JOB=" + rs.getString("job") + " MGR=" + rs.getString("mgr") +
                    " HIREDATE=" + rs.getDate("hiredate") + " SAL=" + rs.getDouble("sal") +
                    " COMM=" + rs.getDouble("comm") + " DEPTNO=" + rs.getInt("deptno") +
                    " DEPTNAME=" + rs.getString("dname") + " DEPTLOC=" + rs.getString("loc") +
                    " SALGRADE=" + rs.getInt("grade") + "<br/>";
        }
        rs.close();
        c.commit();
        c.close();
        return result;
    }

    public static String getByName(String name) throws SQLException, ClassNotFoundException{
        String result="";
        Connection c;
        Class.forName("org.postgresql.Driver");
        c = DriverManager
                .getConnection("jdbc:postgresql://localhost:5432/netcracker","postgres", "tempus");
        c.setAutoCommit(false);
        PreparedStatement preparedStatement = c.prepareStatement(
                "SELECT DISTINCT * FROM EMP, SALGRADE, dept " +
                        "WHERE (emp.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL) AND" +
                        "(emp.deptno=dept.deptno) AND (emp.ename=?)");
        preparedStatement.setString(1, name);
        ResultSet rs =preparedStatement.executeQuery();
        c.commit();

        while (rs.next()) {
            result += "EMPNO=" + rs.getInt("EMPNO") + " NAME=" + rs.getString("ename") +
                    " JOB=" + rs.getString("job") + " MGR=" + rs.getString("mgr") +
                    " HIREDATE=" + rs.getDate("hiredate") + " SAL=" + rs.getDouble("sal") +
                    " COMM=" + rs.getDouble("comm") + " DEPTNO=" + rs.getInt("deptno") +
                    " DEPTNAME=" + rs.getString("dname") + " DEPTLOC=" + rs.getString("loc") +
                    " SALGRADE=" + rs.getInt("grade") + "<br/>";
        }
        rs.close();
        c.commit();
        c.close();
        return result;
    }

}
