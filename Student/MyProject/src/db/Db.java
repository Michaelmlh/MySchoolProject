package db;

import java.sql.*;

public class Db {
	private Connection dbConn=null;
	private Statement stateMent=null;
	public Db() {
		String driverName="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String dbURL="jdbc:sqlserver://localhost:1433;DatabaseName=Student";
		String userName="guest06";
		String userPwd="mlh123";
		try {
			Class.forName(driverName);
			dbConn=DriverManager.getConnection(dbURL,userName,userPwd);
			System.out.println("Connection Succesful!");
		}catch(Exception e)	{
			System.out.println(e.getMessage());
		}
	}
	public int executeUpdate(String sql) throws SQLException {
		stateMent=dbConn.createStatement();
		return stateMent.executeUpdate(sql);
	}
	public ResultSet executeQuery(String sql) throws SQLException {
		stateMent=dbConn.createStatement();
		return stateMent.executeQuery(sql);
	}
	public void closeConn() throws SQLException {
		stateMent.close();
		dbConn.close();
	}
	public static void main(String[]args) {
		Db db=new Db();
		try {
			ResultSet rs = db.executeQuery("select 学号 ,姓名  from 学生  ");
			if(rs.next()) {
				System.out.println(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public PreparedStatement PreparedStatement(String sql) throws SQLException {
		return dbConn.prepareStatement(sql);
	}
}