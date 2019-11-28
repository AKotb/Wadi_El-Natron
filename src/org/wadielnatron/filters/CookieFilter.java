/**
 * 
 */
package org.wadielnatron.filters;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.wadielnatron.utils.HibernateUtil;
import org.wadielnatron.beans.User;
import org.wadielnatron.dao.UserDAO;
import org.wadielnatron.utils.Utils;

/**
 * @author ahmed.kotb
 *
 */
@WebFilter(filterName = "cookieFilter", urlPatterns = { "/*" })
public class CookieFilter implements Filter {

	public CookieFilter() {
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {

	}

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession httpsession = req.getSession();

		User userInSession = Utils.getLoginedUser(httpsession);
		//
		if (userInSession != null) {
			httpsession.setAttribute("COOKIE_CHECKED", "CHECKED");
			chain.doFilter(request, response);
			return;
		}

		// Connection was created in JDBCFilter.
		Connection conn = Utils.getStoredConnection(request);

		// Flag check cookie
		String checked = (String) httpsession.getAttribute("COOKIE_CHECKED");
		if (checked == null && conn != null) {
			String userName = Utils.getUserNameInCookie(req);
			try {
				Session session = HibernateUtil.getSessionFactory().openSession();
				session.beginTransaction();
				UserDAO userDAO = new UserDAO(session);
				User user;
				if(userName != null){
					
					user = userDAO.getUserByName(userName);
				}
				else {
					user = null;
				}
				Utils.storeLoginedUser(httpsession, user);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// Mark checked Cookies.
			httpsession.setAttribute("COOKIE_CHECKED", "CHECKED");
		}

		chain.doFilter(request, response);
	}
}
