/**
 * 
 */
package org.wadielnatron.servlets;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.hibernate.Session;
import org.wadielnatron.beans.User;
import org.wadielnatron.dao.UserDAO;
import org.wadielnatron.utils.Codes;
import org.wadielnatron.utils.HibernateUtil;
/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getAnonymousLogger();
	
	public LoginServlet() {
		super();
	}

	// Show Login page.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Forward to /WEB-INF/views/loginView.jsp
		// (Users can not access directly into JSP pages placed in WEB-INF)
		RequestDispatcher dispatcher
				= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		dispatcher.forward(request, response);

	}

	// When the user enters userName & password, and click Submit.
	// This method will be executed.
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher= null;
		HttpSession httpsession = request.getSession(true);
		User user = new User();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
			httpsession.setAttribute("errorCode", Codes.USER_NAME_AND_PASSWORD_NULL);
			dispatcher= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		} else {
			Session session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			boolean exist = tryLogin(userName, password);
			if (exist) {
				try {
					UserDAO userdao = new UserDAO(session);
					user = userdao.getUserByName(userName);
					int userRole = user.getRoleid();
					String userRoleSt = userRole+"";
					httpsession.setAttribute("user", user);
					httpsession.setAttribute("userName", user.getName());
					httpsession.setAttribute("userRole", userRoleSt);
					session.getTransaction().commit();
            		dispatcher= this.getServletContext().getRequestDispatcher("/home");
				}
				finally {
					if (session.isOpen())
						session.close();
				}
			} else {
				httpsession.setAttribute("errorCode", Codes.USER_NAME_OR_PASSWORD_INCORRECT);
				dispatcher= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
			}
		}
		dispatcher.forward(request, response);
	}
	
	private boolean tryLogin(String username, String password) {
		Subject currentUser = SecurityUtils.getSubject();
		if (!currentUser.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(username, password);
			try {
				currentUser.login(token);
				LOGGER.info("\n========================================================\n"+
							"Request: Log In\n"+
							"Requested By: " + currentUser.getPrincipal().toString() + "\n"+
							"Date: " + currentUser.getSession().getLastAccessTime()+ "\n"+
							"Result: Logged in successfully"+
							"\n============================================================");
				currentUser.getSession().setAttribute("username", username);
				return true;
			} catch (UnknownAccountException uae) {
				LOGGER.info("\n========================================================\n"+
							"Request: Log In\n"+
							"Requested By: " + username + "\n"+
							"Date: " + currentUser.getSession().getLastAccessTime()+ "\n"+
							"Result: Fail\n"+
							"Cause: There is no user with username of " + token.getPrincipal() +
							"\n============================================================");
			} catch (IncorrectCredentialsException ice) {
				LOGGER.info("\n========================================================\n"+
							"Request: Log In\n"+
							"Requested By: " + username + "\n"+
							"Date: " + currentUser.getSession().getLastAccessTime()+
							"Result: Fail\n"+
							"Cause: Password for account " + token.getPrincipal() + " was incorrect!"+
							"\n============================================================");
			} catch (LockedAccountException lae) {
				LOGGER.info("\n========================================================\n"+
							"Request: Log In\n"+
							"Requested By: " + username + "\n"+
							"Date: " + currentUser.getSession().getLastAccessTime()+ "\n"+
							"Result: Fail\n"+
							"Cause: The account for username " + token.getPrincipal() + " is locked. Please contact your administrator to unlock it."+
							"\n============================================================");
			} catch (AuthenticationException ae) {

			}
		} else {
			return true; // already logged in
		}
		return false;
	}


}
