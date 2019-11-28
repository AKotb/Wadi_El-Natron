/**
 * 
 */
package org.wadielnatron.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.hibernate.Session;
import org.wadielnatron.beans.User;
import org.wadielnatron.dao.UserDAO;
import org.wadielnatron.utils.Codes;
import org.wadielnatron.utils.HibernateUtil;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/registerView.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpsession = request.getSession(true);
		RequestDispatcher dispatcher = null;
		boolean exist;
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String ID = request.getParameter("identication_id");
		String telephone = request.getParameter("telephone");
		if (name.isEmpty() || email.isEmpty() || password.isEmpty() || telephone.isEmpty() || ID.isEmpty()) {
			httpsession.setAttribute("message", Codes.INCOMPLETE_DATA);
			dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/registerView.jsp");
		} else {
			Session session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			try {
				UserDAO userdao = new UserDAO(session);
				exist = userdao.SelectSpecificUser(name);
				if (!exist) {
					register(session, name, password, email, telephone, ID);
					session.getTransaction().commit();
					httpsession.setAttribute("message", Codes.USER_ADDED_SUCCESSFULLY);
					dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/successView.jsp");
				} else {
					httpsession.setAttribute("message", Codes.USER_ALREADY_EXIST);
					dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/registerView.jsp");
				}
			} catch (Exception ex) {
				httpsession.setAttribute("message", Codes.USER_ADD_FAILED);
				dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/registerView.jsp");
			} finally {
				if (session.isOpen())
					session.close();
			}
		}
		dispatcher.forward(request, response);
	}

	private void register(Session session, String name, String plainTextPassword, String mail, String phone,
			String identificationID) {
		User user = new User();
		user.setName(name);
		user.setPassword(plainTextPassword);
		user.setEmail(mail);
		user.setPhoneNumber(phone);
		user.setRoleid(1);
		user.setIdentifynumber(identificationID);
		generatePassword(user, plainTextPassword);
		session.save(user);
	}
	
	/**
	 *  method to hash the plain-text password with the random salt and multiple
	 *  iterations and then Base64-encode the value (requires less space than Hex)
	 * @param user
	 * @param plainTextPassword
	 */
	private void generatePassword(User user, String plainTextPassword) {
		RandomNumberGenerator rng = new SecureRandomNumberGenerator();
		Object salt = rng.nextBytes();
		String hashedPasswordBase64 = new Sha256Hash(plainTextPassword, salt, 1024).toBase64();
		user.setPassword(hashedPasswordBase64);
		user.setSalt(salt.toString());
	}
}
