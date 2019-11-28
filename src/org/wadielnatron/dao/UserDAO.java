/**
 * 
 */
package org.wadielnatron.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.wadielnatron.dbconnection.PostgreSQLConnUtils;
import org.wadielnatron.beans.User;

/**
 * @author ahmed.kotb
 *
 */
public class UserDAO {
	private final Session session;

	public UserDAO(Session s) {
		session = s;
	}

	public Boolean SelectSpecificUser(String name) {
		User user = new User();
		Connection c = null;
		Statement stmt = null;
		Boolean exist = false;
		try {
			c = PostgreSQLConnUtils.establishDBConn();
			stmt = c.createStatement();
			String sql = "SELECT * FROM beheiraschema.beheirauser where name = '" + name + "'";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setRoleid(rs.getInt("roleid"));
				exist = true;

			}

			rs.close();
			stmt.close();
			c.close();

		} catch (Exception e) {
			System.out.println(e.getClass().getName() + ": " + e.getMessage());
		}
		return exist;
	}

	public String getPasswordByUsername(String username) {
		Connection c = null;
		Statement stmt = null;
		String password = null;
		try {
			c = PostgreSQLConnUtils.establishDBConn();
			stmt = c.createStatement();
			String sql = "SELECT * FROM beheiraschema.beheirauser where name= ?;";
			PreparedStatement ps = c.prepareStatement(sql);

			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				password = rs.getString("password");

			}

			rs.close();
			stmt.close();
			c.close();

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		System.out.println("Operation done successfully");
		return password;
	}

	public int addUser(User usr) {
		boolean exist = true;
		exist = SelectSpecificUser(usr.getName());
		int numOfRows = 0;
		Connection conn = PostgreSQLConnUtils.establishDBConn();
		PreparedStatement ps = null;
		if (conn != null) {
			try {
				if (!exist) {
					String sql = "INSERT INTO beheiraschema.beheirauser (name,password,email,identifynumber,phonenumber)"
							+ "VALUES(?,?,?,?,?)";
					ps = conn.prepareStatement(sql);
					ps.setString(1, usr.getName());
					ps.setString(2, usr.getPassword());
					ps.setString(3, usr.getEmail());
					ps.setString(4, usr.getIdentifynumber());
					ps.setString(5, usr.getPhoneNumber());

					numOfRows = ps.executeUpdate();
					System.out.println("Inserted records into the table...");
				} else {
					numOfRows = 0;
				}
			} catch (Exception e) {
				System.err.println(e.getClass().getName() + ": " + e.getMessage());
				System.exit(0);
			}
		}
		return numOfRows;
	}

	public int getUserRole(String username, String pwd) {
		User user = new User();
		Connection c = null;
		try {
			c = PostgreSQLConnUtils.establishDBConn();
			c.createStatement();
			SQLQuery query = session.createSQLQuery("select * from beheiraschema.beheirauser where name= ?");
			query.setParameter(0, username);
			@SuppressWarnings("unchecked")
			List<Object[]> rows = query.list();
			for (Object[] row : rows) {
				user.setName(row[1].toString());
				user.setPassword(row[2].toString());
				user.setEmail(row[3].toString());
				user.setIdentifynumber(row[4].toString());
				user.setPhoneNumber(row[5].toString());
				user.setRoleid(Integer.parseInt(row[6].toString()));
				user.setSalt(row[7].toString());
			}
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		System.out.println("Operation done successfully");
		return user.getRoleid();
	}

	public User getUserByName(String name) {
		User user = new User();
		Connection c = null;
		try {
			c = PostgreSQLConnUtils.establishDBConn();
			String sql = "select * from beheiraschema.beheirauser where name= ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setIdentifynumber(rs.getString("identifynumber"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				user.setRoleid(rs.getInt("roleid"));
				user.setSalt(rs.getString("salt"));
			}
			rs.close();
			c.close();
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		return user;
	}

	public User getUserByNameAndPassword(String name, String password) {
		User user = new User();
		Connection c = null;
		Statement stmt = null;
		try {
			c = PostgreSQLConnUtils.establishDBConn();
			stmt = c.createStatement();
			String sql = "SELECT * FROM beheiraschema.beheirauser where name= ? and password= ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				user.setRoleid(rs.getInt("roleid"));
				user.setSalt(rs.getString("salt"));
				user.setIdentifynumber(rs.getString("identifynumber"));
			}
			rs.close();
			stmt.close();
			c.close();
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		System.out.println("Operation done successfully");
		return user;
	}

	public List<User> getAllUsers() {
		List<User> usersList = new ArrayList<User>();
		SQLQuery query = session.createSQLQuery("select * from beheiraschema.beheirauser");
		@SuppressWarnings("unchecked")
		List<Object[]> rows = query.list();
		for (Object[] row : rows) {
			User user = new User();
			try {
				user.setName(row[1].toString());
				user.setPassword(row[2].toString());
				user.setEmail(row[3].toString());
				user.setIdentifynumber(row[4].toString());
				user.setPhoneNumber(row[5].toString());
				user.setRoleid(Integer.parseInt(row[6].toString()));
			} catch (Exception ex) {
				user.setRoleid(1);
			}
			usersList.add(user);
		}
		return usersList;
	}

	public boolean editUserRole(int roleid, String name) {
		boolean updateResult = false;
		int numOfRows = 0;
		Connection conn = PostgreSQLConnUtils.establishDBConn();
		PreparedStatement ps = null;
		if (conn != null) {
			try {

				String sql = "UPDATE beheiraschema.beheirauser SET roleid=? WHERE name=?;";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, roleid);
				ps.setString(2, name);
				numOfRows = ps.executeUpdate();
				System.out.println("Inserted records into the table...");
				if (numOfRows == 1) {
					updateResult = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return updateResult;
	}

	public boolean updateUser(String name, String email, String identifyNumber, String phoneNumber, int roleid,
			String hashedPassword, String salt) {
		boolean updateResult = false;
		int numOfRows = 0;
		Connection conn = PostgreSQLConnUtils.establishDBConn();
		PreparedStatement ps = null;
		if (conn != null) {
			try {
				String sql = "UPDATE beheiraschema.beheirauser SET email=?, identifynumber=?, phonenumber=?, roleid=?, password=?, salt=? WHERE name=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, identifyNumber);
				ps.setString(3, phoneNumber);
				ps.setInt(4, roleid);
				ps.setString(5, hashedPassword);
				ps.setString(6, salt);
				ps.setString(7, name);
				numOfRows = ps.executeUpdate();
				System.out.println("Updated Records: " + numOfRows);
				if (numOfRows == 1) {
					updateResult = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return updateResult;
	}
	
	public boolean updateUser(String name, String email, String identifyNumber, String phoneNumber, int roleid) {
		boolean updateResult = false;
		int numOfRows = 0;
		Connection conn = PostgreSQLConnUtils.establishDBConn();
		PreparedStatement ps = null;
		if (conn != null) {
			try {
				String sql = "UPDATE beheiraschema.beheirauser SET email=?, identifynumber=?, phonenumber=?, roleid=? WHERE name=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setString(2, identifyNumber);
				ps.setString(3, phoneNumber);
				ps.setInt(4, roleid);
				ps.setString(5, name);
				numOfRows = ps.executeUpdate();
				System.out.println("Updated Records: " + numOfRows);
				if (numOfRows == 1) {
					updateResult = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return updateResult;
	}

	public boolean removeUser(String name) {
		boolean removeResult = false;
		int numOfRows = 0;
		Connection conn = PostgreSQLConnUtils.establishDBConn();
		PreparedStatement ps = null;
		if (conn != null) {
			try {
				String sql = "DELETE FROM beheiraschema.beheirauser WHERE name=?;";
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				numOfRows = ps.executeUpdate();
				System.out.println("Deleted Records: " + numOfRows);
				if (numOfRows == 1) {
					removeResult = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return removeResult;
	}
	
	
	public User findByEmail(String email) {
		User user = new User();
		Connection c = null;
		try {
			c = PostgreSQLConnUtils.establishDBConn();
			String sql = "select * from beheiraschema.beheirauser where email= ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setIdentifynumber(rs.getString("identifynumber"));
				user.setPhoneNumber(rs.getString("phonenumber"));
				user.setRoleid(rs.getInt("roleid"));
				user.setSalt(rs.getString("salt"));
			}
			rs.close();
			c.close();
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		return user;
	}
}
