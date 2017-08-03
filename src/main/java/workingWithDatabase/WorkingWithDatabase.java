package workingWithDatabase;


import java.sql.*;

public class WorkingWithDatabase {

    public Connection connect;
    private CallableStatement callst;
    private java.sql.Statement statement;

    public WorkingWithDatabase() {
        String user = "root";
        String pass = "sql";
        String url = "jdbc:mysql://localhost:3306/applicationforproduction";
        String driver = "com.mysql.jdbc.Driver";
        try {
            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            connect = DriverManager.getConnection(url, user, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void executionProcedures(String sql) throws SQLException {

        callst = (CallableStatement) connect.prepareCall(sql);
        callst.executeUpdate(sql);

    }

    public ResultSet selectRequest(String sql) {
        try {
            statement = connect.createStatement();
            return statement.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ResultSet selectProcedures(String sql) {
        try {
            callst = (CallableStatement) connect.prepareCall(sql);
            return callst.executeQuery(sql);
        } catch (SQLException e1) {
            return null;
        }
    }
}

