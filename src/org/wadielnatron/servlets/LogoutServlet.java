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
import org.apache.shiro.SecurityUtils;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/logout" })
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getAnonymousLogger();

	public LogoutServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOGGER.info("\n========================================================\n" + "Request: Log Out\n"
				+ "Requested By: " + request.getSession().getAttribute("userName") + "\n"
				+ "Result: Logged out successfully" + "\n============================================================");
		request.getSession().removeAttribute("userName");
		org.apache.shiro.subject.Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");
		dispatcher.forward(request, response);
	}
}
