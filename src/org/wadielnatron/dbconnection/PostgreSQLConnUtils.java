/**
 * 
 */
package org.wadielnatron.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author ahmed.kotb
 *
 */
public class PostgreSQLConnUtils {
	private static final String dbDriverName = "org.postgresql.Driver";
	private static String dbName = "postgres";
	private static String dbUserName = "postgres";
	private static String dbPassword = "P@ssw0rd";
	private static String unicode= "?useUnicode=yes&characterEncoding=UTF-8";
	

	public PostgreSQLConnUtils() {
		super();
	}

	public static Connection establishDBConn() {
		Connection con = null;
		try {
			Class.forName(dbDriverName);
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/" + dbName+unicode, dbUserName, dbPassword);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return con;
	}
	
	public static void closeQuietly(Connection con) {
        try {
            con.close();
        } catch (Exception e) {
        }
    }
 
    public static void rollbackQuietly(Connection con) {
        try {
            con.rollback();
        } catch (Exception e) {
        }
    }
}
