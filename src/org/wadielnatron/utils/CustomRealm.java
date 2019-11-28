package org.wadielnatron.utils;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SaltedAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.realm.jdbc.JdbcRealm;
import org.hibernate.Session;
import org.wadielnatron.beans.User;
import org.wadielnatron.dao.UserDAO;
import org.wadielnatron.utils.HibernateUtil;
/**
 * @author ahmed.kotb
 *
 */
public class CustomRealm extends JdbcRealm {
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// identify account to log to
		UsernamePasswordToken userPassToken = (UsernamePasswordToken) token;
		final String username = userPassToken.getUsername();
		Object pwd = userPassToken.getCredentials();

		if (username == null) {
			System.out.println("Username is null.");
			return null;
		}

		// read password hash and salt from db
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		try {
			UserDAO userDAO = new UserDAO(session);

			final User user = userDAO.getUserByName(username);

			if (user == null) {
				System.out.println("No account found for user [" + username + "]");
				return null;
			}

			// return salted credentials
			SaltedAuthenticationInfo info = new SaltedAuthentificationInfo(username, user.getPassword(),
					user.getSalt());

			return info;
		} finally {
			session.getTransaction().commit();
			if (session.isOpen())
				session.close();
		}

	}
}
